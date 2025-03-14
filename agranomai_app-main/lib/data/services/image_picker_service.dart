import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage({required bool fromCamera}) async {
    final XFile? image = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
