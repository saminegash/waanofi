import 'package:freezed_annotation/freezed_annotation.dart';
import 'production_batch_model.dart';

part 'marketplace_listing_model.freezed.dart';
part 'marketplace_listing_model.g.dart';

@freezed
class MarketplaceListingModel with _$MarketplaceListingModel {
  const factory MarketplaceListingModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'batch_id') required String batchId,
    required ProductCategory category,
    required String title,
    String? description,
    required String unit,
    @JsonKey(name: 'unit_price_minor') required int unitPriceMinor,
    @Default('ETB') String currency,
    @JsonKey(name: 'quantity_available') required double quantityAvailable,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    // Joined fields (optional, from queries)
    @JsonKey(name: 'farms') Map<String, dynamic>? farm,
  }) = _MarketplaceListingModel;

  factory MarketplaceListingModel.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceListingModelFromJson(json);
}

/// Helper extension for price display
extension MarketplaceListingPricing on MarketplaceListingModel {
  /// Price in ETB as a formatted string (e.g., "45.00")
  String get priceFormatted {
    final etb = unitPriceMinor / 100.0;
    return etb.toStringAsFixed(2);
  }

  /// Price in ETB as a double (for calculations in display only)
  double get priceEtb => unitPriceMinor / 100.0;
}
