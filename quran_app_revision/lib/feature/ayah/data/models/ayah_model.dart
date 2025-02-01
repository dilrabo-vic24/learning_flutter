// To parse this JSON data, do
//
//     final MainAyahModel = MainAyahModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'ayah_model.g.dart';

MainAyahModel MainAyahModelFromJson(String str) => MainAyahModel.fromJson(json.decode(str));

String MainAyahModelToJson(MainAyahModel data) => json.encode(data.toJson());

@JsonSerializable()
class MainAyahModel {
    @JsonKey(name: "code")
    final int? code;
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "data")
    final AyahDataModel? data;

    MainAyahModel({
        this.code,
        this.status,
        this.data,
    });

    factory MainAyahModel.fromJson(Map<String, dynamic> json) => _$MainAyahModelFromJson(json);

    Map<String, dynamic> toJson() => _$MainAyahModelToJson(this);
}

@JsonSerializable()
class AyahDataModel {
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
    @JsonKey(name: "numberOfAyahs")
    final int? numberOfAyahs;
    @JsonKey(name: "ayahs")
    final List<AyahModel>? ayahs;
    @JsonKey(name: "edition")
    final EditionModel? edition;

    AyahDataModel({
        this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.numberOfAyahs,
        this.ayahs,
        this.edition,
    });

    factory AyahDataModel.fromJson(Map<String, dynamic> json) => _$AyahDataModelFromJson(json);

    Map<String, dynamic> toJson() => _$AyahDataModelToJson(this);
}

@JsonSerializable()
class AyahModel {
    @JsonKey(name: "number")
    final int? number;
    @JsonKey(name: "audio")
    final String? audio;
    @JsonKey(name: "audioSecondary")
    final List<String>? audioSecondary;
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
    final bool? sajda;

    AyahModel({
        this.number,
        this.audio,
        this.audioSecondary,
        this.text,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda,
    });

    factory AyahModel.fromJson(Map<String, dynamic> json) => _$AyahModelFromJson(json);

    Map<String, dynamic> toJson() => _$AyahModelToJson(this);
}

@JsonSerializable()
class EditionModel {
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
    @JsonKey(name: "direction")
    final dynamic direction;

    EditionModel({
        this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type,
        this.direction,
    });

    factory EditionModel.fromJson(Map<String, dynamic> json) => _$EditionModelFromJson(json);

    Map<String, dynamic> toJson() => _$EditionModelToJson(this);
}
