// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'books_model.g.dart';
List<BooksModel> booksModelFromJson(String str) => List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String booksModelToJson(List<BooksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class BooksModel {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "author")
    final String? author;
    @JsonKey(name: "genre")
    final String? genre;
    @JsonKey(name: "yearPublished")
    final int? yearPublished;
    @JsonKey(name: "checkedOut")
    final bool? checkedOut;
    @JsonKey(name: "isPermanentCollection")
    final bool? isPermanentCollection;
    @JsonKey(name: "createdAt")
    final String? createdAt;

    BooksModel({
        this.id,
        this.title,
        this.author,
        this.genre,
        this.yearPublished,
        this.checkedOut,
        this.isPermanentCollection,
        this.createdAt,
    });

    factory BooksModel.fromJson(Map<String, dynamic> json) => _$BooksModelFromJson(json);

    Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}
