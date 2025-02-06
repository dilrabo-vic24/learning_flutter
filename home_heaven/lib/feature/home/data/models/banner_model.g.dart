// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
      bannerPagination: json['BannerPagination'],
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'BannerPagination': instance.bannerPagination,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      shortDescription: json['short_description'] as String?,
      image: json['image'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'short_description': instance.shortDescription,
      'image': instance.image,
      'date': instance.date,
    };

BannerPaginationModel _$BannerPaginationModelFromJson(Map<String, dynamic> json) =>
    BannerPaginationModel(
      totalRecords: (json['total_records'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      nextPage: json['next_page'],
      prevPage: json['prev_page'],
    );

Map<String, dynamic> _$BannerPaginationModelToJson(BannerPaginationModel instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
