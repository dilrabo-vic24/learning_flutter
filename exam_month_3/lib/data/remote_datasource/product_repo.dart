import 'dart:convert';
import 'dart:developer';

import 'package:exam_month_3/common/network_constants.dart';
import 'package:exam_month_3/common/service/injection_container.dart';
import 'package:exam_month_3/common/utils/cache_helper.dart';
import 'package:exam_month_3/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductRepo extends ChangeNotifier {
  Future<ProductModel> getAllProduct() async {
    final token = getIt<CacheHelper>().getToken();
    log("token $token");
    final url = Uri.parse(NetworkConstants.allProductsUrl);

    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode == 200) {
      log(response.body);
      final data = jsonDecode(response.body);
      // log(allProducts.toString());
      return ProductModel.fromJson(data);
    } else {
      throw Exception("error while getting all products");
    }
  }
}
