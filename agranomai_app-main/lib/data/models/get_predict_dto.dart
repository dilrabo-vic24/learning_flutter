// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_predict_dto.freezed.dart';
part 'get_predict_dto.g.dart';

@freezed
class GetPredictDto with _$GetPredictDto {
    const factory GetPredictDto({
        @JsonKey(name: "data")
        Data? data,
    }) = _GetPredictDto;

    factory GetPredictDto.fromJson(Map<String, dynamic> json) => _$GetPredictDtoFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "image")
        String? image,
        @JsonKey(name: "type")
        Type? type,
        @JsonKey(name: "confidence")
        double? confidence,
        @JsonKey(name: "created_at")
        String? createdAt,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Type with _$Type {
    const factory Type({
        @JsonKey(name: "_id")
        String? id,
        @JsonKey(name: "id")
        int? typeId,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "name_uz")
        String? nameUz,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "images")
        List<dynamic>? images,
    }) = _Type;

    factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
