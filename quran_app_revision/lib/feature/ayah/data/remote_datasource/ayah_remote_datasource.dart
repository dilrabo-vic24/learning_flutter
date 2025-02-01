import 'package:dio/dio.dart';
import 'package:quran_app_revision/core/common/exception/server_exception.dart';
import 'package:quran_app_revision/core/common/network_conts/network_consts.dart';
import 'package:quran_app_revision/core/common/services/injection_container.dart';
import 'package:quran_app_revision/feature/ayah/data/models/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/data/models/ayah_model.dart';

abstract class AyahRemoteDatasource {
  Future<MainAyahModel?> getAyah({required int surahNumber});
  Future<MainAllAyahModel?> getAllAyah({required int surahNumber});

}

class AyahRemoteDatasourceImpl implements AyahRemoteDatasource {
  final dio = getIt<Dio>();

  @override
  Future<MainAyahModel?> getAyah({required int surahNumber}) async {
    try {
      final response =
          await dio.get("${NetworkConsts.ayahUrl}$surahNumber/ar.alafasy");
      if (response.statusCode == 200) {
        final payload = response.data;
        return MainAyahModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerException(
          errorMessage: "Error happened while fetching ayah", statusCode: 500);
    }
  }
  
  @override
  Future<MainAllAyahModel?> getAllAyah({required int surahNumber}) async {
    try {
      final response =
          await dio.get(NetworkConsts.allAyahUrl);
      if (response.statusCode == 200) {
        final payload = response.data;
        return MainAllAyahModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerException(
          errorMessage: "Error happened while fetching all ayah", statusCode: 500);
    }
  }
}