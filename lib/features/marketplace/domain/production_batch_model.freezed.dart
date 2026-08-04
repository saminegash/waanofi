// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductionBatchModel _$ProductionBatchModelFromJson(Map<String, dynamic> json) {
  return _ProductionBatchModel.fromJson(json);
}

/// @nodoc
mixin _$ProductionBatchModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  ProductCategory get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_label')
  String get batchLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_total')
  double get quantityTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_available')
  double get quantityAvailable => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get productionDate => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'expiry_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  BatchStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_at')
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductionBatchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductionBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductionBatchModelCopyWith<ProductionBatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionBatchModelCopyWith<$Res> {
  factory $ProductionBatchModelCopyWith(
    ProductionBatchModel value,
    $Res Function(ProductionBatchModel) then,
  ) = _$ProductionBatchModelCopyWithImpl<$Res, ProductionBatchModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    ProductCategory category,
    @JsonKey(name: 'batch_label') String batchLabel,
    @JsonKey(name: 'quantity_total') double quantityTotal,
    @JsonKey(name: 'quantity_available') double quantityAvailable,
    String unit,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    String currency,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    DateTime productionDate,
    @JsonKey(
      name: 'expiry_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? expiryDate,
    BatchStatus status,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'approved_at') DateTime? approvedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$ProductionBatchModelCopyWithImpl<
  $Res,
  $Val extends ProductionBatchModel
>
    implements $ProductionBatchModelCopyWith<$Res> {
  _$ProductionBatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductionBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? category = null,
    Object? batchLabel = null,
    Object? quantityTotal = null,
    Object? quantityAvailable = null,
    Object? unit = null,
    Object? unitPriceMinor = null,
    Object? currency = null,
    Object? productionDate = null,
    Object? expiryDate = freezed,
    Object? status = null,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ProductCategory,
            batchLabel: null == batchLabel
                ? _value.batchLabel
                : batchLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            quantityTotal: null == quantityTotal
                ? _value.quantityTotal
                : quantityTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            quantityAvailable: null == quantityAvailable
                ? _value.quantityAvailable
                : quantityAvailable // ignore: cast_nullable_to_non_nullable
                      as double,
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
            productionDate: null == productionDate
                ? _value.productionDate
                : productionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiryDate: freezed == expiryDate
                ? _value.expiryDate
                : expiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BatchStatus,
            approvedBy: freezed == approvedBy
                ? _value.approvedBy
                : approvedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            approvedAt: freezed == approvedAt
                ? _value.approvedAt
                : approvedAt // ignore: cast_nullable_to_non_nullable
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductionBatchModelImplCopyWith<$Res>
    implements $ProductionBatchModelCopyWith<$Res> {
  factory _$$ProductionBatchModelImplCopyWith(
    _$ProductionBatchModelImpl value,
    $Res Function(_$ProductionBatchModelImpl) then,
  ) = __$$ProductionBatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    ProductCategory category,
    @JsonKey(name: 'batch_label') String batchLabel,
    @JsonKey(name: 'quantity_total') double quantityTotal,
    @JsonKey(name: 'quantity_available') double quantityAvailable,
    String unit,
    @JsonKey(name: 'unit_price_minor') int unitPriceMinor,
    String currency,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    DateTime productionDate,
    @JsonKey(
      name: 'expiry_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? expiryDate,
    BatchStatus status,
    @JsonKey(name: 'approved_by') String? approvedBy,
    @JsonKey(name: 'approved_at') DateTime? approvedAt,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$ProductionBatchModelImplCopyWithImpl<$Res>
    extends _$ProductionBatchModelCopyWithImpl<$Res, _$ProductionBatchModelImpl>
    implements _$$ProductionBatchModelImplCopyWith<$Res> {
  __$$ProductionBatchModelImplCopyWithImpl(
    _$ProductionBatchModelImpl _value,
    $Res Function(_$ProductionBatchModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductionBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? category = null,
    Object? batchLabel = null,
    Object? quantityTotal = null,
    Object? quantityAvailable = null,
    Object? unit = null,
    Object? unitPriceMinor = null,
    Object? currency = null,
    Object? productionDate = null,
    Object? expiryDate = freezed,
    Object? status = null,
    Object? approvedBy = freezed,
    Object? approvedAt = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ProductionBatchModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ProductCategory,
        batchLabel: null == batchLabel
            ? _value.batchLabel
            : batchLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        quantityTotal: null == quantityTotal
            ? _value.quantityTotal
            : quantityTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        quantityAvailable: null == quantityAvailable
            ? _value.quantityAvailable
            : quantityAvailable // ignore: cast_nullable_to_non_nullable
                  as double,
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
        productionDate: null == productionDate
            ? _value.productionDate
            : productionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiryDate: freezed == expiryDate
            ? _value.expiryDate
            : expiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BatchStatus,
        approvedBy: freezed == approvedBy
            ? _value.approvedBy
            : approvedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        approvedAt: freezed == approvedAt
            ? _value.approvedAt
            : approvedAt // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionBatchModelImpl implements _ProductionBatchModel {
  const _$ProductionBatchModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    required this.category,
    @JsonKey(name: 'batch_label') required this.batchLabel,
    @JsonKey(name: 'quantity_total') required this.quantityTotal,
    @JsonKey(name: 'quantity_available') required this.quantityAvailable,
    required this.unit,
    @JsonKey(name: 'unit_price_minor') required this.unitPriceMinor,
    this.currency = 'ETB',
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    required this.productionDate,
    @JsonKey(
      name: 'expiry_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    this.expiryDate,
    required this.status,
    @JsonKey(name: 'approved_by') this.approvedBy,
    @JsonKey(name: 'approved_at') this.approvedAt,
    @JsonKey(name: 'created_by') this.createdBy,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$ProductionBatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionBatchModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  final ProductCategory category;
  @override
  @JsonKey(name: 'batch_label')
  final String batchLabel;
  @override
  @JsonKey(name: 'quantity_total')
  final double quantityTotal;
  @override
  @JsonKey(name: 'quantity_available')
  final double quantityAvailable;
  @override
  final String unit;
  @override
  @JsonKey(name: 'unit_price_minor')
  final int unitPriceMinor;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime productionDate;
  @override
  @JsonKey(
    name: 'expiry_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  final DateTime? expiryDate;
  @override
  final BatchStatus status;
  @override
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @override
  @JsonKey(name: 'approved_at')
  final DateTime? approvedAt;
  @override
  @JsonKey(name: 'created_by')
  final String? createdBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProductionBatchModel(id: $id, farmId: $farmId, category: $category, batchLabel: $batchLabel, quantityTotal: $quantityTotal, quantityAvailable: $quantityAvailable, unit: $unit, unitPriceMinor: $unitPriceMinor, currency: $currency, productionDate: $productionDate, expiryDate: $expiryDate, status: $status, approvedBy: $approvedBy, approvedAt: $approvedAt, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionBatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.batchLabel, batchLabel) ||
                other.batchLabel == batchLabel) &&
            (identical(other.quantityTotal, quantityTotal) ||
                other.quantityTotal == quantityTotal) &&
            (identical(other.quantityAvailable, quantityAvailable) ||
                other.quantityAvailable == quantityAvailable) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitPriceMinor, unitPriceMinor) ||
                other.unitPriceMinor == unitPriceMinor) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.productionDate, productionDate) ||
                other.productionDate == productionDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
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
    farmId,
    category,
    batchLabel,
    quantityTotal,
    quantityAvailable,
    unit,
    unitPriceMinor,
    currency,
    productionDate,
    expiryDate,
    status,
    approvedBy,
    approvedAt,
    createdBy,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ProductionBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionBatchModelImplCopyWith<_$ProductionBatchModelImpl>
  get copyWith =>
      __$$ProductionBatchModelImplCopyWithImpl<_$ProductionBatchModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionBatchModelImplToJson(this);
  }
}

abstract class _ProductionBatchModel implements ProductionBatchModel {
  const factory _ProductionBatchModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    required final ProductCategory category,
    @JsonKey(name: 'batch_label') required final String batchLabel,
    @JsonKey(name: 'quantity_total') required final double quantityTotal,
    @JsonKey(name: 'quantity_available')
    required final double quantityAvailable,
    required final String unit,
    @JsonKey(name: 'unit_price_minor') required final int unitPriceMinor,
    final String currency,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    required final DateTime productionDate,
    @JsonKey(
      name: 'expiry_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    final DateTime? expiryDate,
    required final BatchStatus status,
    @JsonKey(name: 'approved_by') final String? approvedBy,
    @JsonKey(name: 'approved_at') final DateTime? approvedAt,
    @JsonKey(name: 'created_by') final String? createdBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$ProductionBatchModelImpl;

  factory _ProductionBatchModel.fromJson(Map<String, dynamic> json) =
      _$ProductionBatchModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  ProductCategory get category;
  @override
  @JsonKey(name: 'batch_label')
  String get batchLabel;
  @override
  @JsonKey(name: 'quantity_total')
  double get quantityTotal;
  @override
  @JsonKey(name: 'quantity_available')
  double get quantityAvailable;
  @override
  String get unit;
  @override
  @JsonKey(name: 'unit_price_minor')
  int get unitPriceMinor;
  @override
  String get currency;
  @override
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get productionDate;
  @override
  @JsonKey(
    name: 'expiry_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get expiryDate;
  @override
  BatchStatus get status;
  @override
  @JsonKey(name: 'approved_by')
  String? get approvedBy;
  @override
  @JsonKey(name: 'approved_at')
  DateTime? get approvedAt;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ProductionBatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductionBatchModelImplCopyWith<_$ProductionBatchModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
