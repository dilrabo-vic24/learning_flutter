import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';
import 'package:home_heaven/feature/home/domain/entities/product_entity.dart';
import 'package:home_heaven/feature/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_heaven/feature/home/domain/usecases/get_products.dart';

class HomeProvider extends ChangeNotifier {
  final bannerUsecase = getIt<GetBannersUsecase>();
  final productUsecase = getIt<GetProductsUsecase>();

  bool isLoading = false;
  BannerEntity? banners = BannerEntity();
  ProductEntity? products = ProductEntity();
  String? message;

//fetch banners
  Future<void> getBanners() async {
    log("Get banners called in provider");
    isLoading = true;
    notifyListeners();

    log("nimadir");
    final result = await bannerUsecase.call();
    result.fold(
      (l) => message = l,
      (r) => banners = r,
    );
    isLoading = false;
    notifyListeners();
  }

//fetch products
  Future<void> getProducts() async {
    log("Get products called in provider");
    isLoading = true;
    notifyListeners();

    final result = await productUsecase.call();

    result.fold(
      (l) => message,
      (r) => products = r,
    );

    isLoading = false;
    notifyListeners();
  }
}
