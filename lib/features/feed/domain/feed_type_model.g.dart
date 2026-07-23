// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedTypeModelImpl _$$FeedTypeModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedTypeModelImpl(
      id: json['id'] as String,
      farmId: json['farm_id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      unitCost: (json['unit_cost'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$FeedTypeModelImplToJson(_$FeedTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farm_id': instance.farmId,
      'name': instance.name,
      'unit': instance.unit,
      'unit_cost': instance.unitCost,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
