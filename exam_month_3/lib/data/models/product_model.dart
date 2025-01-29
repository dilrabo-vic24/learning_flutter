// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'product_model.g.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProductModel {
    @JsonKey(name: "data")
    final List<Datum>? data;

    ProductModel({
        this.data,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "_id")
    final String? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "description")
    final String? description;
    @JsonKey(name: "short_description")
    final String? shortDescription;
    @JsonKey(name: "icon")
    final String? icon;
    @JsonKey(name: "image")
    final List<String>? image;
    @JsonKey(name: "quintity")
    final int? quintity;
    @JsonKey(name: "price")
    final int? price;
    @JsonKey(name: "discount")
    final int? discount;
    @JsonKey(name: "rating")
    final int? rating;
    @JsonKey(name: "rating_count")
    final int? ratingCount;
    @JsonKey(name: "colors")
    final Colors? colors;
    @JsonKey(name: "size")
    final Size? size;
    @JsonKey(name: "category")
    final String? category;

    Datum({
        this.id,
        this.name,
        this.description,
        this.shortDescription,
        this.icon,
        this.image,
        this.quintity,
        this.price,
        this.discount,
        this.rating,
        this.ratingCount,
        this.colors,
        this.size,
        this.category,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Colors {
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "color_hex_flutter")
    final String? colorHexFlutter;

    Colors({
        this.name,
        this.colorHexFlutter,
    });

    factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);

    Map<String, dynamic> toJson() => _$ColorsToJson(this);
}

@JsonSerializable()
class Size {
    @JsonKey(name: "width")
    final int? width;
    @JsonKey(name: "depth")
    final int? depth;
    @JsonKey(name: "heigth")
    final int? heigth;
    @JsonKey(name: "seat_width")
    final int? seatWidth;
    @JsonKey(name: "seat_depth")
    final int? seatDepth;
    @JsonKey(name: "seat_heigth")
    final int? seatHeigth;

    Size({
        this.width,
        this.depth,
        this.heigth,
        this.seatWidth,
        this.seatDepth,
        this.seatHeigth,
    });

    factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

    Map<String, dynamic> toJson() => _$SizeToJson(this);
}
