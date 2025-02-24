import 'package:dio/dio.dart';
import 'package:dio_library_lesson/services/dio_service/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  final prefs = await SharedPreferences.getInstance();

  getIt
    ..registerLazySingleton<Dio>(
      () => Dio(),
    )
    ..registerLazySingleton<DioClient>(
      () => DioClient(),
    )
    ..registerLazySingleton(
      () => prefs,
    );
}
