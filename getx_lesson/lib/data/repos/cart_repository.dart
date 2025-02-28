import 'package:get/get.dart';
import 'package:getx_lesson/data/model/cart_product.dart';
import 'package:getx_lesson/data/services/local_storaga_service.dart';

class CartRepository {
  final StorageService storageService = Get.find<StorageService>();

  Future<List<CartProduct>> getCartProducts() async {

    final cartData = storageService.getCart();
    return cartData.map((item) => CartProduct.fromJson(item)).toList();
  }

  Future<void> saveCartProducts(List<CartProduct> items) async {
    
    final cartData = items.map((item) => item.toJson()).toList();
    await storageService.saveCart(cartData);
  }
}