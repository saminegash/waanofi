// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SellerListingModel _$SellerListingModelFromJson(Map<String, dynamic> json) {
  return _SellerListingModel.fromJson(json);
}

/// @nodoc
mixin _$SellerListingModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_title')
  String get publicTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_description')
  String? get publicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_unit')
  String get sellingUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_conversion')
  int get unitConversion => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_in_minor_units')
  int get priceInMinorUnits => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_order_quantity')
  int get minimumOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum_order_quantity')
  int? get maximumOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'available_days')
  List<String> get availableDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_time')
  String get preparationTime => throw _privateConstructorUsedError;
  SellerListingStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_status')
  String get approvalStatus => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'published_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError; // Optional joined fields for presentation
  @JsonKey(name: 'approximate_available_quantity')
  double get approximateAvailableQuantity => throw _privateConstructorUsedError;

  /// Serializes this SellerListingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerListingModelCopyWith<SellerListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerListingModelCopyWith<$Res> {
  factory $SellerListingModelCopyWith(
    SellerListingModel value,
    $Res Function(SellerListingModel) then,
  ) = _$SellerListingModelCopyWithImpl<$Res, SellerListingModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'public_title') String publicTitle,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'selling_unit') String sellingUnit,
    @JsonKey(name: 'unit_conversion') int unitConversion,
    @JsonKey(name: 'price_in_minor_units') int priceInMinorUnits,
    String currency,
    @JsonKey(name: 'minimum_order_quantity') int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') List<String> availableDays,
    @JsonKey(name: 'preparation_time') String preparationTime,
    SellerListingStatus status,
    @JsonKey(name: 'approval_status') String approvalStatus,
    @JsonKey(
      name: 'published_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? publishedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
    @JsonKey(name: 'approximate_available_quantity')
    double approximateAvailableQuantity,
  });
}

/// @nodoc
class _$SellerListingModelCopyWithImpl<$Res, $Val extends SellerListingModel>
    implements $SellerListingModelCopyWith<$Res> {
  _$SellerListingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? productId = freezed,
    Object? publicTitle = null,
    Object? publicDescription = freezed,
    Object? sellingUnit = null,
    Object? unitConversion = null,
    Object? priceInMinorUnits = null,
    Object? currency = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = freezed,
    Object? availableFulfilmentMethods = null,
    Object? availableDays = null,
    Object? preparationTime = null,
    Object? status = null,
    Object? approvalStatus = null,
    Object? publishedAt = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? approximateAvailableQuantity = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            farmId: null == farmId
                ? _value.farmId
                : farmId // ignore: cast_nullable_to_non_nullable
                      as String,
            productId: freezed == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String?,
            publicTitle: null == publicTitle
                ? _value.publicTitle
                : publicTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            publicDescription: freezed == publicDescription
                ? _value.publicDescription
                : publicDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            sellingUnit: null == sellingUnit
                ? _value.sellingUnit
                : sellingUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            unitConversion: null == unitConversion
                ? _value.unitConversion
                : unitConversion // ignore: cast_nullable_to_non_nullable
                      as int,
            priceInMinorUnits: null == priceInMinorUnits
                ? _value.priceInMinorUnits
                : priceInMinorUnits // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            minimumOrderQuantity: null == minimumOrderQuantity
                ? _value.minimumOrderQuantity
                : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            maximumOrderQuantity: freezed == maximumOrderQuantity
                ? _value.maximumOrderQuantity
                : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            availableFulfilmentMethods: null == availableFulfilmentMethods
                ? _value.availableFulfilmentMethods
                : availableFulfilmentMethods // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            availableDays: null == availableDays
                ? _value.availableDays
                : availableDays // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preparationTime: null == preparationTime
                ? _value.preparationTime
                : preparationTime // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SellerListingStatus,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            publishedAt: freezed == publishedAt
                ? _value.publishedAt
                : publishedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            approximateAvailableQuantity: null == approximateAvailableQuantity
                ? _value.approximateAvailableQuantity
                : approximateAvailableQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerListingModelImplCopyWith<$Res>
    implements $SellerListingModelCopyWith<$Res> {
  factory _$$SellerListingModelImplCopyWith(
    _$SellerListingModelImpl value,
    $Res Function(_$SellerListingModelImpl) then,
  ) = __$$SellerListingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'public_title') String publicTitle,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'selling_unit') String sellingUnit,
    @JsonKey(name: 'unit_conversion') int unitConversion,
    @JsonKey(name: 'price_in_minor_units') int priceInMinorUnits,
    String currency,
    @JsonKey(name: 'minimum_order_quantity') int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') List<String> availableDays,
    @JsonKey(name: 'preparation_time') String preparationTime,
    SellerListingStatus status,
    @JsonKey(name: 'approval_status') String approvalStatus,
    @JsonKey(
      name: 'published_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? publishedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
    @JsonKey(name: 'approximate_available_quantity')
    double approximateAvailableQuantity,
  });
}

/// @nodoc
class __$$SellerListingModelImplCopyWithImpl<$Res>
    extends _$SellerListingModelCopyWithImpl<$Res, _$SellerListingModelImpl>
    implements _$$SellerListingModelImplCopyWith<$Res> {
  __$$SellerListingModelImplCopyWithImpl(
    _$SellerListingModelImpl _value,
    $Res Function(_$SellerListingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? productId = freezed,
    Object? publicTitle = null,
    Object? publicDescription = freezed,
    Object? sellingUnit = null,
    Object? unitConversion = null,
    Object? priceInMinorUnits = null,
    Object? currency = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = freezed,
    Object? availableFulfilmentMethods = null,
    Object? availableDays = null,
    Object? preparationTime = null,
    Object? status = null,
    Object? approvalStatus = null,
    Object? publishedAt = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? approximateAvailableQuantity = null,
  }) {
    return _then(
      _$SellerListingModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: freezed == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String?,
        publicTitle: null == publicTitle
            ? _value.publicTitle
            : publicTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        publicDescription: freezed == publicDescription
            ? _value.publicDescription
            : publicDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        sellingUnit: null == sellingUnit
            ? _value.sellingUnit
            : sellingUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        unitConversion: null == unitConversion
            ? _value.unitConversion
            : unitConversion // ignore: cast_nullable_to_non_nullable
                  as int,
        priceInMinorUnits: null == priceInMinorUnits
            ? _value.priceInMinorUnits
            : priceInMinorUnits // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        minimumOrderQuantity: null == minimumOrderQuantity
            ? _value.minimumOrderQuantity
            : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        maximumOrderQuantity: freezed == maximumOrderQuantity
            ? _value.maximumOrderQuantity
            : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        availableFulfilmentMethods: null == availableFulfilmentMethods
            ? _value._availableFulfilmentMethods
            : availableFulfilmentMethods // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        availableDays: null == availableDays
            ? _value._availableDays
            : availableDays // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preparationTime: null == preparationTime
            ? _value.preparationTime
            : preparationTime // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SellerListingStatus,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        publishedAt: freezed == publishedAt
            ? _value.publishedAt
            : publishedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        approximateAvailableQuantity: null == approximateAvailableQuantity
            ? _value.approximateAvailableQuantity
            : approximateAvailableQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerListingModelImpl implements _SellerListingModel {
  const _$SellerListingModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'product_id') this.productId,
    @JsonKey(name: 'public_title') required this.publicTitle,
    @JsonKey(name: 'public_description') this.publicDescription,
    @JsonKey(name: 'selling_unit') required this.sellingUnit,
    @JsonKey(name: 'unit_conversion') this.unitConversion = 1,
    @JsonKey(name: 'price_in_minor_units') required this.priceInMinorUnits,
    this.currency = 'ETB',
    @JsonKey(name: 'minimum_order_quantity') this.minimumOrderQuantity = 1,
    @JsonKey(name: 'maximum_order_quantity') this.maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    final List<String> availableFulfilmentMethods = const ['pickup'],
    @JsonKey(name: 'available_days')
    final List<String> availableDays = const [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ],
    @JsonKey(name: 'preparation_time') this.preparationTime = '2 hours',
    this.status = SellerListingStatus.draft,
    @JsonKey(name: 'approval_status') this.approvalStatus = 'pending',
    @JsonKey(
      name: 'published_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    this.publishedAt,
    @JsonKey(name: 'created_by') this.createdBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
    @JsonKey(name: 'approximate_available_quantity')
    this.approximateAvailableQuantity = 0.0,
  }) : _availableFulfilmentMethods = availableFulfilmentMethods,
       _availableDays = availableDays;

  factory _$SellerListingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerListingModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  @JsonKey(name: 'public_title')
  final String publicTitle;
  @override
  @JsonKey(name: 'public_description')
  final String? publicDescription;
  @override
  @JsonKey(name: 'selling_unit')
  final String sellingUnit;
  @override
  @JsonKey(name: 'unit_conversion')
  final int unitConversion;
  @override
  @JsonKey(name: 'price_in_minor_units')
  final int priceInMinorUnits;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'minimum_order_quantity')
  final int minimumOrderQuantity;
  @override
  @JsonKey(name: 'maximum_order_quantity')
  final int? maximumOrderQuantity;
  final List<String> _availableFulfilmentMethods;
  @override
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods {
    if (_availableFulfilmentMethods is EqualUnmodifiableListView)
      return _availableFulfilmentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableFulfilmentMethods);
  }

  final List<String> _availableDays;
  @override
  @JsonKey(name: 'available_days')
  List<String> get availableDays {
    if (_availableDays is EqualUnmodifiableListView) return _availableDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDays);
  }

  @override
  @JsonKey(name: 'preparation_time')
  final String preparationTime;
  @override
  @JsonKey()
  final SellerListingStatus status;
  @override
  @JsonKey(name: 'approval_status')
  final String approvalStatus;
  @override
  @JsonKey(
    name: 'published_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  final DateTime? publishedAt;
  @override
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;
  // Optional joined fields for presentation
  @override
  @JsonKey(name: 'approximate_available_quantity')
  final double approximateAvailableQuantity;

  @override
  String toString() {
    return 'SellerListingModel(id: $id, farmId: $farmId, productId: $productId, publicTitle: $publicTitle, publicDescription: $publicDescription, sellingUnit: $sellingUnit, unitConversion: $unitConversion, priceInMinorUnits: $priceInMinorUnits, currency: $currency, minimumOrderQuantity: $minimumOrderQuantity, maximumOrderQuantity: $maximumOrderQuantity, availableFulfilmentMethods: $availableFulfilmentMethods, availableDays: $availableDays, preparationTime: $preparationTime, status: $status, approvalStatus: $approvalStatus, publishedAt: $publishedAt, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, approximateAvailableQuantity: $approximateAvailableQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerListingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.publicTitle, publicTitle) ||
                other.publicTitle == publicTitle) &&
            (identical(other.publicDescription, publicDescription) ||
                other.publicDescription == publicDescription) &&
            (identical(other.sellingUnit, sellingUnit) ||
                other.sellingUnit == sellingUnit) &&
            (identical(other.unitConversion, unitConversion) ||
                other.unitConversion == unitConversion) &&
            (identical(other.priceInMinorUnits, priceInMinorUnits) ||
                other.priceInMinorUnits == priceInMinorUnits) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minimumOrderQuantity, minimumOrderQuantity) ||
                other.minimumOrderQuantity == minimumOrderQuantity) &&
            (identical(other.maximumOrderQuantity, maximumOrderQuantity) ||
                other.maximumOrderQuantity == maximumOrderQuantity) &&
            const DeepCollectionEquality().equals(
              other._availableFulfilmentMethods,
              _availableFulfilmentMethods,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableDays,
              _availableDays,
            ) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(
                  other.approximateAvailableQuantity,
                  approximateAvailableQuantity,
                ) ||
                other.approximateAvailableQuantity ==
                    approximateAvailableQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    farmId,
    productId,
    publicTitle,
    publicDescription,
    sellingUnit,
    unitConversion,
    priceInMinorUnits,
    currency,
    minimumOrderQuantity,
    maximumOrderQuantity,
    const DeepCollectionEquality().hash(_availableFulfilmentMethods),
    const DeepCollectionEquality().hash(_availableDays),
    preparationTime,
    status,
    approvalStatus,
    publishedAt,
    createdBy,
    createdAt,
    updatedAt,
    approximateAvailableQuantity,
  ]);

  /// Create a copy of SellerListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerListingModelImplCopyWith<_$SellerListingModelImpl> get copyWith =>
      __$$SellerListingModelImplCopyWithImpl<_$SellerListingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerListingModelImplToJson(this);
  }
}

abstract class _SellerListingModel implements SellerListingModel {
  const factory _SellerListingModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'product_id') final String? productId,
    @JsonKey(name: 'public_title') required final String publicTitle,
    @JsonKey(name: 'public_description') final String? publicDescription,
    @JsonKey(name: 'selling_unit') required final String sellingUnit,
    @JsonKey(name: 'unit_conversion') final int unitConversion,
    @JsonKey(name: 'price_in_minor_units') required final int priceInMinorUnits,
    final String currency,
    @JsonKey(name: 'minimum_order_quantity') final int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') final int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    final List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') final List<String> availableDays,
    @JsonKey(name: 'preparation_time') final String preparationTime,
    final SellerListingStatus status,
    @JsonKey(name: 'approval_status') final String approvalStatus,
    @JsonKey(
      name: 'published_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    final DateTime? publishedAt,
    @JsonKey(name: 'created_by') final String? createdBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
    @JsonKey(name: 'approximate_available_quantity')
    final double approximateAvailableQuantity,
  }) = _$SellerListingModelImpl;

  factory _SellerListingModel.fromJson(Map<String, dynamic> json) =
      _$SellerListingModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  @JsonKey(name: 'public_title')
  String get publicTitle;
  @override
  @JsonKey(name: 'public_description')
  String? get publicDescription;
  @override
  @JsonKey(name: 'selling_unit')
  String get sellingUnit;
  @override
  @JsonKey(name: 'unit_conversion')
  int get unitConversion;
  @override
  @JsonKey(name: 'price_in_minor_units')
  int get priceInMinorUnits;
  @override
  String get currency;
  @override
  @JsonKey(name: 'minimum_order_quantity')
  int get minimumOrderQuantity;
  @override
  @JsonKey(name: 'maximum_order_quantity')
  int? get maximumOrderQuantity;
  @override
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods;
  @override
  @JsonKey(name: 'available_days')
  List<String> get availableDays;
  @override
  @JsonKey(name: 'preparation_time')
  String get preparationTime;
  @override
  SellerListingStatus get status;
  @override
  @JsonKey(name: 'approval_status')
  String get approvalStatus;
  @override
  @JsonKey(
    name: 'published_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get publishedAt;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt; // Optional joined fields for presentation
  @override
  @JsonKey(name: 'approximate_available_quantity')
  double get approximateAvailableQuantity;

  /// Create a copy of SellerListingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerListingModelImplCopyWith<_$SellerListingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
