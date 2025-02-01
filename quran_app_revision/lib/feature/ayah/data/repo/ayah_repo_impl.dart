import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/core/common/exception/server_exception.dart';
import 'package:quran_app_revision/feature/ayah/data/mappers/all_ayah_mapper.dart';
import 'package:quran_app_revision/feature/ayah/data/mappers/ayah_mapper.dart';
import 'package:quran_app_revision/feature/ayah/data/remote_datasource/ayah_remote_datasource.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';
import 'package:quran_app_revision/feature/ayah/domain/repo/ayah_repo.dart';

class AyahRepoImpl implements AyahRepo{
final AyahRemoteDatasourceImpl ayahRemoteDatasourceImpl;

  AyahRepoImpl({required this.ayahRemoteDatasourceImpl});

  @override
  Future<Either<dynamic, MainAyahEntity>> getAyahBySurah({required int surahNumber}) async{
    try{
      final result = await ayahRemoteDatasourceImpl.getAyah(surahNumber: surahNumber);
      return Right(AyahMapper.mapAllAyahEntity(result));
    }on ServerException catch(e){
      return Left(e.errorMessage);
    }
  }

  @override
  Future<Either<dynamic, MainAllAyahEntity>> getAllAyahBySurah({required int surahNumber}) async{
    try{
      final result = await ayahRemoteDatasourceImpl.getAllAyah(surahNumber: surahNumber);
      return Right(AllAyahMapper.mapMainAllAyahEntity(result!));
    }on ServerException catch(e){
      return Left(e.errorMessage);
    }
  }

}