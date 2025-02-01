import 'package:quran_app_revision/feature/ayah/data/models/all_ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/all_ayah_model.dart';

class AllAyahMapper {
  static MainAllAyahEntity mapMainAllAyahEntity(MainAllAyahModel model) {
    return MainAllAyahEntity(
      code: model.code ?? 0,
      status: model.status ?? "",
      data: mapAllAyahDataEntity(model.data!),
    );
  }

  static AllAyahDataEntity mapAllAyahDataEntity(AllAyahDataModel model) {
    return AllAyahDataEntity(
      surahs: model.surahs!.map(mapAllSurahEntity).toList(),
      edition: mapAllEditionEntity(model.edition!),
    );
  }

  static AllEditionEntity mapAllEditionEntity(AllEditionModel model) {
    return AllEditionEntity(
      identifier: model.identifier ?? "",
      language: model.language ?? "",
      name: model.name ?? "",
      englishName: model.englishName ?? "",
      format: model.format ?? "",
      type: model.type ?? "",
    );
  }

  static AllSurahEntity mapAllSurahEntity(AllSurahModel model) {
    return AllSurahEntity(
      number: model.number ?? 0,
      name: model.name ?? "",
      englishName: model.englishName ?? "",
      englishNameTranslation: model.englishNameTranslation ?? "",
      revelationType: model.revelationType ?? "",
      ayahs: model.ayahs!.map(mapAllAyahEntity).toList(),
    );
  }

  static AllAyahEntity mapAllAyahEntity(AllAyahModel model) {
    return AllAyahEntity(
      number: model.number ?? 0,
      text: model.text ?? "",
      numberInSurah: model.numberInSurah ?? 0,
      juz: model.juz ?? 0,
      manzil: model.manzil ?? 0,
      page: model.page ?? 0,
      ruku: model.ruku ?? 0,
      hizbQuarter: model.hizbQuarter ?? 0,
      sajda: model.sajda ?? false,
    );
  }
}
