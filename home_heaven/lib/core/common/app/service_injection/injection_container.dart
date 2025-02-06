import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_heaven/feature/auth/data/data_source.dart/auth_remote_data_source.dart';
import 'package:home_heaven/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:home_heaven/feature/auth/domain/repos/auth_repo.dart';
import 'package:home_heaven/feature/auth/domain/usecases/login_usecase.dart';
import 'package:home_heaven/feature/auth/domain/usecases/register_usecase.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:home_heaven/feature/home/data/home_remote_data_source/home_remote_data_source.dart';
import 'package:home_heaven/feature/home/data/repos/home_repo_impl.dart';
import 'package:home_heaven/feature/home/domain/repo/home_repo.dart';
import 'package:home_heaven/feature/home/domain/usecases/get_banners_usecase.dart';
import 'package:home_heaven/feature/home/domain/usecases/get_products.dart';
import 'package:home_heaven/feature/home/presentation/controllers/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton(() => Dio());

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  await authInit();
  await homeInit();
}

//registration of authentification
Future<void> authInit() async {
  getIt
    ..registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepo: getIt()),
    )
    ..registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(authRepo: getIt()),
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
// homescreen authentification

Future<void> homeInit() async {
  getIt
    ..registerLazySingleton<GetBannersUsecase>(
      () => GetBannersUsecase(homeRepo: getIt()),
    )
    ..registerLazySingleton<GetProductsUsecase>(
      () => GetProductsUsecase(homeRepo: getIt()),
    )
    ..registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(homeRemoteDataSource: getIt()),
    )
    ..registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<HomeProvider>(
      () => HomeProvider(),
    );
}
