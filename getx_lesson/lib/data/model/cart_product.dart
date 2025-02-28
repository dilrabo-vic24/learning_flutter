import 'package:getx_lesson/data/model/product_model.dart';

class CartProduct {
  final ProductModel product;
  int quantity;

  CartProduct({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}
