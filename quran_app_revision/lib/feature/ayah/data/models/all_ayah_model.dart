// To parse this JSON data, do
//
//     final allAyahModel = allAyahModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'all_ayah_model.g.dart';

MainAllAyahModel allAyahModelFromJson(String str) =>
    MainAllAyahModel.fromJson(json.decode(str));

String allAyahModelToJson(MainAllAyahModel data) => json.encode(data.toJson());

@JsonSerializable()
class MainAllAyahModel {
  @JsonKey(name: "code")
  final int? code;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "data")
  final AllAyahDataModel? data;

  MainAllAyahModel({
    this.code,
    this.status,
    this.data,
  });

  factory MainAllAyahModel.fromJson(Map<String, dynamic> json) =>
      _$MainAllAyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainAllAyahModelToJson(this);
}

@JsonSerializable()
class AllAyahDataModel {
  @JsonKey(name: "surahs")
  final List<AllSurahModel>? surahs;
  @JsonKey(name: "edition")
  final AllEditionModel? edition;

  AllAyahDataModel({
    this.surahs,
    this.edition,
  });

  factory AllAyahDataModel.fromJson(Map<String, dynamic> json) =>
      _$AllAyahDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllAyahDataModelToJson(this);
}

@JsonSerializable()
class AllEditionModel {
  @JsonKey(name: "identifier")
  final String? identifier;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "englishName")
  final String? englishName;
  @JsonKey(name: "format")
  final String? format;
  @JsonKey(name: "type")
  final String? type;

  AllEditionModel({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
  });

  factory AllEditionModel.fromJson(Map<String, dynamic> json) =>
      _$AllEditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllEditionModelToJson(this);
}

@JsonSerializable()
class AllSurahModel {
  @JsonKey(name: "number")
  final int? number;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "englishName")
  final String? englishName;
  @JsonKey(name: "englishNameTranslation")
  final String? englishNameTranslation;
  @JsonKey(name: "revelationType")
  final String? revelationType;
  @JsonKey(name: "ayahs")
  final List<AllAyahModel>? ayahs;

  AllSurahModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory AllSurahModel.fromJson(Map<String, dynamic> json) =>
      _$AllSurahModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSurahModelToJson(this);
}

@JsonSerializable()
class AllAyahModel {
  @JsonKey(name: "number")
  final int? number;
  @JsonKey(name: "text")
  final String? text;
  @JsonKey(name: "numberInSurah")
  final int? numberInSurah;
  @JsonKey(name: "juz")
  final int? juz;
  @JsonKey(name: "manzil")
  final int? manzil;
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "ruku")
  final int? ruku;
  @JsonKey(name: "hizbQuarter")
  final int? hizbQuarter;
  @JsonKey(name: "sajda")
  final dynamic sajda;

  AllAyahModel({
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

  factory AllAyahModel.fromJson(Map<String, dynamic> json) =>
      _$AllAyahModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllAyahModelToJson(this);
}

@JsonSerializable()
class AllSajdaClassModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "recommended")
  final bool? recommended;
  @JsonKey(name: "obligatory")
  final bool? obligatory;

  AllSajdaClassModel({
    this.id,
    this.recommended,
    this.obligatory,
  });

  factory AllSajdaClassModel.fromJson(Map<String, dynamic> json) =>
      _$AllSajdaClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllSajdaClassModelToJson(this);
}
