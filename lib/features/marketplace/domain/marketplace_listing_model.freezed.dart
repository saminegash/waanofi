// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarketplaceListingModel _$MarketplaceListingModelFromJson(
  Map<String, dynamic> json,
) {
  return _MarketplaceListingModel.fromJson(json);
}

/// @nodoc
mixin _$MarketplaceListingModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_id')
  String get batchId => throw _privateConstructorUsedError;
  ProductCategory get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_available')
  double get quantityAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError; // Joined fields (optional, from queries)
  @JsonKey(name: 'farms')
  Map<String, dynamic>? get farm => throw _privateConstructorUsedError;

  /// Serializes this MarketplaceListingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketplaceListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketplaceListingModelCopyWith<MarketplaceListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceListingModelCopyWith<$Res> {
  factory $MarketplaceListingModelCopyWith(
    MarketplaceListingModel value,
    $Res Function(MarketplaceListingModel) then,
  ) = _$MarketplaceListingModelCopyWithImpl<$Res, MarketplaceListingModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'batch_id') String batchId,
    ProductCategory category,
    String title,
    String? description,
    String unit,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    String currency,
    @JsonKey(name: 'quantity_available') double quantityAvailable,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'farms') Map<String, dynamic>? farm,
  });
}

/// @nodoc
class _$MarketplaceListingModelCopyWithImpl<
  $Res,
  $Val extends MarketplaceListingModel
>
    implements $MarketplaceListingModelCopyWith<$Res> {
  _$MarketplaceListingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketplaceListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? batchId = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? unit = null,
    Object? unitPriceMinor = null,
    Object? currency = null,
    Object? quantityAvailable = null,
    Object? photoUrl = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? farm = freezed,
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
            batchId: null == batchId
                ? _value.batchId
                : batchId // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ProductCategory,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            unitPriceMinor: null == unitPriceMinor
                ? _value.unitPriceMinor
                : unitPriceMinor // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            quantityAvailable: null == quantityAvailable
                ? _value.quantityAvailable
                : quantityAvailable // ignore: cast_nullable_to_non_nullable
                      as double,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            farm: freezed == farm
                ? _value.farm
                : farm // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarketplaceListingModelImplCopyWith<$Res>
    implements $MarketplaceListingModelCopyWith<$Res> {
  factory _$$MarketplaceListingModelImplCopyWith(
    _$MarketplaceListingModelImpl value,
    $Res Function(_$MarketplaceListingModelImpl) then,
  ) = __$$MarketplaceListingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'batch_id') String batchId,
    ProductCategory category,
    String title,
    String? description,
    String unit,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    String currency,
    @JsonKey(name: 'quantity_available') double quantityAvailable,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'farms') Map<String, dynamic>? farm,
  });
}

/// @nodoc
class __$$MarketplaceListingModelImplCopyWithImpl<$Res>
    extends
        _$MarketplaceListingModelCopyWithImpl<
          $Res,
          _$MarketplaceListingModelImpl
        >
    implements _$$MarketplaceListingModelImplCopyWith<$Res> {
  __$$MarketplaceListingModelImplCopyWithImpl(
    _$MarketplaceListingModelImpl _value,
    $Res Function(_$MarketplaceListingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketplaceListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? batchId = null,
    Object? category = null,
    Object? title = null,
    Object? description = freezed,
    Object? unit = null,
    Object? unitPriceMinor = null,
    Object? currency = null,
    Object? quantityAvailable = null,
    Object? photoUrl = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? farm = freezed,
  }) {
    return _then(
      _$MarketplaceListingModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        batchId: null == batchId
            ? _value.batchId
            : batchId // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ProductCategory,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        unitPriceMinor: null == unitPriceMinor
            ? _value.unitPriceMinor
            : unitPriceMinor // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        quantityAvailable: null == quantityAvailable
            ? _value.quantityAvailable
            : quantityAvailable // ignore: cast_nullable_to_non_nullable
                  as double,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        farm: freezed == farm
            ? _value._farm
            : farm // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketplaceListingModelImpl implements _MarketplaceListingModel {
  const _$MarketplaceListingModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'batch_id') required this.batchId,
    required this.category,
    required this.title,
    this.description,
    required this.unit,
    @JsonKey(name: 'unit_price_minor') required this.unitPriceMinor,
    this.currency = 'ETB',
    @JsonKey(name: 'quantity_available') required this.quantityAvailable,
    @JsonKey(name: 'photo_url') this.photoUrl,
    @JsonKey(name: 'is_active') this.isActive = true,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'farms') final Map<String, dynamic>? farm,
  }) : _farm = farm;

  factory _$MarketplaceListingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketplaceListingModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'batch_id')
  final String batchId;
  @override
  final ProductCategory category;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String unit;
  @override
  @JsonKey(name: 'unit_price_minor')
  final int unitPriceMinor;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'quantity_available')
  final double quantityAvailable;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  // Joined fields (optional, from queries)
  final Map<String, dynamic>? _farm;
  // Joined fields (optional, from queries)
  @override
  @JsonKey(name: 'farms')
  Map<String, dynamic>? get farm {
    final value = _farm;
    if (value == null) return null;
    if (_farm is EqualUnmodifiableMapView) return _farm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MarketplaceListingModel(id: $id, farmId: $farmId, batchId: $batchId, category: $category, title: $title, description: $description, unit: $unit, unitPriceMinor: $unitPriceMinor, currency: $currency, quantityAvailable: $quantityAvailable, photoUrl: $photoUrl, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, farm: $farm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketplaceListingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitPriceMinor, unitPriceMinor) ||
                other.unitPriceMinor == unitPriceMinor) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._farm, _farm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    farmId,
    batchId,
    category,
    title,
    description,
    unit,
    unitPriceMinor,
    currency,
    quantityAvailable,
    photoUrl,
    isActive,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_farm),
  );

  /// Create a copy of MarketplaceListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketplaceListingModelImplCopyWith<_$MarketplaceListingModelImpl>
  get copyWith =>
      __$$MarketplaceListingModelImplCopyWithImpl<
        _$MarketplaceListingModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketplaceListingModelImplToJson(this);
  }
}

abstract class _MarketplaceListingModel implements MarketplaceListingModel {
  const factory _MarketplaceListingModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'batch_id') required final String batchId,
    required final ProductCategory category,
    required final String title,
    final String? description,
    required final String unit,
    @JsonKey(name: 'unit_price_minor') required final int unitPriceMinor,
    final String currency,
    @JsonKey(name: 'quantity_available')
    required final double quantityAvailable,
    @JsonKey(name: 'photo_url') final String? photoUrl,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'farms') final Map<String, dynamic>? farm,
  }) = _$MarketplaceListingModelImpl;

  factory _MarketplaceListingModel.fromJson(Map<String, dynamic> json) =
      _$MarketplaceListingModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'batch_id')
  String get batchId;
  @override
  ProductCategory get category;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get unit;
  @override
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor;
  @override
  String get currency;
  @override
  @JsonKey(name: 'quantity_available')
  double get quantityAvailable;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt; // Joined fields (optional, from queries)
  @override
  @JsonKey(name: 'farms')
  Map<String, dynamic>? get farm;

  /// Create a copy of MarketplaceListingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketplaceListingModelImplCopyWith<_$MarketplaceListingModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
