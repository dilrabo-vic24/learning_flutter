import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quran_app_revision/core/common/services/injection_container.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';
import 'package:quran_app_revision/feature/ayah/domain/usecase/all_ayah_usecase.dart';
import 'package:quran_app_revision/feature/ayah/domain/usecase/ayah_usecase.dart';

class AyahController extends ChangeNotifier {
  final ayahUsecase = getIt<AyahUsecase>();
  final allAyahUsecase = getIt<AllAyahUsecase>();

  bool isLoading = false;
  MainAyahEntity ayahBySurah = MainAyahEntity();
  MainAllAyahEntity allAyahBySurah = MainAllAyahEntity();
  String? message;

  Future<void> getAyah({required int surahNumber}) async {
    log("ayah called in provider");
    isLoading = true;
    notifyListeners();

    final response = await ayahUsecase.call(surahNumber: surahNumber);
    response.fold(
      (l) => message = l,
      (r) => ayahBySurah = r,
    );
    log(ayahBySurah.data!.numberOfAyahs.toString());

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllAyah({required int surahNumber}) async {
    log("all ayah called in provider");
    isLoading = true;
    notifyListeners();

    log("nimadir");
    final response = await allAyahUsecase.call(surahNumber: surahNumber);
    response.fold(
      (l) => message = l,
      (r) => allAyahBySurah = r,
    );
    log(allAyahBySurah.data!.toString());

    isLoading = false;
    notifyListeners();
  }
}
