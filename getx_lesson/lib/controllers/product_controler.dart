import 'package:get/get.dart';

import 'package:getx_lesson/data/product_model.dart';

class ProductControler extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    products.addAll([
      ProductModel(name: "Product 1", price: 10),
      ProductModel(name: "Product 2", price: 10),
      ProductModel(name: "Product 3", price: 10),
    ]);
    super.onInit();
  }
}
