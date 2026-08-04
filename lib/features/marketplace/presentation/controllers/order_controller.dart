import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/order_repository.dart';
import '../../domain/order_model.dart';

/// State for order management
class OrdersState {
  const OrdersState({
    this.buyerOrders = const [],
    this.sellerOrders = const [],
    this.isLoading = true,
    this.error,
  });

  final List<OrderModel> buyerOrders;
  final List<OrderModel> sellerOrders;
  final bool isLoading;
  final String? error;

  OrdersState copyWith({
    List<OrderModel>? buyerOrders,
    List<OrderModel>? sellerOrders,
    bool? isLoading,
    String? error,
  }) {
    return OrdersState(
      buyerOrders: buyerOrders ?? this.buyerOrders,
      sellerOrders: sellerOrders ?? this.sellerOrders,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

final orderControllerProvider =
    StateNotifierProvider.autoDispose<OrderController, OrdersState>((ref) {
  return OrderController(ref);
});

class OrderController extends StateNotifier<OrdersState> {
  OrderController(this._ref) : super(const OrdersState());

  final Ref _ref;

  /// Load buyer's orders
  Future<void> loadMyOrders() async {
    state = state.copyWith(isLoading: true);
    try {
      final repo = _ref.read(orderRepositoryProvider);
      final orders = await repo.getMyOrders();
      state = state.copyWith(buyerOrders: orders, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Load seller's farm orders
  Future<void> loadSellerOrders() async {
    state = state.copyWith(isLoading: true);
    try {
      final repo = _ref.read(orderRepositoryProvider);
      final orders = await repo.getSellerOrders();
      state = state.copyWith(sellerOrders: orders, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  /// Place a new order
  Future<Map<String, dynamic>> placeOrder({
    required String listingId,
    required double quantity,
    required PaymentMethod paymentMethod,
    required String buyerName,
    String? buyerPhone,
    required String deliveryAddress,
    String? deliveryNotes,
  }) async {
    final repo = _ref.read(orderRepositoryProvider);
    return repo.placeOrder(
      listingId: listingId,
      quantity: quantity,
      paymentMethod: paymentMethod,
      buyerName: buyerName,
      buyerPhone: buyerPhone,
      deliveryAddress: deliveryAddress,
      deliveryNotes: deliveryNotes,
    );
  }

  /// Update order status (seller admin)
  Future<void> updateOrderStatus({
    required String orderId,
    required MarketplaceOrderStatus newStatus,
    String? notes,
  }) async {
    final repo = _ref.read(orderRepositoryProvider);
    await repo.updateOrderStatus(
      orderId: orderId,
      newStatus: newStatus,
      notes: notes,
    );
    await loadSellerOrders(); // refresh
  }
}
