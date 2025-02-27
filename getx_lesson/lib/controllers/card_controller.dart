import 'package:get/get.dart';

import 'package:getx_lesson/data/product_model.dart';

class CardController extends GetxController {
  var cardItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  void addToCard(ProductModel product) {
    cardItems.add(product);
    calculateTotal();
  }

  void removeFromCard(ProductModel product) {
    cardItems.remove(product);
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount.value = cardItems.fold(
        0, (previousValue, element) => previousValue + element.price);
  }
}
