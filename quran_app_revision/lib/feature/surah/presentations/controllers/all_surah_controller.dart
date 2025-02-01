import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quran_app_revision/core/common/services/injection_container.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';
import 'package:quran_app_revision/feature/surah/domain/usecase/get_all_surah_usecase.dart';

class AllSurahController extends ChangeNotifier {
  final getAllSurahUsecase = getIt<GetAllSurahUsecase>();

  bool isLoading = false;
  AllSurahEntity? allSurah = AllSurahEntity();
  String? message;

  Future<void> getAllSurah() async {
    log("All Surah called in provider");
    isLoading = false;
    notifyListeners();
    final result = await getAllSurahUsecase.call();
    result.fold((l) => message = l, (r) => allSurah = r);
    log(allSurah!.code.toString());
    log(allSurah!.data![0].englishName.toString());
    isLoading = false;
    notifyListeners();
  }
}
