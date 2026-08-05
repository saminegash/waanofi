// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_formatter.dart';

part 'flock_adjustment_model.freezed.dart';
part 'flock_adjustment_model.g.dart';

enum FlockAdjustmentType {
  @JsonValue('mortality')
  mortality,
  @JsonValue('sale')
  sale,
  @JsonValue('transfer')
  transfer,
  @JsonValue('purchase')
  purchase,
  @JsonValue('correction')
  correction,
  @JsonValue('other')
  other,
}

@freezed
class FlockAdjustmentModel with _$FlockAdjustmentModel {
  const factory FlockAdjustmentModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'flock_id') required String flockId,
    @JsonKey(name: 'adjustment_type') required FlockAdjustmentType adjustmentType,
    @JsonKey(name: 'birds_changed') required int birdsChanged,
    @JsonKey(name: 'hens_changed') @Default(0) int hensChanged,
    String? reason,
    @JsonKey(
      name: 'recorded_at',
      fromJson: dateFromJson,
      toJson: dateToJson,
    ) required DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _FlockAdjustmentModel;

  factory FlockAdjustmentModel.fromJson(Map<String, dynamic> json) =>
      _$FlockAdjustmentModelFromJson(json);
}
