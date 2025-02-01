import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/core/common/exception/server_exception.dart';
import 'package:quran_app_revision/feature/surah/data/mappers/all_surah_mapper.dart';
import 'package:quran_app_revision/feature/surah/data/remote_datasource/all_surah_remote_datasource.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';
import 'package:quran_app_revision/feature/surah/domain/repo/all_surah_repo.dart';

class AllSurahRepoImpl implements AllSurahRepo {
  final AllSurahRemoteDatasource allSurahRemoteDatasource;

  AllSurahRepoImpl({required this.allSurahRemoteDatasource});
  @override
  Future<Either<dynamic, AllSurahEntity>> getAllSurah() async {
    try {
      final result = await allSurahRemoteDatasource.getAllSurah();
      return Right(AllSurahMapper.mapAllSurahEntity(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
