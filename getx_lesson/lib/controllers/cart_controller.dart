import 'package:get/get.dart';
import 'package:getx_lesson/data/model/cart_product.dart';
import 'package:getx_lesson/data/model/product_model.dart';
import 'package:getx_lesson/data/repos/cart_repository.dart';

class CartController extends GetxController {
  final CartRepository _cartRepository = CartRepository();
  final RxList<CartProduct> cartItems = <CartProduct>[].obs;
  final RxDouble totalPrice = 0.0.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    loadCart();
    super.onInit();
  }

  Future<void> loadCart() async {
    isLoading.value = true;
    try {
      final items = await _cartRepository.getCartProducts();
      cartItems.value = items;
      calculateTotal();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load cart: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void addToCart(ProductModel product) {
    final existingIndex =
        cartItems.indexWhere((item) => item.product.id == product.id);

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity++;
      cartItems.refresh();
    } else {
      cartItems.add(CartProduct(product: product));
    }

    calculateTotal();
    saveCart();
  }

  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
    calculateTotal();
    saveCart();
  }

  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    } else {
      removeFromCart(index);
    }
    calculateTotal();
    saveCart();
  }

  void removeFromCart(int index) {
    cartItems.removeAt(index);
    calculateTotal();
    saveCart();
  }

  void calculateTotal() {
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + item.totalPrice);
  }

  Future<void> saveCart() async {
    await _cartRepository.saveCartProducts(cartItems);
  }
}
