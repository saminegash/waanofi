// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'seller_listing_model.freezed.dart';
part 'seller_listing_model.g.dart';

enum SellerListingStatus {
  @JsonValue('draft') draft,
  @JsonValue('pending_approval') pendingApproval,
  @JsonValue('active') active,
  @JsonValue('paused') paused,
  @JsonValue('out_of_stock') outOfStock,
  @JsonValue('rejected') rejected,
  @JsonValue('suspended') suspended,
  @JsonValue('archived') archived,
}

@freezed
class SellerListingModel with _$SellerListingModel {
  const factory SellerListingModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'public_title') required String publicTitle,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'selling_unit') required String sellingUnit,
    @JsonKey(name: 'unit_conversion') @Default(1) int unitConversion,
    @JsonKey(name: 'price_in_minor_units') required int priceInMinorUnits,
    @Default('ETB') String currency,
    @JsonKey(name: 'minimum_order_quantity') @Default(1) int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods') @Default(['pickup']) List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') @Default(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']) List<String> availableDays,
    @JsonKey(name: 'preparation_time') @Default('2 hours') String preparationTime,
    @Default(SellerListingStatus.draft) SellerListingStatus status,
    @JsonKey(name: 'approval_status') @Default('pending') String approvalStatus,
    @JsonKey(name: 'published_at', fromJson: nullableDateFromJson, toJson: nullableDateToJson) DateTime? publishedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
    // Optional joined fields for presentation
    @JsonKey(name: 'approximate_available_quantity') @Default(0.0) double approximateAvailableQuantity,
  }) = _SellerListingModel;

  factory SellerListingModel.fromJson(Map<String, dynamic> json) => _$SellerListingModelFromJson(json);
}

extension SellerListingExactPricing on SellerListingModel {
  /// Exact price formatting from santim (1/100 ETB) without floating point rounding errors
  String get priceFormatted {
    final whole = priceInMinorUnits ~/ 100;
    final remainder = priceInMinorUnits % 100;
    return '$whole.${remainder.toString().padLeft(2, '0')} $currency';
  }

  /// Exact calculation of order total in santim
  int computeOrderTotalMinorUnits(int quantity) {
    if (quantity < minimumOrderQuantity) {
      throw ArgumentError('Order quantity falls below mandatory minimum order quantity of $minimumOrderQuantity.');
    }
    if (maximumOrderQuantity != null && quantity > maximumOrderQuantity!) {
      throw ArgumentError('Order quantity exceeds maximum allowable order quantity of $maximumOrderQuantity.');
    }
    return priceInMinorUnits * quantity;
  }

  bool get isActive => status == SellerListingStatus.active;
  bool get isPaused => status == SellerListingStatus.paused;
  bool get isOutOfStock => status == SellerListingStatus.outOfStock || approximateAvailableQuantity <= 0;
}
