// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  String? get farmId => throw _privateConstructorUsedError;
  String? get farmName => throw _privateConstructorUsedError;
  List<CartItemModel> get items => throw _privateConstructorUsedError;
  String? get selectedFulfilmentMethod =>
      throw _privateConstructorUsedError; // 'pickup' or 'delivery'
  String? get selectedDeliveryAddressId => throw _privateConstructorUsedError;
  String? get selectedTimeSlot =>
      throw _privateConstructorUsedError; // 'morning' or 'afternoon'
  String? get deliveryInstructions => throw _privateConstructorUsedError;

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call({
    String? farmId,
    String? farmName,
    List<CartItemModel> items,
    String? selectedFulfilmentMethod,
    String? selectedDeliveryAddressId,
    String? selectedTimeSlot,
    String? deliveryInstructions,
  });
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = freezed,
    Object? farmName = freezed,
    Object? items = null,
    Object? selectedFulfilmentMethod = freezed,
    Object? selectedDeliveryAddressId = freezed,
    Object? selectedTimeSlot = freezed,
    Object? deliveryInstructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            farmId: freezed == farmId
                ? _value.farmId
                : farmId // ignore: cast_nullable_to_non_nullable
                      as String?,
            farmName: freezed == farmName
                ? _value.farmName
                : farmName // ignore: cast_nullable_to_non_nullable
                      as String?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CartItemModel>,
            selectedFulfilmentMethod: freezed == selectedFulfilmentMethod
                ? _value.selectedFulfilmentMethod
                : selectedFulfilmentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedDeliveryAddressId: freezed == selectedDeliveryAddressId
                ? _value.selectedDeliveryAddressId
                : selectedDeliveryAddressId // ignore: cast_nullable_to_non_nullable
                      as String?,
            selectedTimeSlot: freezed == selectedTimeSlot
                ? _value.selectedTimeSlot
                : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryInstructions: freezed == deliveryInstructions
                ? _value.deliveryInstructions
                : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
    _$CartModelImpl value,
    $Res Function(_$CartModelImpl) then,
  ) = __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? farmId,
    String? farmName,
    List<CartItemModel> items,
    String? selectedFulfilmentMethod,
    String? selectedDeliveryAddressId,
    String? selectedTimeSlot,
    String? deliveryInstructions,
  });
}

/// @nodoc
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
    _$CartModelImpl _value,
    $Res Function(_$CartModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = freezed,
    Object? farmName = freezed,
    Object? items = null,
    Object? selectedFulfilmentMethod = freezed,
    Object? selectedDeliveryAddressId = freezed,
    Object? selectedTimeSlot = freezed,
    Object? deliveryInstructions = freezed,
  }) {
    return _then(
      _$CartModelImpl(
        farmId: freezed == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String?,
        farmName: freezed == farmName
            ? _value.farmName
            : farmName // ignore: cast_nullable_to_non_nullable
                  as String?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItemModel>,
        selectedFulfilmentMethod: freezed == selectedFulfilmentMethod
            ? _value.selectedFulfilmentMethod
            : selectedFulfilmentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedDeliveryAddressId: freezed == selectedDeliveryAddressId
            ? _value.selectedDeliveryAddressId
            : selectedDeliveryAddressId // ignore: cast_nullable_to_non_nullable
                  as String?,
        selectedTimeSlot: freezed == selectedTimeSlot
            ? _value.selectedTimeSlot
            : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryInstructions: freezed == deliveryInstructions
            ? _value.deliveryInstructions
            : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl({
    this.farmId,
    this.farmName,
    final List<CartItemModel> items = const [],
    this.selectedFulfilmentMethod,
    this.selectedDeliveryAddressId,
    this.selectedTimeSlot,
    this.deliveryInstructions,
  }) : _items = items;

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  final String? farmId;
  @override
  final String? farmName;
  final List<CartItemModel> _items;
  @override
  @JsonKey()
  List<CartItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? selectedFulfilmentMethod;
  // 'pickup' or 'delivery'
  @override
  final String? selectedDeliveryAddressId;
  @override
  final String? selectedTimeSlot;
  // 'morning' or 'afternoon'
  @override
  final String? deliveryInstructions;

  @override
  String toString() {
    return 'CartModel(farmId: $farmId, farmName: $farmName, items: $items, selectedFulfilmentMethod: $selectedFulfilmentMethod, selectedDeliveryAddressId: $selectedDeliveryAddressId, selectedTimeSlot: $selectedTimeSlot, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.farmName, farmName) ||
                other.farmName == farmName) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(
                  other.selectedFulfilmentMethod,
                  selectedFulfilmentMethod,
                ) ||
                other.selectedFulfilmentMethod == selectedFulfilmentMethod) &&
            (identical(
                  other.selectedDeliveryAddressId,
                  selectedDeliveryAddressId,
                ) ||
                other.selectedDeliveryAddressId == selectedDeliveryAddressId) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    farmId,
    farmName,
    const DeepCollectionEquality().hash(_items),
    selectedFulfilmentMethod,
    selectedDeliveryAddressId,
    selectedTimeSlot,
    deliveryInstructions,
  );

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(this);
  }
}

abstract class _CartModel implements CartModel {
  const factory _CartModel({
    final String? farmId,
    final String? farmName,
    final List<CartItemModel> items,
    final String? selectedFulfilmentMethod,
    final String? selectedDeliveryAddressId,
    final String? selectedTimeSlot,
    final String? deliveryInstructions,
  }) = _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  String? get farmId;
  @override
  String? get farmName;
  @override
  List<CartItemModel> get items;
  @override
  String? get selectedFulfilmentMethod; // 'pickup' or 'delivery'
  @override
  String? get selectedDeliveryAddressId;
  @override
  String? get selectedTimeSlot; // 'morning' or 'afternoon'
  @override
  String? get deliveryInstructions;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
