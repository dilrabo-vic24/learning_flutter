import 'dart:io';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageService extends ChangeNotifier {
  File? image;
  bool isUploading = false;
  String? imageUrl;
  String message = "";

  List<String> images = [];
  Dio dio = Dio();

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> postImage() async {
    if (image == null) return;
    isUploading = true;
    notifyListeners();

    final url = "https://1027-89-236-218-41.ngrok-free.app/upload";

    try {
      String fileName = image!.path.split("/").last;
      var fileExt = fileName.split(".").last;

      if (!["jpg", "jpeg", "png"].contains(fileExt)) {
        throw Exception("Unsupported file type");
      }

      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(image!.path, filename: fileName),
      });

      Response response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {"Content-type": "multipart/form-data"},
        ),
      );
      log("nimadir");

      if (response.statusCode == 200) {
        imageUrl = response.data["url"];
        log("uploaded");
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isUploading = false;
      notifyListeners();
    }
  }

  Future<void> fetchImages() async {
    final url = "https://1027-89-236-218-41.ngrok-free.app/images";

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = List<String>.from(response.data["images"]);

        images = data
            .where(
              (e) =>
                  e.endsWith('.jpg') ||
                  e.endsWith('.png') ||
                  e.endsWith('.jpeg'),
            )
            .toList();

        log("only images: $images");
        notifyListeners();
      }
    } catch (e) {
      log("error while fetching images: $e");
    }
  }

  Future<void> downloadImage(String url) async {
    try {
      Response<List<int>> response = await dio.get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/downloaded_image.jpg";
      File file = File(filePath);
      await file.writeAsBytes(response.data!);

      log("image downloaded: $filePath");
      message = "Image downloaded";
      notifyListeners();
    } catch (e) {
      log("error while downloading image: $e");
    }
  }

  void selectImage(String url) {
    imageUrl = url;
    notifyListeners();
  }
}

// Future<File?> pickImage() async {
//   final ImagePicker imagePicker = ImagePicker();

//   File? image;

//   XFile? pickedImage = await imagePicker.pickImage(
//     source: ImageSource.camera,
//   );
//   if (pickedImage != null) {
//     image = File(pickedImage.path);
//   }

//   return image;
// }

// Future<String?> postImage(File file) async {
//   Dio dio = Dio();

//   final url = "http://localhost:5000/upload";
//   try {
//     log(file.path.split("/").toString());
//     log(file.path.toString());

//     String fileName = file.path.split("/").last;
//     var fileExt = fileName.split(".").last;
//     log(fileExt);

//     if (!["jpg", "jpeg", "png"].contains(fileExt)) {
//       throw Exception("Unsupported file type");
//     }

//     FormData formData = FormData.fromMap(
//         {"file": await MultipartFile.fromFile(file.path, filename: fileName)});

//     Response response = await dio.post(
//       url,
//       data: formData,
//       options: Options(
//         headers: {"content-type": "multipart/form-data"},
//       ),
//     );

//     if (response.statusCode == 200) {
//       log("Image uploaded successfully: ${response.data}");
//     } else {
//       log("Error: ${response.statusMessage}");
//     }
//   } catch (e) {
//     log(e.toString());
//   }
// }
