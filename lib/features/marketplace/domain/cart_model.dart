// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const factory CartModel({
    String? farmId,
    String? farmName,
    @Default([]) List<CartItemModel> items,
    String? selectedFulfilmentMethod, // 'pickup' or 'delivery'
    String? selectedDeliveryAddressId,
    String? selectedTimeSlot, // 'morning' or 'afternoon'
    String? deliveryInstructions,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
}

extension CartCalculations on CartModel {
  bool get isEmpty => items.isEmpty;
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  int get itemsTotalMinor => items.fold(0, (sum, item) => sum + item.totalCostMinor);
  double get itemsTotalEtb => itemsTotalMinor / 100.0;
  
  int get estimatedDeliveryFeeMinor {
    if (selectedFulfilmentMethod != 'delivery' || isEmpty) return 0;
    // Standard flat delivery base estimate in minor units (e.g. 150 ETB = 15000 santim)
    return 15000;
  }
  double get estimatedDeliveryFeeEtb => estimatedDeliveryFeeMinor / 100.0;
  
  int get grandTotalMinor => itemsTotalMinor + estimatedDeliveryFeeMinor;
  double get grandTotalEtb => grandTotalMinor / 100.0;
  
  bool get allItemsValid => items.every((item) => item.isValidQuantity);
  
  bool canAddListingFromFarm(String newFarmId) {
    if (isEmpty || farmId == null) return true;
    return farmId == newFarmId;
  }
}
