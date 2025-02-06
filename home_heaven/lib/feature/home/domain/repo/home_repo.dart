import 'package:dartz/dartz.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';
import 'package:home_heaven/feature/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanner();

  Future<Either<dynamic, ProductEntity>> getProducts();
}