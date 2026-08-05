// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InventoryBatchModel _$InventoryBatchModelFromJson(Map<String, dynamic> json) {
  return _InventoryBatchModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryBatchModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_code')
  String get batchCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  String get sourceType => throw _privateConstructorUsedError; // 'milk_production' or 'egg_production'
  @JsonKey(name: 'produced_quantity')
  double get producedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_quantity')
  double get approvedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_quantity')
  double get availableQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'reserved_quantity')
  double get reservedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'sold_quantity')
  double get soldQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejected_quantity')
  double get rejectedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'wasted_quantity')
  double get wastedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_unit')
  String get baseUnit => throw _privateConstructorUsedError; // 'litres' or 'eggs'
  @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get producedAt => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'packed_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get packedAt => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'expires_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_status')
  InventoryQualityStatus get qualityStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'marketplace_status')
  String get marketplaceStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_metadata')
  Map<String, dynamic> get qualityMetadata =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  /// Serializes this InventoryBatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryBatchModelCopyWith<InventoryBatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryBatchModelCopyWith<$Res> {
  factory $InventoryBatchModelCopyWith(
    InventoryBatchModel value,
    $Res Function(InventoryBatchModel) then,
  ) = _$InventoryBatchModelCopyWithImpl<$Res, InventoryBatchModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'batch_code') String batchCode,
    @JsonKey(name: 'source_type') String sourceType,
    @JsonKey(name: 'produced_quantity') double producedQuantity,
    @JsonKey(name: 'approved_quantity') double approvedQuantity,
    @JsonKey(name: 'available_quantity') double availableQuantity,
    @JsonKey(name: 'reserved_quantity') double reservedQuantity,
    @JsonKey(name: 'sold_quantity') double soldQuantity,
    @JsonKey(name: 'rejected_quantity') double rejectedQuantity,
    @JsonKey(name: 'wasted_quantity') double wastedQuantity,
    @JsonKey(name: 'base_unit') String baseUnit,
    @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime producedAt,
    @JsonKey(
      name: 'packed_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? packedAt,
    @JsonKey(
      name: 'expires_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? expiresAt,
    @JsonKey(name: 'quality_status') InventoryQualityStatus qualityStatus,
    @JsonKey(name: 'marketplace_status') String marketplaceStatus,
    @JsonKey(name: 'quality_metadata') Map<String, dynamic> qualityMetadata,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
    int version,
  });
}

/// @nodoc
class _$InventoryBatchModelCopyWithImpl<$Res, $Val extends InventoryBatchModel>
    implements $InventoryBatchModelCopyWith<$Res> {
  _$InventoryBatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? productId = freezed,
    Object? batchCode = null,
    Object? sourceType = null,
    Object? producedQuantity = null,
    Object? approvedQuantity = null,
    Object? availableQuantity = null,
    Object? reservedQuantity = null,
    Object? soldQuantity = null,
    Object? rejectedQuantity = null,
    Object? wastedQuantity = null,
    Object? baseUnit = null,
    Object? producedAt = null,
    Object? packedAt = freezed,
    Object? expiresAt = freezed,
    Object? qualityStatus = null,
    Object? marketplaceStatus = null,
    Object? qualityMetadata = null,
    Object? createdBy = freezed,
    Object? approvedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
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
            batchCode: null == batchCode
                ? _value.batchCode
                : batchCode // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceType: null == sourceType
                ? _value.sourceType
                : sourceType // ignore: cast_nullable_to_non_nullable
                      as String,
            producedQuantity: null == producedQuantity
                ? _value.producedQuantity
                : producedQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            approvedQuantity: null == approvedQuantity
                ? _value.approvedQuantity
                : approvedQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            availableQuantity: null == availableQuantity
                ? _value.availableQuantity
                : availableQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            reservedQuantity: null == reservedQuantity
                ? _value.reservedQuantity
                : reservedQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            soldQuantity: null == soldQuantity
                ? _value.soldQuantity
                : soldQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            rejectedQuantity: null == rejectedQuantity
                ? _value.rejectedQuantity
                : rejectedQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            wastedQuantity: null == wastedQuantity
                ? _value.wastedQuantity
                : wastedQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
            baseUnit: null == baseUnit
                ? _value.baseUnit
                : baseUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            producedAt: null == producedAt
                ? _value.producedAt
                : producedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            packedAt: freezed == packedAt
                ? _value.packedAt
                : packedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            qualityStatus: null == qualityStatus
                ? _value.qualityStatus
                : qualityStatus // ignore: cast_nullable_to_non_nullable
                      as InventoryQualityStatus,
            marketplaceStatus: null == marketplaceStatus
                ? _value.marketplaceStatus
                : marketplaceStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            qualityMetadata: null == qualityMetadata
                ? _value.qualityMetadata
                : qualityMetadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            createdBy: freezed == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedBy: freezed == approvedBy
                ? _value.approvedBy
                : approvedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InventoryBatchModelImplCopyWith<$Res>
    implements $InventoryBatchModelCopyWith<$Res> {
  factory _$$InventoryBatchModelImplCopyWith(
    _$InventoryBatchModelImpl value,
    $Res Function(_$InventoryBatchModelImpl) then,
  ) = __$$InventoryBatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'batch_code') String batchCode,
    @JsonKey(name: 'source_type') String sourceType,
    @JsonKey(name: 'produced_quantity') double producedQuantity,
    @JsonKey(name: 'approved_quantity') double approvedQuantity,
    @JsonKey(name: 'available_quantity') double availableQuantity,
    @JsonKey(name: 'reserved_quantity') double reservedQuantity,
    @JsonKey(name: 'sold_quantity') double soldQuantity,
    @JsonKey(name: 'rejected_quantity') double rejectedQuantity,
    @JsonKey(name: 'wasted_quantity') double wastedQuantity,
    @JsonKey(name: 'base_unit') String baseUnit,
    @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime producedAt,
    @JsonKey(
      name: 'packed_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? packedAt,
    @JsonKey(
      name: 'expires_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? expiresAt,
    @JsonKey(name: 'quality_status') InventoryQualityStatus qualityStatus,
    @JsonKey(name: 'marketplace_status') String marketplaceStatus,
    @JsonKey(name: 'quality_metadata') Map<String, dynamic> qualityMetadata,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
    int version,
  });
}

/// @nodoc
class __$$InventoryBatchModelImplCopyWithImpl<$Res>
    extends _$InventoryBatchModelCopyWithImpl<$Res, _$InventoryBatchModelImpl>
    implements _$$InventoryBatchModelImplCopyWith<$Res> {
  __$$InventoryBatchModelImplCopyWithImpl(
    _$InventoryBatchModelImpl _value,
    $Res Function(_$InventoryBatchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InventoryBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? productId = freezed,
    Object? batchCode = null,
    Object? sourceType = null,
    Object? producedQuantity = null,
    Object? approvedQuantity = null,
    Object? availableQuantity = null,
    Object? reservedQuantity = null,
    Object? soldQuantity = null,
    Object? rejectedQuantity = null,
    Object? wastedQuantity = null,
    Object? baseUnit = null,
    Object? producedAt = null,
    Object? packedAt = freezed,
    Object? expiresAt = freezed,
    Object? qualityStatus = null,
    Object? marketplaceStatus = null,
    Object? qualityMetadata = null,
    Object? createdBy = freezed,
    Object? approvedBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
  }) {
    return _then(
      _$InventoryBatchModelImpl(
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
        batchCode: null == batchCode
            ? _value.batchCode
            : batchCode // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceType: null == sourceType
            ? _value.sourceType
            : sourceType // ignore: cast_nullable_to_non_nullable
                  as String,
        producedQuantity: null == producedQuantity
            ? _value.producedQuantity
            : producedQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        approvedQuantity: null == approvedQuantity
            ? _value.approvedQuantity
            : approvedQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        availableQuantity: null == availableQuantity
            ? _value.availableQuantity
            : availableQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        reservedQuantity: null == reservedQuantity
            ? _value.reservedQuantity
            : reservedQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        soldQuantity: null == soldQuantity
            ? _value.soldQuantity
            : soldQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        rejectedQuantity: null == rejectedQuantity
            ? _value.rejectedQuantity
            : rejectedQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        wastedQuantity: null == wastedQuantity
            ? _value.wastedQuantity
            : wastedQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
        baseUnit: null == baseUnit
            ? _value.baseUnit
            : baseUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        producedAt: null == producedAt
            ? _value.producedAt
            : producedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        packedAt: freezed == packedAt
            ? _value.packedAt
            : packedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        qualityStatus: null == qualityStatus
            ? _value.qualityStatus
            : qualityStatus // ignore: cast_nullable_to_non_nullable
                  as InventoryQualityStatus,
        marketplaceStatus: null == marketplaceStatus
            ? _value.marketplaceStatus
            : marketplaceStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        qualityMetadata: null == qualityMetadata
            ? _value._qualityMetadata
            : qualityMetadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdBy: freezed == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedBy: freezed == approvedBy
            ? _value.approvedBy
            : approvedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryBatchModelImpl implements _InventoryBatchModel {
  const _$InventoryBatchModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'product_id') this.productId,
    @JsonKey(name: 'batch_code') required this.batchCode,
    @JsonKey(name: 'source_type') required this.sourceType,
    @JsonKey(name: 'produced_quantity') required this.producedQuantity,
    @JsonKey(name: 'approved_quantity') this.approvedQuantity = 0.0,
    @JsonKey(name: 'available_quantity') this.availableQuantity = 0.0,
    @JsonKey(name: 'reserved_quantity') this.reservedQuantity = 0.0,
    @JsonKey(name: 'sold_quantity') this.soldQuantity = 0.0,
    @JsonKey(name: 'rejected_quantity') this.rejectedQuantity = 0.0,
    @JsonKey(name: 'wasted_quantity') this.wastedQuantity = 0.0,
    @JsonKey(name: 'base_unit') required this.baseUnit,
    @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.producedAt,
    @JsonKey(
      name: 'packed_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    this.packedAt,
    @JsonKey(
      name: 'expires_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    this.expiresAt,
    @JsonKey(name: 'quality_status')
    this.qualityStatus = InventoryQualityStatus.pendingInspection,
    @JsonKey(name: 'marketplace_status') this.marketplaceStatus = 'unlisted',
    @JsonKey(name: 'quality_metadata')
    final Map<String, dynamic> qualityMetadata = const {},
    @JsonKey(name: 'created_by') this.createdBy,
    @JsonKey(name: 'approved_by') this.approvedBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
    this.version = 1,
  }) : _qualityMetadata = qualityMetadata;

  factory _$InventoryBatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryBatchModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  @JsonKey(name: 'batch_code')
  final String batchCode;
  @override
  @JsonKey(name: 'source_type')
  final String sourceType;
  // 'milk_production' or 'egg_production'
  @override
  @JsonKey(name: 'produced_quantity')
  final double producedQuantity;
  @override
  @JsonKey(name: 'approved_quantity')
  final double approvedQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  final double availableQuantity;
  @override
  @JsonKey(name: 'reserved_quantity')
  final double reservedQuantity;
  @override
  @JsonKey(name: 'sold_quantity')
  final double soldQuantity;
  @override
  @JsonKey(name: 'rejected_quantity')
  final double rejectedQuantity;
  @override
  @JsonKey(name: 'wasted_quantity')
  final double wastedQuantity;
  @override
  @JsonKey(name: 'base_unit')
  final String baseUnit;
  // 'litres' or 'eggs'
  @override
  @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime producedAt;
  @override
  @JsonKey(
    name: 'packed_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  final DateTime? packedAt;
  @override
  @JsonKey(
    name: 'expires_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'quality_status')
  final InventoryQualityStatus qualityStatus;
  @override
  @JsonKey(name: 'marketplace_status')
  final String marketplaceStatus;
  final Map<String, dynamic> _qualityMetadata;
  @override
  @JsonKey(name: 'quality_metadata')
  Map<String, dynamic> get qualityMetadata {
    if (_qualityMetadata is EqualUnmodifiableMapView) return _qualityMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_qualityMetadata);
  }

  @override
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @override
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int version;

  @override
  String toString() {
    return 'InventoryBatchModel(id: $id, farmId: $farmId, productId: $productId, batchCode: $batchCode, sourceType: $sourceType, producedQuantity: $producedQuantity, approvedQuantity: $approvedQuantity, availableQuantity: $availableQuantity, reservedQuantity: $reservedQuantity, soldQuantity: $soldQuantity, rejectedQuantity: $rejectedQuantity, wastedQuantity: $wastedQuantity, baseUnit: $baseUnit, producedAt: $producedAt, packedAt: $packedAt, expiresAt: $expiresAt, qualityStatus: $qualityStatus, marketplaceStatus: $marketplaceStatus, qualityMetadata: $qualityMetadata, createdBy: $createdBy, approvedBy: $approvedBy, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryBatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.batchCode, batchCode) ||
                other.batchCode == batchCode) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.producedQuantity, producedQuantity) ||
                other.producedQuantity == producedQuantity) &&
            (identical(other.approvedQuantity, approvedQuantity) ||
                other.approvedQuantity == approvedQuantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.reservedQuantity, reservedQuantity) ||
                other.reservedQuantity == reservedQuantity) &&
            (identical(other.soldQuantity, soldQuantity) ||
                other.soldQuantity == soldQuantity) &&
            (identical(other.rejectedQuantity, rejectedQuantity) ||
                other.rejectedQuantity == rejectedQuantity) &&
            (identical(other.wastedQuantity, wastedQuantity) ||
                other.wastedQuantity == wastedQuantity) &&
            (identical(other.baseUnit, baseUnit) ||
                other.baseUnit == baseUnit) &&
            (identical(other.producedAt, producedAt) ||
                other.producedAt == producedAt) &&
            (identical(other.packedAt, packedAt) ||
                other.packedAt == packedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.qualityStatus, qualityStatus) ||
                other.qualityStatus == qualityStatus) &&
            (identical(other.marketplaceStatus, marketplaceStatus) ||
                other.marketplaceStatus == marketplaceStatus) &&
            const DeepCollectionEquality().equals(
              other._qualityMetadata,
              _qualityMetadata,
            ) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    farmId,
    productId,
    batchCode,
    sourceType,
    producedQuantity,
    approvedQuantity,
    availableQuantity,
    reservedQuantity,
    soldQuantity,
    rejectedQuantity,
    wastedQuantity,
    baseUnit,
    producedAt,
    packedAt,
    expiresAt,
    qualityStatus,
    marketplaceStatus,
    const DeepCollectionEquality().hash(_qualityMetadata),
    createdBy,
    approvedBy,
    createdAt,
    updatedAt,
    version,
  ]);

  /// Create a copy of InventoryBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryBatchModelImplCopyWith<_$InventoryBatchModelImpl> get copyWith =>
      __$$InventoryBatchModelImplCopyWithImpl<_$InventoryBatchModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryBatchModelImplToJson(this);
  }
}

abstract class _InventoryBatchModel implements InventoryBatchModel {
  const factory _InventoryBatchModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'product_id') final String? productId,
    @JsonKey(name: 'batch_code') required final String batchCode,
    @JsonKey(name: 'source_type') required final String sourceType,
    @JsonKey(name: 'produced_quantity') required final double producedQuantity,
    @JsonKey(name: 'approved_quantity') final double approvedQuantity,
    @JsonKey(name: 'available_quantity') final double availableQuantity,
    @JsonKey(name: 'reserved_quantity') final double reservedQuantity,
    @JsonKey(name: 'sold_quantity') final double soldQuantity,
    @JsonKey(name: 'rejected_quantity') final double rejectedQuantity,
    @JsonKey(name: 'wasted_quantity') final double wastedQuantity,
    @JsonKey(name: 'base_unit') required final String baseUnit,
    @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime producedAt,
    @JsonKey(
      name: 'packed_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    final DateTime? packedAt,
    @JsonKey(
      name: 'expires_at',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    final DateTime? expiresAt,
    @JsonKey(name: 'quality_status') final InventoryQualityStatus qualityStatus,
    @JsonKey(name: 'marketplace_status') final String marketplaceStatus,
    @JsonKey(name: 'quality_metadata')
    final Map<String, dynamic> qualityMetadata,
    @JsonKey(name: 'created_by') final String? createdBy,
    @JsonKey(name: 'approved_by') final String? approvedBy,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
    final int version,
  }) = _$InventoryBatchModelImpl;

  factory _InventoryBatchModel.fromJson(Map<String, dynamic> json) =
      _$InventoryBatchModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @override
  @JsonKey(name: 'batch_code')
  String get batchCode;
  @override
  @JsonKey(name: 'source_type')
  String get sourceType; // 'milk_production' or 'egg_production'
  @override
  @JsonKey(name: 'produced_quantity')
  double get producedQuantity;
  @override
  @JsonKey(name: 'approved_quantity')
  double get approvedQuantity;
  @override
  @JsonKey(name: 'available_quantity')
  double get availableQuantity;
  @override
  @JsonKey(name: 'reserved_quantity')
  double get reservedQuantity;
  @override
  @JsonKey(name: 'sold_quantity')
  double get soldQuantity;
  @override
  @JsonKey(name: 'rejected_quantity')
  double get rejectedQuantity;
  @override
  @JsonKey(name: 'wasted_quantity')
  double get wastedQuantity;
  @override
  @JsonKey(name: 'base_unit')
  String get baseUnit; // 'litres' or 'eggs'
  @override
  @JsonKey(name: 'produced_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get producedAt;
  @override
  @JsonKey(
    name: 'packed_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get packedAt;
  @override
  @JsonKey(
    name: 'expires_at',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get expiresAt;
  @override
  @JsonKey(name: 'quality_status')
  InventoryQualityStatus get qualityStatus;
  @override
  @JsonKey(name: 'marketplace_status')
  String get marketplaceStatus;
  @override
  @JsonKey(name: 'quality_metadata')
  Map<String, dynamic> get qualityMetadata;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'approved_by')
  String? get approvedBy;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt;
  @override
  int get version;

  /// Create a copy of InventoryBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryBatchModelImplCopyWith<_$InventoryBatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
