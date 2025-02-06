// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'banner_model.g.dart';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

@JsonSerializable()
class BannerModel {
    @JsonKey(name: "data")
    final List<BannerData>? data;
    @JsonKey(name: "BannerPagination")
    final BannerPaginationModel? bannerPagination;

    BannerModel({
        this.data,
        this.bannerPagination,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

    Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}

@JsonSerializable()
class BannerData {
    @JsonKey(name: "_id")
    final String? id;
    @JsonKey(name: "title")
    final String? title;
    @JsonKey(name: "category")
    final String? category;
    @JsonKey(name: "short_description")
    final String? shortDescription;
    @JsonKey(name: "image")
    final String? image;
    @JsonKey(name: "date")
    final String? date;

    BannerData({
        this.id,
        this.title,
        this.category,
        this.shortDescription,
        this.image,
        this.date,
    });

    factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);

    Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}

@JsonSerializable()
class BannerPaginationModel {
    @JsonKey(name: "total_records")
    final int? totalRecords;
    @JsonKey(name: "current_page")
    final int? currentPage;
    @JsonKey(name: "total_pages")
    final int? totalPages;
    @JsonKey(name: "next_page")
    final dynamic nextPage;
    @JsonKey(name: "prev_page")
    final dynamic prevPage;

    BannerPaginationModel({
        this.totalRecords,
        this.currentPage,
        this.totalPages,
        this.nextPage,
        this.prevPage,
    });

    factory BannerPaginationModel.fromJson(Map<String, dynamic> json) => _$BannerPaginationModelFromJson(json);

    Map<String, dynamic> toJson() => _$BannerPaginationModelToJson(this);
}
