// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';
import 'animal_enums.dart';

part 'animal_state_log_model.freezed.dart';
part 'animal_state_log_model.g.dart';

@freezed
class AnimalStateLogModel with _$AnimalStateLogModel {
  const factory AnimalStateLogModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'animal_id') required String animalId,
    required AnimalStateDimension dimension,
    @JsonKey(name: 'previous_value') String? previousValue,
    @JsonKey(name: 'new_value') required String newValue,
    @JsonKey(name: 'effective_timestamp', fromJson: dateFromJson, toJson: dateToJson) required DateTime effectiveTimestamp,
    @JsonKey(name: 'recorded_timestamp', fromJson: dateFromJson, toJson: dateToJson) required DateTime recordedTimestamp,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    String? reason,
    String? notes,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
  }) = _AnimalStateLogModel;

  factory AnimalStateLogModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalStateLogModelFromJson(json);
}
