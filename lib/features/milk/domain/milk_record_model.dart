import 'package:freezed_annotation/freezed_annotation.dart';

part 'milk_record_model.freezed.dart';
part 'milk_record_model.g.dart';

enum MilkSession {
  @JsonValue('morning')
  morning,
  @JsonValue('evening')
  evening,
  @JsonValue('night')
  night,
}

@freezed
class MilkRecordModel with _$MilkRecordModel {
  const factory MilkRecordModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'animal_id') required String animalId,
    @JsonKey(name: 'recorded_at') required DateTime recordedAt,
    required MilkSession session,
    required double litres,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MilkRecordModel;

  factory MilkRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MilkRecordModelFromJson(json);
}
