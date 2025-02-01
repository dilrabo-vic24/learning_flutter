import 'package:dartz/dartz.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';
import 'package:quran_app_revision/feature/ayah/domain/repo/ayah_repo.dart';

class AyahUsecase {
  final AyahRepo ayahRepo;

  AyahUsecase({required this.ayahRepo});

  Future<Either<dynamic, MainAyahEntity>> call({required int surahNumber}) async {
    return ayahRepo.getAyahBySurah(surahNumber: surahNumber);
  }
}
