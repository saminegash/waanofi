// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimalModelImpl _$$AnimalModelImplFromJson(Map<String, dynamic> json) =>
    _$AnimalModelImpl(
      id: json['id'] as String,
      farmId: json['farm_id'] as String,
      tagNumber: json['tag_number'] as String,
      name: json['name'] as String?,
      breed: json['breed'] as String?,
      sex: json['sex'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      status: json['status'] as String,
      photoUrl: json['photo_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AnimalModelImplToJson(_$AnimalModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farm_id': instance.farmId,
      'tag_number': instance.tagNumber,
      'name': instance.name,
      'breed': instance.breed,
      'sex': instance.sex,
      'dob': instance.dob?.toIso8601String(),
      'status': instance.status,
      'photo_url': instance.photoUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
