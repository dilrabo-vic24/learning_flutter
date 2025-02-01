import 'package:json_annotation/json_annotation.dart';

part 'all_surah_model.g.dart';

@JsonSerializable()
class AllSurahModel {
    @JsonKey(name: "code")
    final int? code;
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "data")
    final List<AllSurahData>? data;

    AllSurahModel({
        this.code,
        this.status,
        this.data,
    });

    factory AllSurahModel.fromJson(Map<String, dynamic> json) => _$AllSurahModelFromJson(json);

    Map<String, dynamic> toJson() => _$AllSurahModelToJson(this);
}

@JsonSerializable()
class AllSurahData {
    @JsonKey(name: "number")
    final int? number;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "englishName")
    final String? englishName;
    @JsonKey(name: "englishNameTranslation")
    final String? englishNameTranslation;
    @JsonKey(name: "numberOfAyahs")
    final int? numberOfAyahs;
    @JsonKey(name: "revelationType")
    final String? revelationType;

    AllSurahData({
        this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.numberOfAyahs,
        this.revelationType,
    });

    factory AllSurahData.fromJson(Map<String, dynamic> json) => _$AllSurahDataFromJson(json);

    Map<String, dynamic> toJson() => _$AllSurahDataToJson(this);
}

