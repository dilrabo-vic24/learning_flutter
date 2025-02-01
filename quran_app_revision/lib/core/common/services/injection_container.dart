import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app_revision/feature/ayah/domain/usecase/all_ayah_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran_app_revision/feature/ayah/data/remote_datasource/ayah_remote_datasource.dart';
import 'package:quran_app_revision/feature/ayah/data/repo/ayah_repo_impl.dart';
import 'package:quran_app_revision/feature/ayah/domain/repo/ayah_repo.dart';
import 'package:quran_app_revision/feature/ayah/domain/usecase/ayah_usecase.dart';
import 'package:quran_app_revision/feature/ayah/presentation/controller/ayah_controller.dart';
import 'package:quran_app_revision/feature/surah/data/remote_datasource/all_surah_remote_datasource.dart';
import 'package:quran_app_revision/feature/surah/data/repo/all_surah_repo_impl.dart';
import 'package:quran_app_revision/feature/surah/domain/repo/all_surah_repo.dart';
import 'package:quran_app_revision/feature/surah/domain/usecase/get_all_surah_usecase.dart';
import 'package:quran_app_revision/feature/surah/presentations/controllers/all_surah_controller.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton(() => Dio());

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  await allSurahInit();
  await ayahInit();
}

Future<void> allSurahInit() async {
  getIt
    ..registerLazySingleton<GetAllSurahUsecase>(
        () => GetAllSurahUsecase(allSurahRepo: getIt()))
    ..registerLazySingleton(
      () => AllSurahController(),
    )
    ..registerLazySingleton<AllSurahRepo>(
      () => AllSurahRepoImpl(allSurahRemoteDatasource: getIt()),
    )
    ..registerLazySingleton<AllSurahRemoteDatasource>(
      () => AllSurahRemoteDatasourceImpl(),
    );
}

// Future<void> ayahInit() async {
//   getIt
//     ..registerLazySingleton<AyahUsecase>(
//       () => AyahUsecase(ayahRepo: getIt()),
//     )
//     ..registerLazySingleton<AyahController>(
//       () => AyahController(),
//     )
//     ..registerLazySingleton<AyahRepo>(
//       () => AyahRepoImpl(ayahRemoteDatasourceImpl: getIt()),
//     )
//     ..registerLazySingleton<AyahRemoteDatasource>(
//       () => AyahRemoteDatasourceImpl(),
//     );
// }

Future<void> ayahInit() async {
  getIt
    ..registerLazySingleton<AyahRemoteDatasourceImpl>(
      () =>
          AyahRemoteDatasourceImpl(), // ✅ Birinchi bo'lib RemoteDatasource qo'shildi
    )
    ..registerLazySingleton<AyahRemoteDatasource>(
      () => getIt<AyahRemoteDatasourceImpl>(), // ✅ Uni interfeysga bog'laymiz
    )
    ..registerLazySingleton<AyahRepo>(
      () => AyahRepoImpl(
          ayahRemoteDatasourceImpl:
              getIt<AyahRemoteDatasourceImpl>()), // ✅ To‘g‘ri bog‘lanish kerak
    )
    ..registerLazySingleton<AyahUsecase>(
      () => AyahUsecase(ayahRepo: getIt()),
    )
    ..registerLazySingleton(
      () => AllAyahUsecase(ayahRepo: getIt()),
    )
    ..registerLazySingleton<AyahController>(
      () => AyahController(),
    );
}
