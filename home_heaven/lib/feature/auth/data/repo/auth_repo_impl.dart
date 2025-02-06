import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:home_heaven/core/common/app/service_injection/injection_container.dart';
import 'package:home_heaven/core/common/exceptions/custom_exception.dart';
import 'package:home_heaven/core/utils/constants/prefs_keys.dart';
import 'package:home_heaven/feature/auth/data/data_source.dart/auth_remote_data_source.dart';
import 'package:home_heaven/feature/auth/domain/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<dynamic, bool>> login(
      {required String phoneNumber, required String password}) async {
    log("data in repo impl token : $phoneNumber, $password ${getIt<SharedPreferences>().getString(PrefsKeys.tokenKey)}");
    try {
      final bool = await authRemoteDataSource.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(bool ?? false);
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }

  @override
  Future<Either<dynamic, bool>> register({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    log("data in repo impl");
    try {
      final bool = await authRemoteDataSource.register(
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      return Right(bool ?? true);
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
