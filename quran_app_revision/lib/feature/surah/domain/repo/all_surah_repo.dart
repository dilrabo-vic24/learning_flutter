import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';

abstract class AllSurahRepo {
  Future<Either<dynamic, AllSurahEntity>> getAllSurah();
}

