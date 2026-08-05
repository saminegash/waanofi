// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_product_model.freezed.dart';
part 'market_product_model.g.dart';

@freezed
class MarketProductModel with _$MarketProductModel {
  const factory MarketProductModel({
    required String id,
    @JsonKey(name: 'product_code') required String productCode,
    required String category,
    @JsonKey(name: 'name_en') required String nameEn,
    @JsonKey(name: 'name_am') required String nameAm,
    @JsonKey(name: 'name_om') required String nameOm,
    @JsonKey(name: 'base_inventory_unit') required String baseInventoryUnit,
    @JsonKey(name: 'default_shelf_life_guidance') String? defaultShelfLifeGuidance,
    @Default(true) bool active,
    String? image,
    @JsonKey(name: 'display_order') @Default(0) int displayOrder,
  }) = _MarketProductModel;

  factory MarketProductModel.fromJson(Map<String, dynamic> json) => _$MarketProductModelFromJson(json);
}

extension MarketProductLocalization on MarketProductModel {
  String localizedName(String languageCode) {
    switch (languageCode) {
      case 'am':
        return nameAm;
      case 'om':
        return nameOm;
      default:
        return nameEn;
    }
  }
}
