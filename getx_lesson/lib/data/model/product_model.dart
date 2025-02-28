class ProductModel {
  final int id;
  final String name;
  final double price;
  String? imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}