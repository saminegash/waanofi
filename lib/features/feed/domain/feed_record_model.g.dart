// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedRecordModelImpl _$$FeedRecordModelImplFromJson(
  Map<String, dynamic> json,
) => _$FeedRecordModelImpl(
  id: json['id'] as String,
  farmId: json['farm_id'] as String,
  animalId: json['animal_id'] as String?,
  feedTypeId: json['feed_type'] as String,
  quantityKg: (json['quantity_kg'] as num).toDouble(),
  cost: (json['cost'] as num).toDouble(),
  recordedAt: dateFromJson(json['recorded_at']),
  recordedBy: json['recorded_by'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$FeedRecordModelImplToJson(
  _$FeedRecordModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'farm_id': instance.farmId,
  'animal_id': instance.animalId,
  'feed_type': instance.feedTypeId,
  'quantity_kg': instance.quantityKg,
  'cost': instance.cost,
  'recorded_at': dateToJson(instance.recordedAt),
  'recorded_by': instance.recordedBy,
  'created_at': instance.createdAt.toIso8601String(),
};
