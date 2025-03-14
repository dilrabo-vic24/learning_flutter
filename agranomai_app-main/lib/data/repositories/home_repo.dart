import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:agranom_ai/common/app/injcetion_container.dart';
import 'package:agranom_ai/common/constant/network_constant.dart';
import 'package:agranom_ai/data/models/get_predict_dto.dart';
import 'package:agranom_ai/data/repositories/custom_dio_client.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

abstract class HomeRepo {
  Future<String?> getImageUrl({required File imageFile});
  Future<GetPredictDto?> getPredict({required String imagePath});
}

class HomeRepoImpl implements HomeRepo {
  final dioClient = getIt<DioClient>();
  Uint8List? image;

  // void _imageToByte(File imageFile) {
  //   image = base64Decode(imageFile.path);
  // }

  @override
  Future<String?> getImageUrl({required File imageFile, String? folder}) async {
    try {
      String fileName = imageFile.path.split('/').last;
      var fileExt = fileName.split('.').last;

      if (!['jpg', 'jpeg', 'png'].contains(fileExt.toLowerCase())) {
        throw Exception('Unsupported file type. Please use JPG or PNG images.');
      }

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
          contentType: MediaType("image", fileExt),
        ),
      });

      final response = await dioClient.dio.post(
        NetworkConstants.uploadUrl,
        data: formData,
        queryParameters: folder != null ? {"folder": folder} : {},
        options: Options(
          extra: {"requiresToken": true},
          headers: {
            "Authorization": "Bearer ${NetworkConstants.token}",
          },
        ),
      );

      if (response.statusCode == 201) {
        final payload = response.data["data"]["url"];
        log("Uploaded URL: $payload");
        return payload;
      } else {
        throw Exception("Failed to upload image. Please try again.");
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");
      log("Dio Error Type: ${e.type}");
      log("Dio Error Response: ${e.response?.data}");

      String errorMessage = 'Failed to upload image. ';
      if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage +=
            'Connection timed out. Please check your internet connection.';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage += 'No internet connection.';
      } else if (e.response?.statusCode == 413) {
        errorMessage +=
            'Image size is too large. Please choose a smaller image.';
      } else {
        errorMessage += 'Please try again later.';
      }

      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected Error: $e");
      throw Exception("An unexpected error occurred. Please try again later.");
    }
  }

  @override
  Future<GetPredictDto?> getPredict({required String imagePath}) async {
    try {
      log("Image Path: $imagePath");
      final response = await dioClient.dio.post(
        NetworkConstants.predictUrl,
        data: jsonEncode({"image_path": imagePath}),
        options: Options(
          extra: {"requiresToken": true},
          headers: {
            "Authorization": "Bearer ${NetworkConstants.token}", // Token
          },
        ),
      );

      if (response.statusCode == 201) {
        final payload = response.data;
        log("Data fetching...: $payload");
        return GetPredictDto.fromJson(payload);
      } else if (response.statusCode == 422) {
        log("Jigar bu senmi?..........: ${response.statusCode}");
      } else {
        throw Exception("Server returned status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      log("Dio Error: ${e.message}");
      log("Dio Error Type: ${e.type}");
      log("Dio Error Response: ${e.response?.data}");
      throw Exception("Error happened while predict: ${e.message}");
    } catch (e) {
      log("Error fetchin data: $e");
      throw Exception("Unexpected error: $e");
    }
    return null;
  }
}
