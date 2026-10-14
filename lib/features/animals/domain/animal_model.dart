// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';
import 'animal_enums.dart';

part 'animal_model.freezed.dart';
part 'animal_model.g.dart';

@freezed
class AnimalModel with _$AnimalModel {
  const factory AnimalModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'tag_number') required String tagNumber,
    String? name,
    String? breed,
    required String sex,
    @JsonKey(fromJson: nullableDateFromJson, toJson: nullableDateToJson) DateTime? dob,
    @JsonKey(name: 'lifecycle_status') @Default(AnimalLifecycleStatus.active) AnimalLifecycleStatus lifecycleStatus,
    @JsonKey(name: 'reproductive_status') @Default(AnimalReproductiveStatus.unknown) AnimalReproductiveStatus reproductiveStatus,
    @JsonKey(name: 'lactation_status') @Default(AnimalLactationStatus.unknown) AnimalLactationStatus lactationStatus,
    @JsonKey(name: 'health_status') @Default(AnimalHealthStatus.healthy) AnimalHealthStatus healthStatus,
    @JsonKey(name: 'cattle_class') @Default(CattleClass.cow) CattleClass cattleClass,
    String? location,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
    @JsonKey(name: 'deleted_at', fromJson: nullableDateFromJson, toJson: nullableDateToJson) DateTime? deletedAt,
  }) = _AnimalModel;

  factory AnimalModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalModelFromJson(json);
}

extension AnimalModelValidation on AnimalModel {
  bool get isLiveInventory =>
      lifecycleStatus == AnimalLifecycleStatus.active && deletedAt == null;

  bool get isMilkingEligible =>
      lifecycleStatus == AnimalLifecycleStatus.active &&
      sex.toLowerCase() == 'female' &&
      lactationStatus == AnimalLactationStatus.lactating &&
      deletedAt == null;

  void validate() {
    if (tagNumber.trim().isEmpty) {
      throw ArgumentError('Tag number cannot be empty.');
    }
    final normalizedSex = sex.toLowerCase();
    if (normalizedSex == 'male') {
      if (reproductiveStatus != AnimalReproductiveStatus.notApplicable &&
          reproductiveStatus != AnimalReproductiveStatus.unknown) {
        throw ArgumentError('Male animals cannot have active female reproductive status.');
      }
      if (lactationStatus != AnimalLactationStatus.notApplicable &&
          lactationStatus != AnimalLactationStatus.unknown) {
        throw ArgumentError('Male animals cannot have lactation status other than notApplicable.');
      }
      if (cattleClass == CattleClass.cow || cattleClass == CattleClass.heifer) {
        throw ArgumentError('Male animals cannot be classified as cow or heifer.');
      }
    }
    if (normalizedSex == 'female') {
      if (cattleClass == CattleClass.bull || cattleClass == CattleClass.steer) {
        throw ArgumentError('Female animals cannot be classified as bull or steer.');
      }
    }
  }
}
