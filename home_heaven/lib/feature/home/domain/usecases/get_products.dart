import 'package:dartz/dartz.dart';
import 'package:home_heaven/feature/home/domain/entities/product_entity.dart';
import 'package:home_heaven/feature/home/domain/repo/home_repo.dart';

class GetProductsUsecase {
  final HomeRepo homeRepo;

  GetProductsUsecase({required this.homeRepo});

  Future<Either<dynamic, ProductEntity>> call()async{
    return await homeRepo.getProducts();
  }
}