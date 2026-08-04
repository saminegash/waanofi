// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egg_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EggRecordModel _$EggRecordModelFromJson(Map<String, dynamic> json) {
  return _EggRecordModel.fromJson(json);
}

/// @nodoc
mixin _$EggRecordModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flock_name')
  String get flockName => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_type')
  EggProductionType get productionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'broken_count')
  int get brokenCount => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EggRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EggRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EggRecordModelCopyWith<EggRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EggRecordModelCopyWith<$Res> {
  factory $EggRecordModelCopyWith(
    EggRecordModel value,
    $Res Function(EggRecordModel) then,
  ) = _$EggRecordModelCopyWithImpl<$Res, EggRecordModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_name') String flockName,
    @JsonKey(name: 'production_type') EggProductionType productionType,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    int quantity,
    @JsonKey(name: 'broken_count') int brokenCount,
    String? notes,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$EggRecordModelCopyWithImpl<$Res, $Val extends EggRecordModel>
    implements $EggRecordModelCopyWith<$Res> {
  _$EggRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EggRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockName = null,
    Object? productionType = null,
    Object? recordedAt = null,
    Object? quantity = null,
    Object? brokenCount = null,
    Object? notes = freezed,
    Object? recordedBy = freezed,
    Object? createdAt = null,
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
            flockName: null == flockName
                ? _value.flockName
                : flockName // ignore: cast_nullable_to_non_nullable
                      as String,
            productionType: null == productionType
                ? _value.productionType
                : productionType // ignore: cast_nullable_to_non_nullable
                      as EggProductionType,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            brokenCount: null == brokenCount
                ? _value.brokenCount
                : brokenCount // ignore: cast_nullable_to_non_nullable
                      as int,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedBy: freezed == recordedBy
                ? _value.recordedBy
                : recordedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$EggRecordModelImplCopyWith<$Res>
    implements $EggRecordModelCopyWith<$Res> {
  factory _$$EggRecordModelImplCopyWith(
    _$EggRecordModelImpl value,
    $Res Function(_$EggRecordModelImpl) then,
  ) = __$$EggRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_name') String flockName,
    @JsonKey(name: 'production_type') EggProductionType productionType,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    int quantity,
    @JsonKey(name: 'broken_count') int brokenCount,
    String? notes,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$EggRecordModelImplCopyWithImpl<$Res>
    extends _$EggRecordModelCopyWithImpl<$Res, _$EggRecordModelImpl>
    implements _$$EggRecordModelImplCopyWith<$Res> {
  __$$EggRecordModelImplCopyWithImpl(
    _$EggRecordModelImpl _value,
    $Res Function(_$EggRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EggRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockName = null,
    Object? productionType = null,
    Object? recordedAt = null,
    Object? quantity = null,
    Object? brokenCount = null,
    Object? notes = freezed,
    Object? recordedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$EggRecordModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        flockName: null == flockName
            ? _value.flockName
            : flockName // ignore: cast_nullable_to_non_nullable
                  as String,
        productionType: null == productionType
            ? _value.productionType
            : productionType // ignore: cast_nullable_to_non_nullable
                  as EggProductionType,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        brokenCount: null == brokenCount
            ? _value.brokenCount
            : brokenCount // ignore: cast_nullable_to_non_nullable
                  as int,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedBy: freezed == recordedBy
            ? _value.recordedBy
            : recordedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$EggRecordModelImpl implements _EggRecordModel {
  const _$EggRecordModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'flock_name') required this.flockName,
    @JsonKey(name: 'production_type') required this.productionType,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.recordedAt,
    required this.quantity,
    @JsonKey(name: 'broken_count') this.brokenCount = 0,
    this.notes,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$EggRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EggRecordModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'flock_name')
  final String flockName;
  @override
  @JsonKey(name: 'production_type')
  final EggProductionType productionType;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime recordedAt;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'broken_count')
  final int brokenCount;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'EggRecordModel(id: $id, farmId: $farmId, flockName: $flockName, productionType: $productionType, recordedAt: $recordedAt, quantity: $quantity, brokenCount: $brokenCount, notes: $notes, recordedBy: $recordedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EggRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.flockName, flockName) ||
                other.flockName == flockName) &&
            (identical(other.productionType, productionType) ||
                other.productionType == productionType) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.brokenCount, brokenCount) ||
                other.brokenCount == brokenCount) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.recordedBy, recordedBy) ||
                other.recordedBy == recordedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    farmId,
    flockName,
    productionType,
    recordedAt,
    quantity,
    brokenCount,
    notes,
    recordedBy,
    createdAt,
  );

  /// Create a copy of EggRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EggRecordModelImplCopyWith<_$EggRecordModelImpl> get copyWith =>
      __$$EggRecordModelImplCopyWithImpl<_$EggRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EggRecordModelImplToJson(this);
  }
}

abstract class _EggRecordModel implements EggRecordModel {
  const factory _EggRecordModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'flock_name') required final String flockName,
    @JsonKey(name: 'production_type')
    required final EggProductionType productionType,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime recordedAt,
    required final int quantity,
    @JsonKey(name: 'broken_count') final int brokenCount,
    final String? notes,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$EggRecordModelImpl;

  factory _EggRecordModel.fromJson(Map<String, dynamic> json) =
      _$EggRecordModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'flock_name')
  String get flockName;
  @override
  @JsonKey(name: 'production_type')
  EggProductionType get productionType;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'broken_count')
  int get brokenCount;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of EggRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EggRecordModelImplCopyWith<_$EggRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
