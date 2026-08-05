// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_formatter.dart';

part 'flock_model.freezed.dart';
part 'flock_model.g.dart';

enum FlockPurpose {
  @JsonValue('layers')
  layers,
  @JsonValue('broilers')
  broilers,
  @JsonValue('dual')
  dual,
}

enum FlockStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
  @JsonValue('sold')
  sold,
  @JsonValue('completed')
  completed,
  @JsonValue('quarantined')
  quarantined,
}

@freezed
class FlockModel with _$FlockModel {
  const factory FlockModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'flock_code') required String flockCode,
    required String name,
    required String breed,
    @Default(FlockPurpose.layers) FlockPurpose purpose,
    @JsonKey(name: 'number_of_birds') @Default(0) int numberOfBirds,
    @JsonKey(name: 'number_of_laying_hens') @Default(0) int numberOfLayingHens,
    @JsonKey(
      name: 'arrival_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    ) required DateTime arrivalDate,
    @JsonKey(
      name: 'hatch_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    ) DateTime? hatchDate,
    @JsonKey(name: 'housing_type') String? housingType,
    String? source,
    @Default(FlockStatus.active) FlockStatus status,
    String? notes,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _FlockModel;

  factory FlockModel.fromJson(Map<String, dynamic> json) =>
      _$FlockModelFromJson(json);
}

extension FlockHelpers on FlockModel {
  bool get isActive => status == FlockStatus.active && deletedAt == null;
  double get layingRatePercentage {
    if (numberOfBirds <= 0) return 0.0;
    return (numberOfLayingHens / numberOfBirds) * 100;
  }
}
