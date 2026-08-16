// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_listing_model.freezed.dart';
part 'public_listing_model.g.dart';

@freezed
class PublicListingModel with _$PublicListingModel {
  const factory PublicListingModel({
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'listing_status') required String listingStatus,
    @JsonKey(name: 'public_title') required String publicTitle,
    @JsonKey(name: 'public_description') required String publicDescription,
    @JsonKey(name: 'selling_unit') required String sellingUnit,
    @JsonKey(name: 'unit_conversion') @Default('1 unit') String unitConversion,
    @JsonKey(name: 'price_in_minor_units') required int priceInMinorUnits,
    @Default('ETB') String currency,
    @JsonKey(name: 'minimum_order_quantity') @Default(1) int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods') @Default([]) List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') @Default([]) List<String> availableDays,
    @JsonKey(name: 'preparation_time') @Default('24 hours') String preparationTime,
    @JsonKey(name: 'product_code') required String productCode,
    required String category,
    @JsonKey(name: 'product_name_en') required String productNameEn,
    @JsonKey(name: 'product_name_am') String? productNameAm,
    @JsonKey(name: 'product_name_om') String? productNameOm,
    @JsonKey(name: 'product_default_image') String? productDefaultImage,
    @JsonKey(name: 'public_farm_name') required String publicFarmName,
    @JsonKey(name: 'general_location') required String generalLocation,
    @JsonKey(name: 'pickup_availability') @Default(true) bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') @Default(false) bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') @Default([]) List<String> deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') @Default('Mon-Sat 6:00 AM - 6:00 PM') String openingHours,
    @JsonKey(name: 'verification_status') @Default('approved') String verificationStatus,
    @JsonKey(name: 'farm_logo') String? farmLogo,
    @JsonKey(name: 'farm_cover_image') String? farmCoverImage,
    @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0) @Default(0.0) double approximateAvailableQuantity,
  }) = _PublicListingModel;

  factory PublicListingModel.fromJson(Map<String, dynamic> json) => _$PublicListingModelFromJson(json);
}

extension PublicListingFormatting on PublicListingModel {
  double get priceEtb => priceInMinorUnits / 100.0;
  String get formattedPriceEtb => '${priceEtb.toStringAsFixed(2)} $currency / $sellingUnit';
  
  bool get supportsPickup => pickupAvailability || availableFulfilmentMethods.contains('pickup');
  bool get supportsDelivery => deliveryAvailability || availableFulfilmentMethods.contains('delivery');
  
  bool get isOutOfStock => approximateAvailableQuantity < minimumOrderQuantity || listingStatus == 'out_of_stock';
  bool get isPaused => listingStatus == 'paused';
  bool get canBeOrdered => !isOutOfStock && !isPaused && listingStatus == 'active';
  
  String localizedName(String languageCode) {
    switch (languageCode) {
      case 'am':
        return productNameAm ?? publicTitle;
      case 'om':
        return productNameOm ?? publicTitle;
      default:
        return productNameEn;
    }
  }
}
