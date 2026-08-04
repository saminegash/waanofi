// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number')
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_farm_id')
  String get sellerFarmId => throw _privateConstructorUsedError;
  MarketplaceOrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_minor')
  int get subtotalMinor => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_fee_minor')
  int get deliveryFeeMinor => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount_minor')
  int get totalAmountMinor => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_name')
  String get buyerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_phone')
  String? get buyerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_notes')
  String? get deliveryNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError; // Joined
  @JsonKey(name: 'order_items')
  List<OrderItemModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_info')
  List<DeliveryInfoModel>? get deliveryInfo =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
    OrderModel value,
    $Res Function(OrderModel) then,
  ) = _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(name: 'buyer_id') String buyerId,
    @JsonKey(name: 'seller_farm_id') String sellerFarmId,
    MarketplaceOrderStatus status,
    @JsonKey(name: 'payment_status') PaymentStatus paymentStatus,
    @JsonKey(name: 'payment_method') PaymentMethod paymentMethod,
    @JsonKey(name: 'subtotal_minor') int subtotalMinor,
    @JsonKey(name: 'delivery_fee_minor') int deliveryFeeMinor,
    @JsonKey(name: 'total_amount_minor') int totalAmountMinor,
    String currency,
    @JsonKey(name: 'buyer_name') String buyerName,
    @JsonKey(name: 'buyer_phone') String? buyerPhone,
    @JsonKey(name: 'delivery_address') String deliveryAddress,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'order_items') List<OrderItemModel>? items,
    @JsonKey(name: 'delivery_info') List<DeliveryInfoModel>? deliveryInfo,
  });
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? buyerId = null,
    Object? sellerFarmId = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? subtotalMinor = null,
    Object? deliveryFeeMinor = null,
    Object? totalAmountMinor = null,
    Object? currency = null,
    Object? buyerName = null,
    Object? buyerPhone = freezed,
    Object? deliveryAddress = null,
    Object? deliveryNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = freezed,
    Object? deliveryInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            buyerId: null == buyerId
                ? _value.buyerId
                : buyerId // ignore: cast_nullable_to_non_nullable
                      as String,
            sellerFarmId: null == sellerFarmId
                ? _value.sellerFarmId
                : sellerFarmId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MarketplaceOrderStatus,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as PaymentStatus,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as PaymentMethod,
            subtotalMinor: null == subtotalMinor
                ? _value.subtotalMinor
                : subtotalMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            deliveryFeeMinor: null == deliveryFeeMinor
                ? _value.deliveryFeeMinor
                : deliveryFeeMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            totalAmountMinor: null == totalAmountMinor
                ? _value.totalAmountMinor
                : totalAmountMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            buyerName: null == buyerName
                ? _value.buyerName
                : buyerName // ignore: cast_nullable_to_non_nullable
                      as String,
            buyerPhone: freezed == buyerPhone
                ? _value.buyerPhone
                : buyerPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryAddress: null == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryNotes: freezed == deliveryNotes
                ? _value.deliveryNotes
                : deliveryNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemModel>?,
            deliveryInfo: freezed == deliveryInfo
                ? _value.deliveryInfo
                : deliveryInfo // ignore: cast_nullable_to_non_nullable
                      as List<DeliveryInfoModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
    _$OrderModelImpl value,
    $Res Function(_$OrderModelImpl) then,
  ) = __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_number') String orderNumber,
    @JsonKey(name: 'buyer_id') String buyerId,
    @JsonKey(name: 'seller_farm_id') String sellerFarmId,
    MarketplaceOrderStatus status,
    @JsonKey(name: 'payment_status') PaymentStatus paymentStatus,
    @JsonKey(name: 'payment_method') PaymentMethod paymentMethod,
    @JsonKey(name: 'subtotal_minor') int subtotalMinor,
    @JsonKey(name: 'delivery_fee_minor') int deliveryFeeMinor,
    @JsonKey(name: 'total_amount_minor') int totalAmountMinor,
    String currency,
    @JsonKey(name: 'buyer_name') String buyerName,
    @JsonKey(name: 'buyer_phone') String? buyerPhone,
    @JsonKey(name: 'delivery_address') String deliveryAddress,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'order_items') List<OrderItemModel>? items,
    @JsonKey(name: 'delivery_info') List<DeliveryInfoModel>? deliveryInfo,
  });
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
    _$OrderModelImpl _value,
    $Res Function(_$OrderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? buyerId = null,
    Object? sellerFarmId = null,
    Object? status = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? subtotalMinor = null,
    Object? deliveryFeeMinor = null,
    Object? totalAmountMinor = null,
    Object? currency = null,
    Object? buyerName = null,
    Object? buyerPhone = freezed,
    Object? deliveryAddress = null,
    Object? deliveryNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? items = freezed,
    Object? deliveryInfo = freezed,
  }) {
    return _then(
      _$OrderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        buyerId: null == buyerId
            ? _value.buyerId
            : buyerId // ignore: cast_nullable_to_non_nullable
                  as String,
        sellerFarmId: null == sellerFarmId
            ? _value.sellerFarmId
            : sellerFarmId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MarketplaceOrderStatus,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as PaymentStatus,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as PaymentMethod,
        subtotalMinor: null == subtotalMinor
            ? _value.subtotalMinor
            : subtotalMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        deliveryFeeMinor: null == deliveryFeeMinor
            ? _value.deliveryFeeMinor
            : deliveryFeeMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        totalAmountMinor: null == totalAmountMinor
            ? _value.totalAmountMinor
            : totalAmountMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        buyerName: null == buyerName
            ? _value.buyerName
            : buyerName // ignore: cast_nullable_to_non_nullable
                  as String,
        buyerPhone: freezed == buyerPhone
            ? _value.buyerPhone
            : buyerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryAddress: null == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryNotes: freezed == deliveryNotes
            ? _value.deliveryNotes
            : deliveryNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        items: freezed == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemModel>?,
        deliveryInfo: freezed == deliveryInfo
            ? _value._deliveryInfo
            : deliveryInfo // ignore: cast_nullable_to_non_nullable
                  as List<DeliveryInfoModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl({
    required this.id,
    @JsonKey(name: 'order_number') required this.orderNumber,
    @JsonKey(name: 'buyer_id') required this.buyerId,
    @JsonKey(name: 'seller_farm_id') required this.sellerFarmId,
    required this.status,
    @JsonKey(name: 'payment_status') required this.paymentStatus,
    @JsonKey(name: 'payment_method') required this.paymentMethod,
    @JsonKey(name: 'subtotal_minor') required this.subtotalMinor,
    @JsonKey(name: 'delivery_fee_minor') this.deliveryFeeMinor = 0,
    @JsonKey(name: 'total_amount_minor') required this.totalAmountMinor,
    this.currency = 'ETB',
    @JsonKey(name: 'buyer_name') required this.buyerName,
    @JsonKey(name: 'buyer_phone') this.buyerPhone,
    @JsonKey(name: 'delivery_address') required this.deliveryAddress,
    @JsonKey(name: 'delivery_notes') this.deliveryNotes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'order_items') final List<OrderItemModel>? items,
    @JsonKey(name: 'delivery_info') final List<DeliveryInfoModel>? deliveryInfo,
  }) : _items = items,
       _deliveryInfo = deliveryInfo;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_number')
  final String orderNumber;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey(name: 'seller_farm_id')
  final String sellerFarmId;
  @override
  final MarketplaceOrderStatus status;
  @override
  @JsonKey(name: 'payment_status')
  final PaymentStatus paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  final PaymentMethod paymentMethod;
  @override
  @JsonKey(name: 'subtotal_minor')
  final int subtotalMinor;
  @override
  @JsonKey(name: 'delivery_fee_minor')
  final int deliveryFeeMinor;
  @override
  @JsonKey(name: 'total_amount_minor')
  final int totalAmountMinor;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'buyer_name')
  final String buyerName;
  @override
  @JsonKey(name: 'buyer_phone')
  final String? buyerPhone;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey(name: 'delivery_notes')
  final String? deliveryNotes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  // Joined
  final List<OrderItemModel>? _items;
  // Joined
  @override
  @JsonKey(name: 'order_items')
  List<OrderItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<DeliveryInfoModel>? _deliveryInfo;
  @override
  @JsonKey(name: 'delivery_info')
  List<DeliveryInfoModel>? get deliveryInfo {
    final value = _deliveryInfo;
    if (value == null) return null;
    if (_deliveryInfo is EqualUnmodifiableListView) return _deliveryInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, orderNumber: $orderNumber, buyerId: $buyerId, sellerFarmId: $sellerFarmId, status: $status, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, subtotalMinor: $subtotalMinor, deliveryFeeMinor: $deliveryFeeMinor, totalAmountMinor: $totalAmountMinor, currency: $currency, buyerName: $buyerName, buyerPhone: $buyerPhone, deliveryAddress: $deliveryAddress, deliveryNotes: $deliveryNotes, createdAt: $createdAt, updatedAt: $updatedAt, items: $items, deliveryInfo: $deliveryInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.sellerFarmId, sellerFarmId) ||
                other.sellerFarmId == sellerFarmId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.subtotalMinor, subtotalMinor) ||
                other.subtotalMinor == subtotalMinor) &&
            (identical(other.deliveryFeeMinor, deliveryFeeMinor) ||
                other.deliveryFeeMinor == deliveryFeeMinor) &&
            (identical(other.totalAmountMinor, totalAmountMinor) ||
                other.totalAmountMinor == totalAmountMinor) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.buyerPhone, buyerPhone) ||
                other.buyerPhone == buyerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryNotes, deliveryNotes) ||
                other.deliveryNotes == deliveryNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._deliveryInfo,
              _deliveryInfo,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    orderNumber,
    buyerId,
    sellerFarmId,
    status,
    paymentStatus,
    paymentMethod,
    subtotalMinor,
    deliveryFeeMinor,
    totalAmountMinor,
    currency,
    buyerName,
    buyerPhone,
    deliveryAddress,
    deliveryNotes,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_deliveryInfo),
  ]);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(this);
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel({
    required final String id,
    @JsonKey(name: 'order_number') required final String orderNumber,
    @JsonKey(name: 'buyer_id') required final String buyerId,
    @JsonKey(name: 'seller_farm_id') required final String sellerFarmId,
    required final MarketplaceOrderStatus status,
    @JsonKey(name: 'payment_status') required final PaymentStatus paymentStatus,
    @JsonKey(name: 'payment_method') required final PaymentMethod paymentMethod,
    @JsonKey(name: 'subtotal_minor') required final int subtotalMinor,
    @JsonKey(name: 'delivery_fee_minor') final int deliveryFeeMinor,
    @JsonKey(name: 'total_amount_minor') required final int totalAmountMinor,
    final String currency,
    @JsonKey(name: 'buyer_name') required final String buyerName,
    @JsonKey(name: 'buyer_phone') final String? buyerPhone,
    @JsonKey(name: 'delivery_address') required final String deliveryAddress,
    @JsonKey(name: 'delivery_notes') final String? deliveryNotes,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'order_items') final List<OrderItemModel>? items,
    @JsonKey(name: 'delivery_info') final List<DeliveryInfoModel>? deliveryInfo,
  }) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_number')
  String get orderNumber;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  @JsonKey(name: 'seller_farm_id')
  String get sellerFarmId;
  @override
  MarketplaceOrderStatus get status;
  @override
  @JsonKey(name: 'payment_status')
  PaymentStatus get paymentStatus;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(name: 'subtotal_minor')
  int get subtotalMinor;
  @override
  @JsonKey(name: 'delivery_fee_minor')
  int get deliveryFeeMinor;
  @override
  @JsonKey(name: 'total_amount_minor')
  int get totalAmountMinor;
  @override
  String get currency;
  @override
  @JsonKey(name: 'buyer_name')
  String get buyerName;
  @override
  @JsonKey(name: 'buyer_phone')
  String? get buyerPhone;
  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  @JsonKey(name: 'delivery_notes')
  String? get deliveryNotes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt; // Joined
  @override
  @JsonKey(name: 'order_items')
  List<OrderItemModel>? get items;
  @override
  @JsonKey(name: 'delivery_info')
  List<DeliveryInfoModel>? get deliveryInfo;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_id')
  String? get listingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_id')
  String? get batchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category')
  ProductCategory get productCategory => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_total_minor')
  int get lineTotalMinor => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
    OrderItemModel value,
    $Res Function(OrderItemModel) then,
  ) = _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    @JsonKey(name: 'listing_id') String? listingId,
    @JsonKey(name: 'batch_id') String? batchId,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(name: 'product_category') ProductCategory productCategory,
    String unit,
    double quantity,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    @JsonKey(name: 'line_total_minor') int lineTotalMinor,
    String currency,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? listingId = freezed,
    Object? batchId = freezed,
    Object? productName = null,
    Object? productCategory = null,
    Object? unit = null,
    Object? quantity = null,
    Object? unitPriceMinor = null,
    Object? lineTotalMinor = null,
    Object? currency = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
            listingId: freezed == listingId
                ? _value.listingId
                : listingId // ignore: cast_nullable_to_non_nullable
                      as String?,
            batchId: freezed == batchId
                ? _value.batchId
                : batchId // ignore: cast_nullable_to_non_nullable
                      as String?,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            productCategory: null == productCategory
                ? _value.productCategory
                : productCategory // ignore: cast_nullable_to_non_nullable
                      as ProductCategory,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            unitPriceMinor: null == unitPriceMinor
                ? _value.unitPriceMinor
                : unitPriceMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            lineTotalMinor: null == lineTotalMinor
                ? _value.lineTotalMinor
                : lineTotalMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(
    _$OrderItemModelImpl value,
    $Res Function(_$OrderItemModelImpl) then,
  ) = __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    @JsonKey(name: 'listing_id') String? listingId,
    @JsonKey(name: 'batch_id') String? batchId,
    @JsonKey(name: 'product_name') String productName,
    @JsonKey(name: 'product_category') ProductCategory productCategory,
    String unit,
    double quantity,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    @JsonKey(name: 'line_total_minor') int lineTotalMinor,
    String currency,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
    _$OrderItemModelImpl _value,
    $Res Function(_$OrderItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? listingId = freezed,
    Object? batchId = freezed,
    Object? productName = null,
    Object? productCategory = null,
    Object? unit = null,
    Object? quantity = null,
    Object? unitPriceMinor = null,
    Object? lineTotalMinor = null,
    Object? currency = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$OrderItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
        listingId: freezed == listingId
            ? _value.listingId
            : listingId // ignore: cast_nullable_to_non_nullable
                  as String?,
        batchId: freezed == batchId
            ? _value.batchId
            : batchId // ignore: cast_nullable_to_non_nullable
                  as String?,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        productCategory: null == productCategory
            ? _value.productCategory
            : productCategory // ignore: cast_nullable_to_non_nullable
                  as ProductCategory,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        unitPriceMinor: null == unitPriceMinor
            ? _value.unitPriceMinor
            : unitPriceMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        lineTotalMinor: null == lineTotalMinor
            ? _value.lineTotalMinor
            : lineTotalMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl({
    required this.id,
    @JsonKey(name: 'order_id') required this.orderId,
    @JsonKey(name: 'listing_id') this.listingId,
    @JsonKey(name: 'batch_id') this.batchId,
    @JsonKey(name: 'product_name') required this.productName,
    @JsonKey(name: 'product_category') required this.productCategory,
    required this.unit,
    required this.quantity,
    @JsonKey(name: 'unit_price_minor') required this.unitPriceMinor,
    @JsonKey(name: 'line_total_minor') required this.lineTotalMinor,
    this.currency = 'ETB',
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'listing_id')
  final String? listingId;
  @override
  @JsonKey(name: 'batch_id')
  final String? batchId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_category')
  final ProductCategory productCategory;
  @override
  final String unit;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'unit_price_minor')
  final int unitPriceMinor;
  @override
  @JsonKey(name: 'line_total_minor')
  final int lineTotalMinor;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, orderId: $orderId, listingId: $listingId, batchId: $batchId, productName: $productName, productCategory: $productCategory, unit: $unit, quantity: $quantity, unitPriceMinor: $unitPriceMinor, lineTotalMinor: $lineTotalMinor, currency: $currency, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPriceMinor, unitPriceMinor) ||
                other.unitPriceMinor == unitPriceMinor) &&
            (identical(other.lineTotalMinor, lineTotalMinor) ||
                other.lineTotalMinor == lineTotalMinor) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderId,
    listingId,
    batchId,
    productName,
    productCategory,
    unit,
    quantity,
    unitPriceMinor,
    lineTotalMinor,
    currency,
    createdAt,
  );

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(this);
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel({
    required final String id,
    @JsonKey(name: 'order_id') required final String orderId,
    @JsonKey(name: 'listing_id') final String? listingId,
    @JsonKey(name: 'batch_id') final String? batchId,
    @JsonKey(name: 'product_name') required final String productName,
    @JsonKey(name: 'product_category')
    required final ProductCategory productCategory,
    required final String unit,
    required final double quantity,
    @JsonKey(name: 'unit_price_minor') required final int unitPriceMinor,
    @JsonKey(name: 'line_total_minor') required final int lineTotalMinor,
    final String currency,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'listing_id')
  String? get listingId;
  @override
  @JsonKey(name: 'batch_id')
  String? get batchId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_category')
  ProductCategory get productCategory;
  @override
  String get unit;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor;
  @override
  @JsonKey(name: 'line_total_minor')
  int get lineTotalMinor;
  @override
  String get currency;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryInfoModel _$DeliveryInfoModelFromJson(Map<String, dynamic> json) {
  return _DeliveryInfoModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryInfoModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  DeliveryTrackingStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_driver_name')
  String? get assignedDriverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_driver_phone')
  String? get assignedDriverPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_up_at')
  DateTime? get pickedUpAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_delivery_at')
  DateTime? get estimatedDeliveryAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_notes')
  String? get deliveryNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DeliveryInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryInfoModelCopyWith<DeliveryInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryInfoModelCopyWith<$Res> {
  factory $DeliveryInfoModelCopyWith(
    DeliveryInfoModel value,
    $Res Function(DeliveryInfoModel) then,
  ) = _$DeliveryInfoModelCopyWithImpl<$Res, DeliveryInfoModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    DeliveryTrackingStatus status,
    @JsonKey(name: 'assigned_driver_name') String? assignedDriverName,
    @JsonKey(name: 'assigned_driver_phone') String? assignedDriverPhone,
    @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @JsonKey(name: 'estimated_delivery_at') DateTime? estimatedDeliveryAt,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$DeliveryInfoModelCopyWithImpl<$Res, $Val extends DeliveryInfoModel>
    implements $DeliveryInfoModelCopyWith<$Res> {
  _$DeliveryInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? status = null,
    Object? assignedDriverName = freezed,
    Object? assignedDriverPhone = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? estimatedDeliveryAt = freezed,
    Object? deliveryNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DeliveryTrackingStatus,
            assignedDriverName: freezed == assignedDriverName
                ? _value.assignedDriverName
                : assignedDriverName // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedDriverPhone: freezed == assignedDriverPhone
                ? _value.assignedDriverPhone
                : assignedDriverPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            pickedUpAt: freezed == pickedUpAt
                ? _value.pickedUpAt
                : pickedUpAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveredAt: freezed == deliveredAt
                ? _value.deliveredAt
                : deliveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            estimatedDeliveryAt: freezed == estimatedDeliveryAt
                ? _value.estimatedDeliveryAt
                : estimatedDeliveryAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveryNotes: freezed == deliveryNotes
                ? _value.deliveryNotes
                : deliveryNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeliveryInfoModelImplCopyWith<$Res>
    implements $DeliveryInfoModelCopyWith<$Res> {
  factory _$$DeliveryInfoModelImplCopyWith(
    _$DeliveryInfoModelImpl value,
    $Res Function(_$DeliveryInfoModelImpl) then,
  ) = __$$DeliveryInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'order_id') String orderId,
    DeliveryTrackingStatus status,
    @JsonKey(name: 'assigned_driver_name') String? assignedDriverName,
    @JsonKey(name: 'assigned_driver_phone') String? assignedDriverPhone,
    @JsonKey(name: 'picked_up_at') DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') DateTime? deliveredAt,
    @JsonKey(name: 'estimated_delivery_at') DateTime? estimatedDeliveryAt,
    @JsonKey(name: 'delivery_notes') String? deliveryNotes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$DeliveryInfoModelImplCopyWithImpl<$Res>
    extends _$DeliveryInfoModelCopyWithImpl<$Res, _$DeliveryInfoModelImpl>
    implements _$$DeliveryInfoModelImplCopyWith<$Res> {
  __$$DeliveryInfoModelImplCopyWithImpl(
    _$DeliveryInfoModelImpl _value,
    $Res Function(_$DeliveryInfoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderId = null,
    Object? status = null,
    Object? assignedDriverName = freezed,
    Object? assignedDriverPhone = freezed,
    Object? pickedUpAt = freezed,
    Object? deliveredAt = freezed,
    Object? estimatedDeliveryAt = freezed,
    Object? deliveryNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$DeliveryInfoModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DeliveryTrackingStatus,
        assignedDriverName: freezed == assignedDriverName
            ? _value.assignedDriverName
            : assignedDriverName // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedDriverPhone: freezed == assignedDriverPhone
            ? _value.assignedDriverPhone
            : assignedDriverPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickedUpAt: freezed == pickedUpAt
            ? _value.pickedUpAt
            : pickedUpAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveredAt: freezed == deliveredAt
            ? _value.deliveredAt
            : deliveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        estimatedDeliveryAt: freezed == estimatedDeliveryAt
            ? _value.estimatedDeliveryAt
            : estimatedDeliveryAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveryNotes: freezed == deliveryNotes
            ? _value.deliveryNotes
            : deliveryNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryInfoModelImpl implements _DeliveryInfoModel {
  const _$DeliveryInfoModelImpl({
    required this.id,
    @JsonKey(name: 'order_id') required this.orderId,
    required this.status,
    @JsonKey(name: 'assigned_driver_name') this.assignedDriverName,
    @JsonKey(name: 'assigned_driver_phone') this.assignedDriverPhone,
    @JsonKey(name: 'picked_up_at') this.pickedUpAt,
    @JsonKey(name: 'delivered_at') this.deliveredAt,
    @JsonKey(name: 'estimated_delivery_at') this.estimatedDeliveryAt,
    @JsonKey(name: 'delivery_notes') this.deliveryNotes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$DeliveryInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryInfoModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  final DeliveryTrackingStatus status;
  @override
  @JsonKey(name: 'assigned_driver_name')
  final String? assignedDriverName;
  @override
  @JsonKey(name: 'assigned_driver_phone')
  final String? assignedDriverPhone;
  @override
  @JsonKey(name: 'picked_up_at')
  final DateTime? pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  final DateTime? deliveredAt;
  @override
  @JsonKey(name: 'estimated_delivery_at')
  final DateTime? estimatedDeliveryAt;
  @override
  @JsonKey(name: 'delivery_notes')
  final String? deliveryNotes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DeliveryInfoModel(id: $id, orderId: $orderId, status: $status, assignedDriverName: $assignedDriverName, assignedDriverPhone: $assignedDriverPhone, pickedUpAt: $pickedUpAt, deliveredAt: $deliveredAt, estimatedDeliveryAt: $estimatedDeliveryAt, deliveryNotes: $deliveryNotes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedDriverName, assignedDriverName) ||
                other.assignedDriverName == assignedDriverName) &&
            (identical(other.assignedDriverPhone, assignedDriverPhone) ||
                other.assignedDriverPhone == assignedDriverPhone) &&
            (identical(other.pickedUpAt, pickedUpAt) ||
                other.pickedUpAt == pickedUpAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.estimatedDeliveryAt, estimatedDeliveryAt) ||
                other.estimatedDeliveryAt == estimatedDeliveryAt) &&
            (identical(other.deliveryNotes, deliveryNotes) ||
                other.deliveryNotes == deliveryNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderId,
    status,
    assignedDriverName,
    assignedDriverPhone,
    pickedUpAt,
    deliveredAt,
    estimatedDeliveryAt,
    deliveryNotes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DeliveryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryInfoModelImplCopyWith<_$DeliveryInfoModelImpl> get copyWith =>
      __$$DeliveryInfoModelImplCopyWithImpl<_$DeliveryInfoModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryInfoModelImplToJson(this);
  }
}

abstract class _DeliveryInfoModel implements DeliveryInfoModel {
  const factory _DeliveryInfoModel({
    required final String id,
    @JsonKey(name: 'order_id') required final String orderId,
    required final DeliveryTrackingStatus status,
    @JsonKey(name: 'assigned_driver_name') final String? assignedDriverName,
    @JsonKey(name: 'assigned_driver_phone') final String? assignedDriverPhone,
    @JsonKey(name: 'picked_up_at') final DateTime? pickedUpAt,
    @JsonKey(name: 'delivered_at') final DateTime? deliveredAt,
    @JsonKey(name: 'estimated_delivery_at') final DateTime? estimatedDeliveryAt,
    @JsonKey(name: 'delivery_notes') final String? deliveryNotes,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$DeliveryInfoModelImpl;

  factory _DeliveryInfoModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryInfoModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  DeliveryTrackingStatus get status;
  @override
  @JsonKey(name: 'assigned_driver_name')
  String? get assignedDriverName;
  @override
  @JsonKey(name: 'assigned_driver_phone')
  String? get assignedDriverPhone;
  @override
  @JsonKey(name: 'picked_up_at')
  DateTime? get pickedUpAt;
  @override
  @JsonKey(name: 'delivered_at')
  DateTime? get deliveredAt;
  @override
  @JsonKey(name: 'estimated_delivery_at')
  DateTime? get estimatedDeliveryAt;
  @override
  @JsonKey(name: 'delivery_notes')
  String? get deliveryNotes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of DeliveryInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryInfoModelImplCopyWith<_$DeliveryInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
