import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late final GetStorage _box;

  Future<StorageService> init() async {
    await GetStorage.init();
    _box = GetStorage();
    return this;
  }

  Future<void> saveCart(List<Map<String, dynamic>> cartItems) async {
    await _box.write('cart', cartItems);
  }

  List<Map<String, dynamic>> getCart() {
    final cartData = _box.read<List>('cart');
    if (cartData == null) return [];
    return cartData.map((item) => item as Map<String, dynamic>).toList();
  }
}