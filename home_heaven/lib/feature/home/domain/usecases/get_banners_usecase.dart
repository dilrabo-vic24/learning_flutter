import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';
import 'package:home_heaven/feature/home/domain/repo/home_repo.dart';

class GetBannersUsecase {
  final HomeRepo homeRepo;

  GetBannersUsecase({required this.homeRepo});

  Future<Either<dynamic, BannerEntity>> call() async {
    final banners = await homeRepo.getBanner();
    // log("banner usecae");
    return banners;
  }
}
