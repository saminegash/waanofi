import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'production_batch_model.freezed.dart';
part 'production_batch_model.g.dart';

enum ProductCategory {
  @JsonValue('fresh_milk')
  freshMilk,
  @JsonValue('eggs')
  eggs,
}

enum BatchStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('listed')
  listed,
  @JsonValue('sold_out')
  soldOut,
  @JsonValue('expired')
  expired,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
class ProductionBatchModel with _$ProductionBatchModel {
  const factory ProductionBatchModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    required ProductCategory category,
    @JsonKey(name: 'batch_label') required String batchLabel,
    @JsonKey(name: 'quantity_total') required double quantityTotal,
    @JsonKey(name: 'quantity_available') required double quantityAvailable,
    required String unit,
    @JsonKey(name: 'unit_price_minor') required int unitPriceMinor,
    @Default('ETB') String currency,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    ) required DateTime productionDate,
    @JsonKey(
      name: 'expiry_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    ) DateTime? expiryDate,
    required BatchStatus status,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'approved_at') DateTime? approvedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ProductionBatchModel;

  factory ProductionBatchModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionBatchModelFromJson(json);
}
