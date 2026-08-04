import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'egg_record_model.freezed.dart';
part 'egg_record_model.g.dart';

enum EggProductionType {
  @JsonValue('free_range')
  freeRange,
  @JsonValue('caged')
  caged,
  @JsonValue('organic')
  organic,
}

@freezed
class EggRecordModel with _$EggRecordModel {
  const factory EggRecordModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'flock_name') required String flockName,
    @JsonKey(name: 'production_type') required EggProductionType productionType,
    @JsonKey(
      name: 'recorded_at',
      fromJson: dateFromJson,
      toJson: dateToJson,
    ) required DateTime recordedAt,
    required int quantity,
    @JsonKey(name: 'broken_count') @Default(0) int brokenCount,
    String? notes,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _EggRecordModel;

  factory EggRecordModel.fromJson(Map<String, dynamic> json) =>
      _$EggRecordModelFromJson(json);
}
