import 'package:dio_library_lesson/services/models/product_model.dart';
import 'package:dio_library_lesson/services/product_service.dart/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService service = ProductService();

  List<Product> products = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchProducts() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      products = await service.getProducts();
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
