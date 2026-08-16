// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DeliveryAddressModel _$DeliveryAddressModelFromJson(Map<String, dynamic> json) {
  return _DeliveryAddressModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddressModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  String get buyerId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient_name')
  String get recipientName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_city')
  String get subCity => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  String get landmark => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DeliveryAddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryAddressModelCopyWith<DeliveryAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressModelCopyWith<$Res> {
  factory $DeliveryAddressModelCopyWith(
    DeliveryAddressModel value,
    $Res Function(DeliveryAddressModel) then,
  ) = _$DeliveryAddressModelCopyWithImpl<$Res, DeliveryAddressModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'buyer_id') String buyerId,
    String label,
    @JsonKey(name: 'recipient_name') String recipientName,
    String phone,
    String region,
    String city,
    @JsonKey(name: 'sub_city') String subCity,
    String neighborhood,
    String landmark,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class _$DeliveryAddressModelCopyWithImpl<
  $Res,
  $Val extends DeliveryAddressModel
>
    implements $DeliveryAddressModelCopyWith<$Res> {
  _$DeliveryAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerId = null,
    Object? label = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? region = null,
    Object? city = null,
    Object? subCity = null,
    Object? neighborhood = null,
    Object? landmark = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? deliveryInstructions = freezed,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            buyerId: null == buyerId
                ? _value.buyerId
                : buyerId // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            recipientName: null == recipientName
                ? _value.recipientName
                : recipientName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            subCity: null == subCity
                ? _value.subCity
                : subCity // ignore: cast_nullable_to_non_nullable
                      as String,
            neighborhood: null == neighborhood
                ? _value.neighborhood
                : neighborhood // ignore: cast_nullable_to_non_nullable
                      as String,
            landmark: null == landmark
                ? _value.landmark
                : landmark // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            deliveryInstructions: freezed == deliveryInstructions
                ? _value.deliveryInstructions
                : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$DeliveryAddressModelImplCopyWith<$Res>
    implements $DeliveryAddressModelCopyWith<$Res> {
  factory _$$DeliveryAddressModelImplCopyWith(
    _$DeliveryAddressModelImpl value,
    $Res Function(_$DeliveryAddressModelImpl) then,
  ) = __$$DeliveryAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'buyer_id') String buyerId,
    String label,
    @JsonKey(name: 'recipient_name') String recipientName,
    String phone,
    String region,
    String city,
    @JsonKey(name: 'sub_city') String subCity,
    String neighborhood,
    String landmark,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'delivery_instructions') String? deliveryInstructions,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$DeliveryAddressModelImplCopyWithImpl<$Res>
    extends _$DeliveryAddressModelCopyWithImpl<$Res, _$DeliveryAddressModelImpl>
    implements _$$DeliveryAddressModelImplCopyWith<$Res> {
  __$$DeliveryAddressModelImplCopyWithImpl(
    _$DeliveryAddressModelImpl _value,
    $Res Function(_$DeliveryAddressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeliveryAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buyerId = null,
    Object? label = null,
    Object? recipientName = null,
    Object? phone = null,
    Object? region = null,
    Object? city = null,
    Object? subCity = null,
    Object? neighborhood = null,
    Object? landmark = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? deliveryInstructions = freezed,
    Object? isDefault = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$DeliveryAddressModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        buyerId: null == buyerId
            ? _value.buyerId
            : buyerId // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        recipientName: null == recipientName
            ? _value.recipientName
            : recipientName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        subCity: null == subCity
            ? _value.subCity
            : subCity // ignore: cast_nullable_to_non_nullable
                  as String,
        neighborhood: null == neighborhood
            ? _value.neighborhood
            : neighborhood // ignore: cast_nullable_to_non_nullable
                  as String,
        landmark: null == landmark
            ? _value.landmark
            : landmark // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        deliveryInstructions: freezed == deliveryInstructions
            ? _value.deliveryInstructions
            : deliveryInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$DeliveryAddressModelImpl implements _DeliveryAddressModel {
  const _$DeliveryAddressModelImpl({
    required this.id,
    @JsonKey(name: 'buyer_id') required this.buyerId,
    this.label = 'Primary',
    @JsonKey(name: 'recipient_name') required this.recipientName,
    required this.phone,
    required this.region,
    required this.city,
    @JsonKey(name: 'sub_city') required this.subCity,
    required this.neighborhood,
    required this.landmark,
    this.latitude,
    this.longitude,
    @JsonKey(name: 'delivery_instructions') this.deliveryInstructions,
    @JsonKey(name: 'is_default') this.isDefault = false,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
  });

  factory _$DeliveryAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey(name: 'recipient_name')
  final String recipientName;
  @override
  final String phone;
  @override
  final String region;
  @override
  final String city;
  @override
  @JsonKey(name: 'sub_city')
  final String subCity;
  @override
  final String neighborhood;
  @override
  final String landmark;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'delivery_instructions')
  final String? deliveryInstructions;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DeliveryAddressModel(id: $id, buyerId: $buyerId, label: $label, recipientName: $recipientName, phone: $phone, region: $region, city: $city, subCity: $subCity, neighborhood: $neighborhood, landmark: $landmark, latitude: $latitude, longitude: $longitude, deliveryInstructions: $deliveryInstructions, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.subCity, subCity) || other.subCity == subCity) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
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
    buyerId,
    label,
    recipientName,
    phone,
    region,
    city,
    subCity,
    neighborhood,
    landmark,
    latitude,
    longitude,
    deliveryInstructions,
    isDefault,
    createdAt,
    updatedAt,
  );

  /// Create a copy of DeliveryAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressModelImplCopyWith<_$DeliveryAddressModelImpl>
  get copyWith =>
      __$$DeliveryAddressModelImplCopyWithImpl<_$DeliveryAddressModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressModelImplToJson(this);
  }
}

abstract class _DeliveryAddressModel implements DeliveryAddressModel {
  const factory _DeliveryAddressModel({
    required final String id,
    @JsonKey(name: 'buyer_id') required final String buyerId,
    final String label,
    @JsonKey(name: 'recipient_name') required final String recipientName,
    required final String phone,
    required final String region,
    required final String city,
    @JsonKey(name: 'sub_city') required final String subCity,
    required final String neighborhood,
    required final String landmark,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'delivery_instructions') final String? deliveryInstructions,
    @JsonKey(name: 'is_default') final bool isDefault,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
  }) = _$DeliveryAddressModelImpl;

  factory _DeliveryAddressModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'buyer_id')
  String get buyerId;
  @override
  String get label;
  @override
  @JsonKey(name: 'recipient_name')
  String get recipientName;
  @override
  String get phone;
  @override
  String get region;
  @override
  String get city;
  @override
  @JsonKey(name: 'sub_city')
  String get subCity;
  @override
  String get neighborhood;
  @override
  String get landmark;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'delivery_instructions')
  String? get deliveryInstructions;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt;

  /// Create a copy of DeliveryAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryAddressModelImplCopyWith<_$DeliveryAddressModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
