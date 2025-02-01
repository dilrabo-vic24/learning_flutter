import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:home_heaven/core/common/exceptions/custom_exception.dart';
import 'package:home_heaven/feature/auth/data/data_source.dart/auth_remote_data_source.dart';
import 'package:home_heaven/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<dynamic, bool>> login({required String phoneNumber, required String password})async {
    log("data in repo impl: $phoneNumber, $password");
    try{
      final bool = await authRemoteDataSource.login(phoneNumber: phoneNumber, password: password,);
      return Right(bool ?? false);
    }on ServerException catch(e){
      return Left(e.errorMessage);
    }
  }

  
}