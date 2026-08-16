import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/cart_item_model.dart';
import '../../domain/cart_model.dart';
import '../../domain/public_listing_model.dart';

enum CartActionResultType {
  success,
  farmConflict,
  validationError,
  offlineBlocked,
}

class CartActionResult {
  final CartActionResultType type;
  final String? message;
  final String? existingFarmName;
  final String? newFarmName;
  final PublicListingModel? pendingListing;
  final int? pendingQuantity;

  CartActionResult({
    required this.type,
    this.message,
    this.existingFarmName,
    this.newFarmName,
    this.pendingListing,
    this.pendingQuantity,
  });

  bool get isSuccess => type == CartActionResultType.success;
  bool get isFarmConflict => type == CartActionResultType.farmConflict;
}

final cartControllerProvider = StateNotifierProvider<CartController, CartModel>((ref) {
  return CartController();
});

class CartController extends StateNotifier<CartModel> {
  CartController() : super(const CartModel());

  /// Attempt to add an item from a public listing to the cart
  CartActionResult addItem(PublicListingModel listing, {required int quantity}) {
    // 1. Check if listing is active and available
    if (listing.isPaused || listing.listingStatus == 'paused') {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Paused listings cannot be newly added to the cart.',
      );
    }
    if (listing.isOutOfStock) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'This product is out of stock.',
      );
    }

    // 2. Enforce Single-Farm Cart rule
    if (!state.canAddListingFromFarm(listing.farmId)) {
      return CartActionResult(
        type: CartActionResultType.farmConflict,
        existingFarmName: state.farmName ?? 'another farm',
        newFarmName: listing.publicFarmName,
        pendingListing: listing,
        pendingQuantity: quantity,
      );
    }

    // 3. Validate Quantity limits
    if (quantity < listing.minimumOrderQuantity) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Quantity ($quantity) is below Minimum Order Quantity (${listing.minimumOrderQuantity} ${listing.sellingUnit}).',
      );
    }
    if (listing.maximumOrderQuantity != null && quantity > listing.maximumOrderQuantity!) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Quantity exceeds Maximum Order Quantity (${listing.maximumOrderQuantity} ${listing.sellingUnit}).',
      );
    }
    if (quantity > listing.approximateAvailableQuantity && listing.approximateAvailableQuantity > 0) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Quantity exceeds currently available stock (${listing.approximateAvailableQuantity.toInt()} ${listing.sellingUnit}).',
      );
    }

    // 4. Add or merge item
    final existingIndex = state.items.indexWhere((i) => i.listingId == listing.listingId);
    List<CartItemModel> updatedItems = List.from(state.items);

    if (existingIndex >= 0) {
      final old = updatedItems[existingIndex];
      final mergedQty = old.quantity + quantity;
      if (listing.maximumOrderQuantity != null && mergedQty > listing.maximumOrderQuantity!) {
        return CartActionResult(
          type: CartActionResultType.validationError,
          message: 'Merged cart quantity exceeds Maximum Order Quantity (${listing.maximumOrderQuantity}).',
        );
      }
      updatedItems[existingIndex] = old.copyWith(quantity: mergedQty);
    } else {
      updatedItems.add(CartItemModel.fromPublicListing(listing, quantity: quantity));
    }

    state = state.copyWith(
      farmId: listing.farmId,
      farmName: listing.publicFarmName,
      items: updatedItems,
      selectedFulfilmentMethod: state.selectedFulfilmentMethod ?? (listing.supportsPickup ? 'pickup' : 'delivery'),
    );

    return CartActionResult(type: CartActionResultType.success);
  }

  /// Explicitly clear items from previous farm and add item from new farm
  CartActionResult clearAndAddItem(PublicListingModel listing, {required int quantity}) {
    state = const CartModel();
    return addItem(listing, quantity: quantity);
  }

  /// Update quantity of an existing item in cart
  CartActionResult updateQuantity(String listingId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(listingId);
      return CartActionResult(type: CartActionResultType.success);
    }

    final index = state.items.indexWhere((i) => i.listingId == listingId);
    if (index < 0) {
      return CartActionResult(type: CartActionResultType.validationError, message: 'Item not found in cart.');
    }

    final item = state.items[index];
    if (newQuantity < item.minimumOrderQuantity) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Quantity cannot be below Minimum Order Quantity (${item.minimumOrderQuantity}).',
      );
    }
    if (item.maximumOrderQuantity != null && newQuantity > item.maximumOrderQuantity!) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Quantity cannot exceed Maximum Order Quantity (${item.maximumOrderQuantity}).',
      );
    }

    List<CartItemModel> updated = List.from(state.items);
    updated[index] = item.copyWith(quantity: newQuantity);
    state = state.copyWith(items: updated);

    return CartActionResult(type: CartActionResultType.success);
  }

  void removeItem(String listingId) {
    final updated = state.items.where((i) => i.listingId != listingId).toList();
    if (updated.isEmpty) {
      state = const CartModel();
    } else {
      state = state.copyWith(items: updated);
    }
  }

  void setFulfilmentMethod(String method) {
    state = state.copyWith(selectedFulfilmentMethod: method);
  }

  void setDeliveryAddress(String? addressId) {
    state = state.copyWith(selectedDeliveryAddressId: addressId);
  }

  void setTimeSlot(String? timeSlot) {
    state = state.copyWith(selectedTimeSlot: timeSlot);
  }

  void setDeliveryInstructions(String? instructions) {
    state = state.copyWith(deliveryInstructions: instructions);
  }

  void clearCart() {
    state = const CartModel();
  }

  /// Validate cart state for online checkout transitions
  CartActionResult validateForCheckout({required bool isOffline}) {
    if (isOffline) {
      return CartActionResult(
        type: CartActionResultType.offlineBlocked,
        message: 'Checkout requires an active internet connection. Offline ordering is blocked.',
      );
    }
    if (state.isEmpty) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Your cart is currently empty.',
      );
    }
    if (!state.allItemsValid) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Some items in your cart do not meet minimum or maximum quantity requirements.',
      );
    }
    if (state.selectedFulfilmentMethod == 'delivery' && (state.selectedDeliveryAddressId == null || state.selectedDeliveryAddressId!.isEmpty)) {
      return CartActionResult(
        type: CartActionResultType.validationError,
        message: 'Please select a delivery address for order dispatch.',
      );
    }
    return CartActionResult(type: CartActionResultType.success);
  }
}
