// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'buyer_account_model.freezed.dart';
part 'buyer_account_model.g.dart';

enum BuyerType {
  @JsonValue('household') household,
  @JsonValue('retail_shop') retailShop,
  @JsonValue('cafe') cafe,
  @JsonValue('restaurant') restaurant,
  @JsonValue('hotel') hotel,
  @JsonValue('bakery') bakery,
  @JsonValue('school') school,
  @JsonValue('institution') institution,
  @JsonValue('other_business') otherBusiness,
}

@freezed
class BuyerAccountModel with _$BuyerAccountModel {
  const factory BuyerAccountModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'buyer_type') @Default(BuyerType.household) BuyerType buyerType,
    @JsonKey(name: 'organization_name') String? organizationName,
    @JsonKey(name: 'contact_name') required String contactName,
    required String phone,
    required String email,
    @JsonKey(name: 'tax_number') String? taxNumber,
    @JsonKey(name: 'verification_status') @Default('unverified') String verificationStatus,
    @JsonKey(name: 'preferred_language') @Default('en') String preferredLanguage,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
  }) = _BuyerAccountModel;

  factory BuyerAccountModel.fromJson(Map<String, dynamic> json) => _$BuyerAccountModelFromJson(json);
}

extension BuyerAccountValidation on BuyerAccountModel {
  bool get isInstitutional => buyerType != BuyerType.household;
  bool get isVerified => verificationStatus == 'verified';
}
