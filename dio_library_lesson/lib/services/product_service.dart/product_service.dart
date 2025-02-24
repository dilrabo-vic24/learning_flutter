import 'dart:developer';
import 'package:dio/dio.dart';

import 'package:dio_library_lesson/services/dio_service/dio_client.dart';
import 'package:dio_library_lesson/services/models/product_model.dart';

class ProductService {
  final DioClient dioClient = DioClient();

  Future<List<Product>> getProducts() async {
    try {
      final token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjc5NDkzNDZmOTdmMjA5ZTlkY2Y2MDhiIiwiaWF0IjoxNzQwNDE3NTcwfQ.0_eo1xjA9PhrJZ-Eg-fi18PtAXk-q5JfPDKkKgZAF8s";
      final response =
          await dioClient.dio.get("https://e-commerce.birnima.uz/api/products",
              options: Options(
                headers: {"Authorization": "Bearer $token"},
                extra: {"requiresToken": true},
              ));
      // final data = jsonDecode(response.data);
      log("Products: ${response.data}");

      final payload = ProductModel.fromJson(response.data);
      return payload.data ?? [];
    } catch (e) {
      throw Exception("Error while getting products: $e");
    }
  }
}
