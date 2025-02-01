import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';

abstract class AyahRepo {
  Future<Either<dynamic, MainAyahEntity>> getAyahBySurah(
      {required int surahNumber});

  Future<Either<dynamic, MainAllAyahEntity>> getAllAyahBySurah(
      {required int surahNumber});
}
