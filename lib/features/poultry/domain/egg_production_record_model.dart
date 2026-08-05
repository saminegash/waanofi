// ignore_for_file: invalid_annotation_target, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/date_formatter.dart';

part 'egg_production_record_model.freezed.dart';
part 'egg_production_record_model.g.dart';

@freezed
class EggProductionRecordModel with _$EggProductionRecordModel {
  const factory EggProductionRecordModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'flock_id') required String flockId,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    ) required DateTime productionDate,
    @JsonKey(name: 'good_eggs') @Default(0) int goodEggs,
    @JsonKey(name: 'cracked_eggs') @Default(0) int crackedEggs,
    @JsonKey(name: 'rejected_eggs') @Default(0) int rejectedEggs,
    @JsonKey(name: 'farm_use_eggs') @Default(0) int farmUseEggs,
    @JsonKey(name: 'sold_directly_eggs') @Default(0) int soldDirectlyEggs,
    @JsonKey(name: 'available_eggs') @Default(0) int availableEggs,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _EggProductionRecordModel;

  factory EggProductionRecordModel.fromJson(Map<String, dynamic> json) =>
      _$EggProductionRecordModelFromJson(json);
}

class EggProductionValidationException implements Exception {
  final String message;
  EggProductionValidationException(this.message);
  @override
  String toString() => message;
}

extension EggProductionRecordHelpers on EggProductionRecordModel {
  /// Total eggs collected across all condition categories.
  int get totalCollected => goodEggs + crackedEggs + rejectedEggs;

  /// Computed available eggs remaining for marketplace sale or inventory.
  int get computedAvailable => goodEggs - farmUseEggs - soldDirectlyEggs;

  /// Number of complete 30-egg trays available.
  int get fullTrays => availableEggs ~/ 30;

  /// Loose remaining eggs outside full trays.
  int get looseEggs => availableEggs % 30;

  /// Formats available eggs as trays and loose remainder (e.g. "20 full trays, 20 loose eggs").
  String get formattedTrayEquivalent {
    final trays = fullTrays;
    final loose = looseEggs;
    final trayStr = trays == 1 ? '1 full tray' : '$trays full trays';
    final looseStr = loose == 1 ? '1 loose egg' : '$loose loose eggs';
    if (trays > 0 && loose > 0) {
      return '$trayStr, $looseStr';
    } else if (trays > 0) {
      return trayStr;
    } else {
      return looseStr;
    }
  }

  /// Validates domain compliance: zero tolerance for negative quantities or impossible allocations.
  void validate() {
    if (goodEggs < 0 || crackedEggs < 0 || rejectedEggs < 0 || farmUseEggs < 0 || soldDirectlyEggs < 0 || availableEggs < 0) {
      throw EggProductionValidationException('Egg quantities cannot be negative.');
    }
    if (farmUseEggs + soldDirectlyEggs > goodEggs) {
      throw EggProductionValidationException('Allocated eggs ($farmUseEggs farm use + $soldDirectlyEggs direct sales) cannot exceed collected good eggs ($goodEggs).');
    }
  }
}
