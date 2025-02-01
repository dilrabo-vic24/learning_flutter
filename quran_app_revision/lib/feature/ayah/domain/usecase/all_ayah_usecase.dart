import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/repo/ayah_repo.dart';

class AllAyahUsecase {
  final AyahRepo ayahRepo;

  AllAyahUsecase({required this.ayahRepo});

  Future<Either<dynamic, MainAllAyahEntity>> call({required int surahNumber}) async {
    return ayahRepo.getAllAyahBySurah(surahNumber: surahNumber);
  }
}
