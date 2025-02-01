import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:home_heaven/feature/auth/data/data_source.dart/auth_remote_data_source.dart';
import 'package:home_heaven/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:home_heaven/feature/auth/domain/repos/auth_repo.dart';
import 'package:home_heaven/feature/auth/domain/usecases/login_usecase.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton(() => Dio());

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  await authInit();
}

Future<void> authInit() async {
  getIt
    ..registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepo: getIt()),
    )
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
          authRemoteDataSource: getIt(),
        ))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<AuthController>(
      () => AuthController(),
    );
}
