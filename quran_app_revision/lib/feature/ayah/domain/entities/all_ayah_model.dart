class MainAllAyahEntity {
  final int? code;
  final String? status;
  final AllAyahDataEntity? data;

  MainAllAyahEntity({
    this.code,
    this.status,
    this.data,
  });
}

class AllAyahDataEntity {
  final List<AllSurahEntity>? surahs;
  final AllEditionEntity? edition;

  AllAyahDataEntity({
    this.surahs,
    this.edition,
  });
}

class AllEditionEntity {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  AllEditionEntity({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });
}

class AllSurahEntity {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<AllAyahEntity>? ayahs;

  AllSurahEntity({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });
}

class AllAyahEntity {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final dynamic sajda;

  AllAyahEntity({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });
}

class AllSajdaClass {
  final int? id;
  final bool? recommended;
  final bool? obligatory;

  AllSajdaClass({
    this.id,
    this.recommended,
    this.obligatory,
  });
}