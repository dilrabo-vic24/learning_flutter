import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:crud_api_lesson/common/utils/network_constants.dart';
import 'package:crud_api_lesson/data/model/product_model.dart';

class ProductService {
  Future<ProductsModel> getAllProducts() async {
    final url = Uri.parse(NetworkConstants.getProductsUrl);
    try {
      final response = await http.get(url);
      // log(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final allProducts = ProductsModel.fromJson(data);
        // log("nimadir ${allProducts.products?[2].description} 2");

        // log("all: $allProducts");
        return allProducts;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception("Failed to load products error: $e");
    }
  }

  Future<ProductsModel> getProductsByCategory(
      {required String category}) async {
    final url =
        Uri.parse("${NetworkConstants.getProductsUrl}/category?type=$category");
    try {
      log("prd");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final productsByCategory = ProductsModel.fromJson(data);
        return productsByCategory;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("error while getting products by category: $e");
    }
  }

  Future<Product> getProductsById({required int id}) async {
    final url = Uri.parse("${NetworkConstants.getProductsUrl}/$id");
    try {
      final response = await http.get(url);
      log(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // final productsById = ProductsModel.fromJson(data);

        return Product.fromJson(data["product"]);
      } else {
        throw Exception("Failed to load product by $id id");
      }
    } catch (e) {
      throw Exception("error while getting products by $id id: $e");
    }
  }

  Future<ProductsModel> updateProduct({
    required int id,
    required String model,
    required String brand,
  }) async {
    final url = Uri.parse("${NetworkConstants.updateProductUrl}/$id");

    final data = {
      "model": model,
      "brand": brand,
    };
    try {
      final response = await http.patch(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final product = ProductsModel.fromJson(jsonDecode(response.body));
        log("Updated");
        return product;
      } else {
        throw Exception("status code: ${response.statusCode}");
      }
    } catch (e) {
      log("error patch: $e");
      throw Exception(e);
    }
  }

  Future<bool> deleteProduct({
    required int id,
  }) async {
    final url = Uri.parse("${NetworkConstants.deleteProductUrl}/$id");
    try {
      final response = await http.delete(
        url,
      );
      if (response.statusCode == 200) {
        log("Product with ID $id deleted successfully.");
        log(response.statusCode.toString());
        return true;
      } else {
        throw Exception(
            "Failed to delete product. Status code: ${response.statusCode}");
      }
    } catch (e) {
      log("Error deleting product: $e");
      throw Exception(e);
    }
  }
}
