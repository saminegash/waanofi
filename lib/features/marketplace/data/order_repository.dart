import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../domain/order_model.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final user = ref.watch(currentUserProvider);
  return OrderRepository(
    client: Supabase.instance.client,
    farmId: user?.farmId,
    userId: user?.id,
  );
});

/// Repository for marketplace orders.
///
/// Orders are online-only — checkout requires connectivity.
/// All pricing and inventory validation happens server-side via
/// the `place_order` PostgreSQL function (SECURITY DEFINER).
class OrderRepository {
  OrderRepository({
    required SupabaseClient client,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _farmId = farmId,
        _userId = userId;

  final SupabaseClient _client;
  final String? _farmId;
  final String? _userId;

  // ───────────────── Place Order ─────────────────

  /// Place an order via server-side RPC.
  ///
  /// The server validates:
  /// - Authentication
  /// - Inventory availability
  /// - Computes totals from DB prices (NEVER trusts client prices)
  /// - Atomically decrements inventory
  Future<Map<String, dynamic>> placeOrder({
    required String listingId,
    required double quantity,
    required PaymentMethod paymentMethod,
    required String buyerName,
    String? buyerPhone,
    required String deliveryAddress,
    String? deliveryNotes,
  }) async {
    final response = await _client.rpc('place_order', params: {
      'p_listing_id': listingId,
      'p_quantity': quantity,
      'p_payment_method': paymentMethod.name == 'cashOnDelivery'
          ? 'cash_on_delivery'
          : paymentMethod.name == 'bankTransfer'
              ? 'bank_transfer'
              : paymentMethod.name,
      'p_buyer_name': buyerName,
      'p_buyer_phone': buyerPhone,
      'p_delivery_address': deliveryAddress,
      'p_delivery_notes': deliveryNotes,
    });
    return Map<String, dynamic>.from(response);
  }

  // ───────────────── Buyer Orders ─────────────────

  /// Get orders placed by the current user (buyer view)
  Future<List<OrderModel>> getMyOrders() async {
    if (_userId == null) return [];
    final response = await _client
        .from('orders')
        .select('*, order_items(*), delivery_info(*)')
        .eq('buyer_id', _userId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => OrderModel.fromJson(json))
        .toList();
  }

  /// Get a single order by ID
  Future<OrderModel> getOrderById(String orderId) async {
    final response = await _client
        .from('orders')
        .select('*, order_items(*), delivery_info(*)')
        .eq('id', orderId)
        .single();

    return OrderModel.fromJson(response);
  }

  // ───────────────── Seller Orders ─────────────────

  /// Get orders for the seller's farm (admin view)
  Future<List<OrderModel>> getSellerOrders() async {
    if (_farmId == null) return [];
    final response = await _client
        .from('orders')
        .select('*, order_items(*), delivery_info(*)')
        .eq('seller_farm_id', _farmId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => OrderModel.fromJson(json))
        .toList();
  }

  // ───────────────── Order Status ─────────────────

  /// Update order status via server-side RPC (seller admin only)
  Future<Map<String, dynamic>> updateOrderStatus({
    required String orderId,
    required MarketplaceOrderStatus newStatus,
    String? notes,
  }) async {
    final statusStr = _orderStatusToString(newStatus);
    final response = await _client.rpc('update_order_status', params: {
      'p_order_id': orderId,
      'p_new_status': statusStr,
      'p_notes': notes,
    });
    return Map<String, dynamic>.from(response);
  }

  // ───────────────── Delivery ─────────────────

  /// Update delivery info via server-side RPC (seller admin only)
  Future<Map<String, dynamic>> updateDeliveryInfo({
    required String orderId,
    DeliveryTrackingStatus? status,
    String? driverName,
    String? driverPhone,
    DateTime? estimatedDelivery,
    String? notes,
  }) async {
    final response = await _client.rpc('update_delivery_info', params: {
      'p_order_id': orderId,
      'p_status': status != null ? _deliveryStatusToString(status) : null,
      'p_driver_name': driverName,
      'p_driver_phone': driverPhone,
      'p_estimated_delivery': estimatedDelivery?.toIso8601String(),
      'p_notes': notes,
    });
    return Map<String, dynamic>.from(response);
  }

  // ───────────────── Helpers ─────────────────

  String _orderStatusToString(MarketplaceOrderStatus status) {
    switch (status) {
      case MarketplaceOrderStatus.pending:
        return 'pending';
      case MarketplaceOrderStatus.confirmed:
        return 'confirmed';
      case MarketplaceOrderStatus.processing:
        return 'processing';
      case MarketplaceOrderStatus.readyForDelivery:
        return 'ready_for_delivery';
      case MarketplaceOrderStatus.outForDelivery:
        return 'out_for_delivery';
      case MarketplaceOrderStatus.delivered:
        return 'delivered';
      case MarketplaceOrderStatus.completed:
        return 'completed';
      case MarketplaceOrderStatus.cancelled:
        return 'cancelled';
    }
  }

  String _deliveryStatusToString(DeliveryTrackingStatus status) {
    switch (status) {
      case DeliveryTrackingStatus.pending:
        return 'pending';
      case DeliveryTrackingStatus.assigned:
        return 'assigned';
      case DeliveryTrackingStatus.pickedUp:
        return 'picked_up';
      case DeliveryTrackingStatus.inTransit:
        return 'in_transit';
      case DeliveryTrackingStatus.delivered:
        return 'delivered';
      case DeliveryTrackingStatus.failed:
        return 'failed';
    }
  }
}
