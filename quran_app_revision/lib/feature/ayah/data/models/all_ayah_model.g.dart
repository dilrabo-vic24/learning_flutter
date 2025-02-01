// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainAllAyahModel _$MainAllAyahModelFromJson(Map<String, dynamic> json) =>
    MainAllAyahModel(
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : AllAyahDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainAllAyahModelToJson(MainAllAyahModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

AllAyahDataModel _$AllAyahDataModelFromJson(Map<String, dynamic> json) =>
    AllAyahDataModel(
      surahs: (json['surahs'] as List<dynamic>?)
          ?.map((e) => AllSurahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: json['edition'] == null
          ? null
          : AllEditionModel.fromJson(json['edition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllAyahDataModelToJson(AllAyahDataModel instance) =>
    <String, dynamic>{
      'surahs': instance.surahs,
      'edition': instance.edition,
    };

AllEditionModel _$AllEditionModelFromJson(Map<String, dynamic> json) =>
    AllEditionModel(
      identifier: json['identifier'] as String?,
      language: json['language'] as String?,
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      format: json['format'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AllEditionModelToJson(AllEditionModel instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'language': instance.language,
      'name': instance.name,
      'englishName': instance.englishName,
      'format': instance.format,
      'type': instance.type,
    };

AllSurahModel _$AllSurahModelFromJson(Map<String, dynamic> json) =>
    AllSurahModel(
      number: (json['number'] as num?)?.toInt(),
      name: json['name'] as String?,
      englishName: json['englishName'] as String?,
      englishNameTranslation: json['englishNameTranslation'] as String?,
      revelationType: json['revelationType'] as String?,
      ayahs: (json['ayahs'] as List<dynamic>?)
          ?.map((e) => AllAyahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllSurahModelToJson(AllSurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'englishName': instance.englishName,
      'englishNameTranslation': instance.englishNameTranslation,
      'revelationType': instance.revelationType,
      'ayahs': instance.ayahs,
    };

AllAyahModel _$AllAyahModelFromJson(Map<String, dynamic> json) => AllAyahModel(
      number: (json['number'] as num?)?.toInt(),
      text: json['text'] as String?,
      numberInSurah: (json['numberInSurah'] as num?)?.toInt(),
      juz: (json['juz'] as num?)?.toInt(),
      manzil: (json['manzil'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      ruku: (json['ruku'] as num?)?.toInt(),
      hizbQuarter: (json['hizbQuarter'] as num?)?.toInt(),
      sajda: json['sajda'],
    );

Map<String, dynamic> _$AllAyahModelToJson(AllAyahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'text': instance.text,
      'numberInSurah': instance.numberInSurah,
      'juz': instance.juz,
      'manzil': instance.manzil,
      'page': instance.page,
      'ruku': instance.ruku,
      'hizbQuarter': instance.hizbQuarter,
      'sajda': instance.sajda,
    };

AllSajdaClassModel _$AllSajdaClassModelFromJson(Map<String, dynamic> json) =>
    AllSajdaClassModel(
      id: (json['id'] as num?)?.toInt(),
      recommended: json['recommended'] as bool?,
      obligatory: json['obligatory'] as bool?,
    );

Map<String, dynamic> _$AllSajdaClassModelToJson(AllSajdaClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recommended': instance.recommended,
      'obligatory': instance.obligatory,
    };
