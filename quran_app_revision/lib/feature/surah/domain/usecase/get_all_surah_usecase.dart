import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';
import 'package:quran_app_revision/feature/surah/domain/repo/all_surah_repo.dart';

class GetAllSurahUsecase {
  final AllSurahRepo allSurahRepo;

  GetAllSurahUsecase({required this.allSurahRepo});

  Future<Either<dynamic, AllSurahEntity>> call()async{
    return await allSurahRepo.getAllSurah();
  }
}