// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_predict_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPredictDtoImpl _$$GetPredictDtoImplFromJson(Map<String, dynamic> json) =>
    _$GetPredictDtoImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetPredictDtoImplToJson(_$GetPredictDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      image: json['image'] as String?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      confidence: (json['confidence'] as num?)?.toDouble(),
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'type': instance.type,
      'confidence': instance.confidence,
      'created_at': instance.createdAt,
    };

_$TypeImpl _$$TypeImplFromJson(Map<String, dynamic> json) => _$TypeImpl(
      id: json['_id'] as String?,
      typeId: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameUz: json['name_uz'] as String?,
      description: json['description'] as String?,
      images: json['images'] as List<dynamic>?,
    );

Map<String, dynamic> _$$TypeImplToJson(_$TypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'id': instance.typeId,
      'name': instance.name,
      'name_uz': instance.nameUz,
      'description': instance.description,
      'images': instance.images,
    };
