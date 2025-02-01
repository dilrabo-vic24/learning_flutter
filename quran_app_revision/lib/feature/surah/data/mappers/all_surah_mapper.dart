import 'package:quran_app_revision/feature/surah/data/models/all_surah_model.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';

class AllSurahMapper {
  static AllSurahEntity mapAllSurahEntity(AllSurahModel? model) {
    return AllSurahEntity(
      data: model?.data?.map((e) => mapAllSurahData(e)).toList(),
      code: model?.code,
      status: model?.status,
    );
  }

  static AllSurahDataEntity mapAllSurahData(AllSurahData model) {
    return AllSurahDataEntity(
      englishName: model.englishName,
      englishNameTranslation: model.englishNameTranslation,
      name: model.name,
      number: model.number,
      numberOfAyahs: model.numberOfAyahs,
      revelationType: model.revelationType,
    );
  }
}