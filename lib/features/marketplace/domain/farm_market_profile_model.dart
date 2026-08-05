// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'farm_market_profile_model.freezed.dart';
part 'farm_market_profile_model.g.dart';

enum MarketProfileStatus {
  @JsonValue('draft') draft,
  @JsonValue('pending_review') pendingReview,
  @JsonValue('approved') approved,
  @JsonValue('rejected') rejected,
  @JsonValue('suspended') suspended,
}

@freezed
class FarmMarketProfileModel with _$FarmMarketProfileModel {
  const factory FarmMarketProfileModel({
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'public_farm_name') required String publicFarmName,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'public_phone') String? publicPhone,
    @JsonKey(name: 'public_email') String? publicEmail,
    String? logo,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'general_location') required String generalLocation,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'pickup_availability') @Default(true) bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') @Default(false) bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') String? deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') @Default('Mon-Sat 8:00 AM - 5:00 PM') String openingHours,
    @JsonKey(name: 'verification_status') @Default('unverified') String verificationStatus,
    @JsonKey(name: 'marketplace_status') @Default(MarketProfileStatus.draft) MarketProfileStatus marketplaceStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
  }) = _FarmMarketProfileModel;

  factory FarmMarketProfileModel.fromJson(Map<String, dynamic> json) => _$FarmMarketProfileModelFromJson(json);
}

extension FarmMarketProfileEligibility on FarmMarketProfileModel {
  bool get isEligibleToPublish => marketplaceStatus == MarketProfileStatus.approved;
  bool get isPending => marketplaceStatus == MarketProfileStatus.pendingReview;
}
