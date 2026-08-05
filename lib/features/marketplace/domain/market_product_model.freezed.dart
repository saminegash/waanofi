// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MarketProductModel _$MarketProductModelFromJson(Map<String, dynamic> json) {
  return _MarketProductModel.fromJson(json);
}

/// @nodoc
mixin _$MarketProductModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_code')
  String get productCode => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_en')
  String get nameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_am')
  String get nameAm => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_om')
  String get nameOm => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_inventory_unit')
  String get baseInventoryUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_shelf_life_guidance')
  String? get defaultShelfLifeGuidance => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_order')
  int get displayOrder => throw _privateConstructorUsedError;

  /// Serializes this MarketProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MarketProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MarketProductModelCopyWith<MarketProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketProductModelCopyWith<$Res> {
  factory $MarketProductModelCopyWith(
    MarketProductModel value,
    $Res Function(MarketProductModel) then,
  ) = _$MarketProductModelCopyWithImpl<$Res, MarketProductModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'product_code') String productCode,
    String category,
    @JsonKey(name: 'name_en') String nameEn,
    @JsonKey(name: 'name_am') String nameAm,
    @JsonKey(name: 'name_om') String nameOm,
    @JsonKey(name: 'base_inventory_unit') String baseInventoryUnit,
    @JsonKey(name: 'default_shelf_life_guidance')
    String? defaultShelfLifeGuidance,
    bool active,
    String? image,
    @JsonKey(name: 'display_order') int displayOrder,
  });
}

/// @nodoc
class _$MarketProductModelCopyWithImpl<$Res, $Val extends MarketProductModel>
    implements $MarketProductModelCopyWith<$Res> {
  _$MarketProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MarketProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productCode = null,
    Object? category = null,
    Object? nameEn = null,
    Object? nameAm = null,
    Object? nameOm = null,
    Object? baseInventoryUnit = null,
    Object? defaultShelfLifeGuidance = freezed,
    Object? active = null,
    Object? image = freezed,
    Object? displayOrder = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            productCode: null == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            nameEn: null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                      as String,
            nameAm: null == nameAm
                ? _value.nameAm
                : nameAm // ignore: cast_nullable_to_non_nullable
                      as String,
            nameOm: null == nameOm
                ? _value.nameOm
                : nameOm // ignore: cast_nullable_to_non_nullable
                      as String,
            baseInventoryUnit: null == baseInventoryUnit
                ? _value.baseInventoryUnit
                : baseInventoryUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            defaultShelfLifeGuidance: freezed == defaultShelfLifeGuidance
                ? _value.defaultShelfLifeGuidance
                : defaultShelfLifeGuidance // ignore: cast_nullable_to_non_nullable
                      as String?,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            displayOrder: null == displayOrder
                ? _value.displayOrder
                : displayOrder // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MarketProductModelImplCopyWith<$Res>
    implements $MarketProductModelCopyWith<$Res> {
  factory _$$MarketProductModelImplCopyWith(
    _$MarketProductModelImpl value,
    $Res Function(_$MarketProductModelImpl) then,
  ) = __$$MarketProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'product_code') String productCode,
    String category,
    @JsonKey(name: 'name_en') String nameEn,
    @JsonKey(name: 'name_am') String nameAm,
    @JsonKey(name: 'name_om') String nameOm,
    @JsonKey(name: 'base_inventory_unit') String baseInventoryUnit,
    @JsonKey(name: 'default_shelf_life_guidance')
    String? defaultShelfLifeGuidance,
    bool active,
    String? image,
    @JsonKey(name: 'display_order') int displayOrder,
  });
}

/// @nodoc
class __$$MarketProductModelImplCopyWithImpl<$Res>
    extends _$MarketProductModelCopyWithImpl<$Res, _$MarketProductModelImpl>
    implements _$$MarketProductModelImplCopyWith<$Res> {
  __$$MarketProductModelImplCopyWithImpl(
    _$MarketProductModelImpl _value,
    $Res Function(_$MarketProductModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MarketProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productCode = null,
    Object? category = null,
    Object? nameEn = null,
    Object? nameAm = null,
    Object? nameOm = null,
    Object? baseInventoryUnit = null,
    Object? defaultShelfLifeGuidance = freezed,
    Object? active = null,
    Object? image = freezed,
    Object? displayOrder = null,
  }) {
    return _then(
      _$MarketProductModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productCode: null == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        nameEn: null == nameEn
            ? _value.nameEn
            : nameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        nameAm: null == nameAm
            ? _value.nameAm
            : nameAm // ignore: cast_nullable_to_non_nullable
                  as String,
        nameOm: null == nameOm
            ? _value.nameOm
            : nameOm // ignore: cast_nullable_to_non_nullable
                  as String,
        baseInventoryUnit: null == baseInventoryUnit
            ? _value.baseInventoryUnit
            : baseInventoryUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        defaultShelfLifeGuidance: freezed == defaultShelfLifeGuidance
            ? _value.defaultShelfLifeGuidance
            : defaultShelfLifeGuidance // ignore: cast_nullable_to_non_nullable
                  as String?,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        displayOrder: null == displayOrder
            ? _value.displayOrder
            : displayOrder // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketProductModelImpl implements _MarketProductModel {
  const _$MarketProductModelImpl({
    required this.id,
    @JsonKey(name: 'product_code') required this.productCode,
    required this.category,
    @JsonKey(name: 'name_en') required this.nameEn,
    @JsonKey(name: 'name_am') required this.nameAm,
    @JsonKey(name: 'name_om') required this.nameOm,
    @JsonKey(name: 'base_inventory_unit') required this.baseInventoryUnit,
    @JsonKey(name: 'default_shelf_life_guidance') this.defaultShelfLifeGuidance,
    this.active = true,
    this.image,
    @JsonKey(name: 'display_order') this.displayOrder = 0,
  });

  factory _$MarketProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketProductModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'product_code')
  final String productCode;
  @override
  final String category;
  @override
  @JsonKey(name: 'name_en')
  final String nameEn;
  @override
  @JsonKey(name: 'name_am')
  final String nameAm;
  @override
  @JsonKey(name: 'name_om')
  final String nameOm;
  @override
  @JsonKey(name: 'base_inventory_unit')
  final String baseInventoryUnit;
  @override
  @JsonKey(name: 'default_shelf_life_guidance')
  final String? defaultShelfLifeGuidance;
  @override
  @JsonKey()
  final bool active;
  @override
  final String? image;
  @override
  @JsonKey(name: 'display_order')
  final int displayOrder;

  @override
  String toString() {
    return 'MarketProductModel(id: $id, productCode: $productCode, category: $category, nameEn: $nameEn, nameAm: $nameAm, nameOm: $nameOm, baseInventoryUnit: $baseInventoryUnit, defaultShelfLifeGuidance: $defaultShelfLifeGuidance, active: $active, image: $image, displayOrder: $displayOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.nameEn, nameEn) || other.nameEn == nameEn) &&
            (identical(other.nameAm, nameAm) || other.nameAm == nameAm) &&
            (identical(other.nameOm, nameOm) || other.nameOm == nameOm) &&
            (identical(other.baseInventoryUnit, baseInventoryUnit) ||
                other.baseInventoryUnit == baseInventoryUnit) &&
            (identical(
                  other.defaultShelfLifeGuidance,
                  defaultShelfLifeGuidance,
                ) ||
                other.defaultShelfLifeGuidance == defaultShelfLifeGuidance) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productCode,
    category,
    nameEn,
    nameAm,
    nameOm,
    baseInventoryUnit,
    defaultShelfLifeGuidance,
    active,
    image,
    displayOrder,
  );

  /// Create a copy of MarketProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketProductModelImplCopyWith<_$MarketProductModelImpl> get copyWith =>
      __$$MarketProductModelImplCopyWithImpl<_$MarketProductModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketProductModelImplToJson(this);
  }
}

abstract class _MarketProductModel implements MarketProductModel {
  const factory _MarketProductModel({
    required final String id,
    @JsonKey(name: 'product_code') required final String productCode,
    required final String category,
    @JsonKey(name: 'name_en') required final String nameEn,
    @JsonKey(name: 'name_am') required final String nameAm,
    @JsonKey(name: 'name_om') required final String nameOm,
    @JsonKey(name: 'base_inventory_unit')
    required final String baseInventoryUnit,
    @JsonKey(name: 'default_shelf_life_guidance')
    final String? defaultShelfLifeGuidance,
    final bool active,
    final String? image,
    @JsonKey(name: 'display_order') final int displayOrder,
  }) = _$MarketProductModelImpl;

  factory _MarketProductModel.fromJson(Map<String, dynamic> json) =
      _$MarketProductModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'product_code')
  String get productCode;
  @override
  String get category;
  @override
  @JsonKey(name: 'name_en')
  String get nameEn;
  @override
  @JsonKey(name: 'name_am')
  String get nameAm;
  @override
  @JsonKey(name: 'name_om')
  String get nameOm;
  @override
  @JsonKey(name: 'base_inventory_unit')
  String get baseInventoryUnit;
  @override
  @JsonKey(name: 'default_shelf_life_guidance')
  String? get defaultShelfLifeGuidance;
  @override
  bool get active;
  @override
  String? get image;
  @override
  @JsonKey(name: 'display_order')
  int get displayOrder;

  /// Create a copy of MarketProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarketProductModelImplCopyWith<_$MarketProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
