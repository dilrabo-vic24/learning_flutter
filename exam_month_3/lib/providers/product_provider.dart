import 'package:exam_month_3/data/models/product_model.dart';
import 'package:exam_month_3/data/remote_datasource/product_repo.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  bool isLoading = false;

  ProductModel allProducts = ProductModel();

  Future<void> getAllProducts() async {
    isLoading = true;
    notifyListeners();
    allProducts = await productRepo.getAllProduct();
    isLoading = false;
    notifyListeners();
  }
}
