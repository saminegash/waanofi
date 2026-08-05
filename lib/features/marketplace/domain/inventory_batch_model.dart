// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'inventory_batch_model.freezed.dart';
part 'inventory_batch_model.g.dart';

enum InventoryQualityStatus {
  @JsonValue('pending_inspection') pendingInspection,
  @JsonValue('approved') approved,
  @JsonValue('rejected') rejected,
  @JsonValue('quarantined') quarantined,
  @JsonValue('recalled') recalled,
  @JsonValue('expired') expired,
}

@freezed
class InventoryBatchModel with _$InventoryBatchModel {
  const factory InventoryBatchModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'batch_code') required String batchCode,
    @JsonKey(name: 'source_type') required String sourceType, // 'milk_production' or 'egg_production'
    @JsonKey(name: 'produced_quantity') required double producedQuantity,
    @JsonKey(name: 'approved_quantity') @Default(0.0) double approvedQuantity,
    @JsonKey(name: 'available_quantity') @Default(0.0) double availableQuantity,
    @JsonKey(name: 'reserved_quantity') @Default(0.0) double reservedQuantity,
    @JsonKey(name: 'sold_quantity') @Default(0.0) double soldQuantity,
    @JsonKey(name: 'rejected_quantity') @Default(0.0) double rejectedQuantity,
    @JsonKey(name: 'wasted_quantity') @Default(0.0) double wastedQuantity,
    @JsonKey(name: 'base_unit') required String baseUnit, // 'litres' or 'eggs'
    @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime producedAt,
    @JsonKey(name: 'packed_at', fromJson: nullableDateFromJson, toJson: nullableDateToJson) DateTime? packedAt,
    @JsonKey(name: 'expires_at', fromJson: nullableDateFromJson, toJson: nullableDateToJson) DateTime? expiresAt,
    @JsonKey(name: 'quality_status') @Default(InventoryQualityStatus.pendingInspection) InventoryQualityStatus qualityStatus,
    @JsonKey(name: 'marketplace_status') @Default('unlisted') String marketplaceStatus,
    @JsonKey(name: 'quality_metadata') @Default({}) Map<String, dynamic> qualityMetadata,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
    @Default(1) int version,
  }) = _InventoryBatchModel;

  factory InventoryBatchModel.fromJson(Map<String, dynamic> json) => _$InventoryBatchModelFromJson(json);
}

extension InventoryBatchValidation on InventoryBatchModel {
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  bool get canBeListed => qualityStatus == InventoryQualityStatus.approved && !isExpired && availableQuantity > 0;

  bool get isNearingExpiry {
    if (expiresAt == null || isExpired) return false;
    final remaining = expiresAt!.difference(DateTime.now());
    return remaining.inHours <= 24 && remaining.inHours > 0;
  }

  /// Converts egg count into standard trays and loose eggs
  String get formattedEggInventory {
    if (baseUnit != 'eggs') return '${availableQuantity.toStringAsFixed(1)} $baseUnit';
    final total = availableQuantity.toInt();
    final trays = total ~/ 30;
    final loose = total % 30;
    return '$trays Trays + $loose Loose';
  }

  void validate() {
    if (producedQuantity < 0 || approvedQuantity < 0 || availableQuantity < 0) {
      throw ArgumentError('Quantities cannot be negative.');
    }
    if (approvedQuantity > producedQuantity) {
      throw ArgumentError('Approved quantity cannot exceed total produced quantity.');
    }
    if (availableQuantity > approvedQuantity) {
      throw ArgumentError('Available quantity cannot exceed approved quantity.');
    }
  }
}
