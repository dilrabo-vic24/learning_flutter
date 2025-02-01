import 'package:quran_app_revision/feature/ayah/data/models/ayah_model.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';

class AyahMapper {
  static MainAyahEntity mapAllAyahEntity(MainAyahModel? model) {
    return MainAyahEntity(
      code: model?.code,
      status: model?.status,
      data: mapAyahDataEntity(model!.data!),
    );
  }

  static AyahDataEntity mapAyahDataEntity(AyahDataModel model) {
    return AyahDataEntity(
      englishName: model.englishName,
      englishNameTranslation: model.englishNameTranslation,
      name: model.name,
      number: model.number,
      numberOfAyahs: model.numberOfAyahs,
      revelationType: model.revelationType,
      ayahs: model.ayahs?.map((e) => mapAyahEntity(e)).toList(),
      edition: mapEditionEntity(model.edition!),
    );
  }

  static AyahEntity mapAyahEntity(AyahModel model) {
    return AyahEntity(
      number: model.number,
      audio: model.audio,
      audioSecondary: model.audioSecondary,
      text: model.text,
      numberInSurah: model.numberInSurah,
      juz: model.juz,
      manzil: model.manzil,
      page: model.page,
      ruku: model.ruku,
      hizbQuarter: model.hizbQuarter,
      sajda: model.sajda,
    );
  }

  static EditionEntity mapEditionEntity(EditionModel model) {
    return EditionEntity(
      identifier: model.identifier,
      language: model.language,
      name: model.name,
      englishName: model.englishName,
      format: model.format,
      type: model.type,
      direction: model.direction,
    );
  }
}
