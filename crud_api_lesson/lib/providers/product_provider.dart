import 'dart:developer';

import 'package:crud_api_lesson/data/datasource/remote_datasource/product_service.dart';
import 'package:crud_api_lesson/data/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService productService;

  ProductProvider({required this.productService});

  List<Product>? productsData = [];
  List<Product>? productsByCategory = [];
  // List<Product?> productByIdList = [];
  Product productData = Product();

  bool isloading = false;

  Future<void> getAllProducts() async {
    isloading = true;
    notifyListeners();
    // log("nimadir");
    final response = await productService.getAllProducts();
    productsData = response.products;
    // log("brand ${productsData![0].brand.toString()}");
    isloading = false;
    notifyListeners();
  }

  Future<void> getProductsByCategory({required String category}) async {
    log("get products by category called...............................");
    isloading = true;
    notifyListeners();
    // log("prd");
    final response =
        await productService.getProductsByCategory(category: category);
    productsByCategory = response.products;
    // log("prds ${productsByCategory.toString()}");
    isloading = false;
    notifyListeners();
  }

  Future<void> getProductsById({required int id}) async {
    isloading = true;
    notifyListeners();
    final response = await productService.getProductsById(id: id);

    productData = response;

    isloading = false;
    notifyListeners();
  }

  Future<ProductsModel> updateProduct({
    required int id,
    required String model,
    required String brand,
  }) async {
    isloading = true;
    notifyListeners();
    final response =
        await productService.updateProduct(id: id, model: model, brand: brand);
    isloading = false;
    notifyListeners();
    return response;
  }

  Future<bool> deleteProduct({
    required int id,
  }) async {
    isloading = true;
    notifyListeners();
    final response = await productService.deleteProduct(id: id);
    isloading = false;
    notifyListeners();
    return response;
  }
}
