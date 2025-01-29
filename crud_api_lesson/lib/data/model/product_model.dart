// To parse this JSON data, do
//
//     final productsModel = productsModelFromMap(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part "product_model.g.dart";

ProductsModel productsModelFromMap(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToMap(ProductsModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProductsModel {
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "products")
    final List<Product>? products;

    ProductsModel({
        this.status,
        this.message,
        this.products,
    });

    factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class Product {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "price")
    final int? price;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "brand")
    final String? brand;
    @JsonKey(name: "model")
    final String? model;
    @JsonKey(name: "color")
    final String? color;
    @JsonKey(name: "category")
    final String? category;
    @JsonKey(name: "discount")
    final int? discount;
    @JsonKey(name: "popular")
    final bool? popular;
    @JsonKey(name: "onSale")
    final bool? onSale;

    Product({
        this.id,
        this.title,
        this.image,
        this.price,
        this.description,
        this.brand,
        this.model,
        this.color,
        this.category,
        this.discount,
        this.popular,
        this.onSale,
    });

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    Map<String, dynamic> toJson() => _$ProductToJson(this);
}
