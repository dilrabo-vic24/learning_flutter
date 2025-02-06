import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:home_heaven/core/common/exceptions/custom_exception.dart';
import 'package:home_heaven/feature/home/data/home_remote_data_source/home_remote_data_source.dart';
import 'package:home_heaven/feature/home/data/mappers/banner_mapper.dart';
import 'package:home_heaven/feature/home/data/mappers/product_mapper.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';
import 'package:home_heaven/feature/home/domain/entities/product_entity.dart';
import 'package:home_heaven/feature/home/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<dynamic, BannerEntity>> getBanner() async {
    try {
      final result = await homeRemoteDataSource.getBanners();
      log("home repo impl");
      return Right(BannerMapper.fromModel(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }

  @override
  Future<Either<dynamic, ProductEntity>> getProducts() async {
    try {
      final result = await homeRemoteDataSource.getProducts();
      return Right(ProductMapper.fromModel(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
