import 'package:get/get.dart';
import 'package:getx_lesson/data/model/product_model.dart';
import 'package:getx_lesson/data/repos/product_repo.dart';

class ProductControler extends GetxController {
  final ProductRepository _productRepository = ProductRepository();
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final productList = await _productRepository.getProducts();
      products.value = productList;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load products: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
