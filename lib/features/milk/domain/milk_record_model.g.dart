// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milk_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MilkRecordModelImpl _$$MilkRecordModelImplFromJson(
  Map<String, dynamic> json,
) => _$MilkRecordModelImpl(
  id: json['id'] as String,
  farmId: json['farm_id'] as String,
  animalId: json['animal_id'] as String,
  recordedAt: dateFromJson(json['recorded_at']),
  session: $enumDecode(_$MilkSessionEnumMap, json['session']),
  litres: (json['litres'] as num).toDouble(),
  recordedBy: json['recorded_by'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$MilkRecordModelImplToJson(
  _$MilkRecordModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'farm_id': instance.farmId,
  'animal_id': instance.animalId,
  'recorded_at': dateToJson(instance.recordedAt),
  'session': _$MilkSessionEnumMap[instance.session]!,
  'litres': instance.litres,
  'recorded_by': instance.recordedBy,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$MilkSessionEnumMap = {
  MilkSession.morning: 'morning',
  MilkSession.evening: 'evening',
  MilkSession.night: 'night',
};
