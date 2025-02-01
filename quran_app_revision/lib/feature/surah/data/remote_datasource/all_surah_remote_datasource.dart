import 'package:dio/dio.dart';
import 'package:quran_app_revision/core/common/exception/server_exception.dart';
import 'package:quran_app_revision/core/common/network_conts/network_consts.dart';
import 'package:quran_app_revision/core/common/services/injection_container.dart';
import 'package:quran_app_revision/feature/surah/data/models/all_surah_model.dart';

abstract class AllSurahRemoteDatasource {
  Future<AllSurahModel?> getAllSurah();
}

class AllSurahRemoteDatasourceImpl implements AllSurahRemoteDatasource {
  final dio = getIt<Dio>();

  @override
  Future<AllSurahModel?> getAllSurah() async {
    try {
      final response = await dio.get(NetworkConsts.surahUrl);
      if (response.statusCode == 200) {
        final payload = response.data;
        return AllSurahModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerException(
          errorMessage: "Error happined while fetching banners",
          statusCode: 500);
    }
  }
}
