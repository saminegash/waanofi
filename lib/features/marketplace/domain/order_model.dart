import 'package:freezed_annotation/freezed_annotation.dart';
import 'production_batch_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

enum MarketplaceOrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('processing')
  processing,
  @JsonValue('ready_for_delivery')
  readyForDelivery,
  @JsonValue('out_for_delivery')
  outForDelivery,
  @JsonValue('delivered')
  delivered,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum PaymentStatus {
  @JsonValue('unpaid')
  unpaid,
  @JsonValue('pending')
  pending,
  @JsonValue('paid')
  paid,
  @JsonValue('refunded')
  refunded,
}

enum PaymentMethod {
  @JsonValue('cash_on_delivery')
  cashOnDelivery,
  @JsonValue('telebirr')
  telebirr,
  @JsonValue('cbe')
  cbe,
  @JsonValue('bank_transfer')
  bankTransfer,
}

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'seller_farm_id') required String sellerFarmId,
    required MarketplaceOrderStatus status,
    @JsonKey(name: 'payment_status') required PaymentStatus paymentStatus,
    @JsonKey(name: 'payment_method') required PaymentMethod paymentMethod,
    @JsonKey(name: 'subtotal_minor') required int subtotalMinor,
    @JsonKey(name: 'delivery_fee_minor') @Default(0) int deliveryFeeMinor,
    @JsonKey(name: 'total_amount_minor') required int totalAmountMinor,
    @Default('ETB') String currency,
    @JsonKey(name: 'buyer_name') required String buyerName,
    @JsonKey(name: 'buyer_phone') String? buyerPhone,
    @JsonKey(name: 'delivery_address') required String deliveryAddress,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    // Joined
    @JsonKey(name: 'order_items') List<OrderItemModel>? items,
    @JsonKey(name: 'delivery_info') List<DeliveryInfoModel>? deliveryInfo,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

/// Helper extension for order price display
extension OrderPricing on OrderModel {
  double get totalEtb => totalAmountMinor / 100.0;
  double get subtotalEtb => subtotalMinor / 100.0;
  double get deliveryFeeEtb => deliveryFeeMinor / 100.0;
  String get totalFormatted => totalEtb.toStringAsFixed(2);
}

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'listing_id') String? listingId,
    @JsonKey(name: 'batch_id') String? batchId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_category') required ProductCategory productCategory,
    required String unit,
    required double quantity,
    @JsonKey(name: 'unit_price_minor') required int unitPriceMinor,
    @JsonKey(name: 'line_total_minor') required int lineTotalMinor,
    @Default('ETB') String currency,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

enum DeliveryTrackingStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('assigned')
  assigned,
  @JsonValue('picked_up')
  pickedUp,
  @JsonValue('in_transit')
  inTransit,
  @JsonValue('delivered')
  delivered,
  @JsonValue('failed')
  failed,
}

@freezed
class DeliveryInfoModel with _$DeliveryInfoModel {
  const factory DeliveryInfoModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    required DeliveryTrackingStatus status,
    @JsonKey(name: 'assigned_driver_name') String? assignedDriverName,
    @JsonKey(name: 'assigned_driver_phone') String? assignedDriverPhone,
    @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @JsonKey(name: 'estimated_delivery_at') DateTime? estimatedDeliveryAt,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _DeliveryInfoModel;

  factory DeliveryInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryInfoModelFromJson(json);
}
