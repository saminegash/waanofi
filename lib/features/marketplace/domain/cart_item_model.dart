// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'public_listing_model.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String listingId,
    required String farmId,
    required String productCode,
    required String title,
    required String sellingUnit,
    required int unitPriceMinor,
    required int quantity,
    required int minimumOrderQuantity,
    int? maximumOrderQuantity,
    required double approximateStock,
    String? image,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

  factory CartItemModel.fromPublicListing(PublicListingModel listing, {required int quantity}) {
    return CartItemModel(
      listingId: listing.listingId,
      farmId: listing.farmId,
      productCode: listing.productCode,
      title: listing.publicTitle,
      sellingUnit: listing.sellingUnit,
      unitPriceMinor: listing.priceInMinorUnits,
      quantity: quantity,
      minimumOrderQuantity: listing.minimumOrderQuantity,
      maximumOrderQuantity: listing.maximumOrderQuantity,
      approximateStock: listing.approximateAvailableQuantity,
      image: listing.productDefaultImage ?? listing.farmLogo,
    );
  }
}

extension CartItemCalculations on CartItemModel {
  int get totalCostMinor => unitPriceMinor * quantity;
  double get unitPriceEtb => unitPriceMinor / 100.0;
  double get totalCostEtb => totalCostMinor / 100.0;
  
  bool get isValidQuantity {
    if (quantity < minimumOrderQuantity) return false;
    if (maximumOrderQuantity != null && quantity > maximumOrderQuantity!) return false;
    if (quantity > approximateStock && approximateStock > 0) return false;
    return true;
  }
}
