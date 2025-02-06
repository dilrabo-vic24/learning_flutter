import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/core/common/exceptions/custom_exception.dart';
import 'package:home_heaven/core/utils/constants/network_constants.dart';
import 'package:home_heaven/core/utils/constants/prefs_keys.dart';
import 'package:home_heaven/feature/home/data/models/banner_model.dart';
import 'package:home_heaven/feature/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

//fetching datas for homescreen
abstract class HomeRemoteDataSource {
  Future<BannerModel?> getBanners();

  Future<ProductModel?> getProducts();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final dio = getIt<Dio>();

//fetch banners
  @override
  Future<BannerModel?> getBanners() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);
    try {
      final response = await dio.get(
        NetworkConstants.bannerUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        final payload = response.data;
        return BannerModel.fromJson(payload);
      }
    } catch (e) {
      log("error while fetching banners $e");

      throw ServerException(
        errorMessage: "Error happened while fetching banner",
        statusCode: 500,
      );
    }
  }

//fetch products
  @override
  Future<ProductModel?> getProducts() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);
    try {
      final response = await dio.get(NetworkConstants.productsUrl,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ));
      log("product service");
      if (response.statusCode == 200) {
        final payload = response.data;
        return ProductModel.fromJson(payload);
      }
    } catch (e) {
      log("error while fetching products $e");
      throw ServerException(
          errorMessage: "Error happened while fetching products",
          statusCode: 500);
    }
  }
}
