import 'package:getx_lesson/data/model/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        id: 1,
        name: 'Laptop',
        price: 999.99,
        imageUrl:
            "https://cdn.thewirecutter.com/wp-content/media/2024/07/laptopstopicpage-2048px-3685-2x1-1.jpg?width=2048&quality=75&crop=2:1&auto=webp",
      ),
      ProductModel(
          id: 2,
          name: 'Smartphone',
          price: 499.99,
          imageUrl:
              "https://static1.pocketlintimages.com/wordpress/wp-content/uploads/wm/2025/01/galaxy-s25-ultra-header-1.jpg"),
      ProductModel(
          id: 3,
          name: 'Headphones',
          price: 99.99,
          imageUrl:
              "https://shop.zebronics.com/cdn/shop/files/Zeb-Blast-Z-pic1.jpg?v=1708946658&width=1200"),
      ProductModel(
          id: 4,
          name: 'Tablet',
          price: 349.99,
          imageUrl:
              "https://media.wired.com/photos/673fc17b37facb64c2030834/191:100/w_2580,c_limit/Samsung%20Galaxy%20Tab%20S10+%20Plus%20Abstract%20Background%20SOURCE%20Amazon.jpg"),
      ProductModel(
          id: 5,
          name: 'Smartwatch',
          price: 199.99,
          imageUrl:
              "https://ae01.alicdn.com/kf/S94a0b7ac6aac46d9b3fa7dcd02d16c1dQ.jpg"),
    ];
  }
}
