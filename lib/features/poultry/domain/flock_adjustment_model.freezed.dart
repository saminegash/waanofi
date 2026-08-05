// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flock_adjustment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FlockAdjustmentModel _$FlockAdjustmentModelFromJson(Map<String, dynamic> json) {
  return _FlockAdjustmentModel.fromJson(json);
}

/// @nodoc
mixin _$FlockAdjustmentModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flock_id')
  String get flockId => throw _privateConstructorUsedError;
  @JsonKey(name: 'adjustment_type')
  FlockAdjustmentType get adjustmentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'birds_changed')
  int get birdsChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'hens_changed')
  int get hensChanged => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FlockAdjustmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlockAdjustmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlockAdjustmentModelCopyWith<FlockAdjustmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlockAdjustmentModelCopyWith<$Res> {
  factory $FlockAdjustmentModelCopyWith(
    FlockAdjustmentModel value,
    $Res Function(FlockAdjustmentModel) then,
  ) = _$FlockAdjustmentModelCopyWithImpl<$Res, FlockAdjustmentModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_id') String flockId,
    @JsonKey(name: 'adjustment_type') FlockAdjustmentType adjustmentType,
    @JsonKey(name: 'birds_changed') int birdsChanged,
    @JsonKey(name: 'hens_changed') int hensChanged,
    String? reason,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$FlockAdjustmentModelCopyWithImpl<
  $Res,
  $Val extends FlockAdjustmentModel
>
    implements $FlockAdjustmentModelCopyWith<$Res> {
  _$FlockAdjustmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlockAdjustmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockId = null,
    Object? adjustmentType = null,
    Object? birdsChanged = null,
    Object? hensChanged = null,
    Object? reason = freezed,
    Object? recordedAt = null,
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
            flockId: null == flockId
                ? _value.flockId
                : flockId // ignore: cast_nullable_to_non_nullable
                      as String,
            adjustmentType: null == adjustmentType
                ? _value.adjustmentType
                : adjustmentType // ignore: cast_nullable_to_non_nullable
                      as FlockAdjustmentType,
            birdsChanged: null == birdsChanged
                ? _value.birdsChanged
                : birdsChanged // ignore: cast_nullable_to_non_nullable
                      as int,
            hensChanged: null == hensChanged
                ? _value.hensChanged
                : hensChanged // ignore: cast_nullable_to_non_nullable
                      as int,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
abstract class _$$FlockAdjustmentModelImplCopyWith<$Res>
    implements $FlockAdjustmentModelCopyWith<$Res> {
  factory _$$FlockAdjustmentModelImplCopyWith(
    _$FlockAdjustmentModelImpl value,
    $Res Function(_$FlockAdjustmentModelImpl) then,
  ) = __$$FlockAdjustmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_id') String flockId,
    @JsonKey(name: 'adjustment_type') FlockAdjustmentType adjustmentType,
    @JsonKey(name: 'birds_changed') int birdsChanged,
    @JsonKey(name: 'hens_changed') int hensChanged,
    String? reason,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$FlockAdjustmentModelImplCopyWithImpl<$Res>
    extends _$FlockAdjustmentModelCopyWithImpl<$Res, _$FlockAdjustmentModelImpl>
    implements _$$FlockAdjustmentModelImplCopyWith<$Res> {
  __$$FlockAdjustmentModelImplCopyWithImpl(
    _$FlockAdjustmentModelImpl _value,
    $Res Function(_$FlockAdjustmentModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlockAdjustmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockId = null,
    Object? adjustmentType = null,
    Object? birdsChanged = null,
    Object? hensChanged = null,
    Object? reason = freezed,
    Object? recordedAt = null,
    Object? recordedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$FlockAdjustmentModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        flockId: null == flockId
            ? _value.flockId
            : flockId // ignore: cast_nullable_to_non_nullable
                  as String,
        adjustmentType: null == adjustmentType
            ? _value.adjustmentType
            : adjustmentType // ignore: cast_nullable_to_non_nullable
                  as FlockAdjustmentType,
        birdsChanged: null == birdsChanged
            ? _value.birdsChanged
            : birdsChanged // ignore: cast_nullable_to_non_nullable
                  as int,
        hensChanged: null == hensChanged
            ? _value.hensChanged
            : hensChanged // ignore: cast_nullable_to_non_nullable
                  as int,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$FlockAdjustmentModelImpl implements _FlockAdjustmentModel {
  const _$FlockAdjustmentModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'flock_id') required this.flockId,
    @JsonKey(name: 'adjustment_type') required this.adjustmentType,
    @JsonKey(name: 'birds_changed') required this.birdsChanged,
    @JsonKey(name: 'hens_changed') this.hensChanged = 0,
    this.reason,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.recordedAt,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$FlockAdjustmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlockAdjustmentModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'flock_id')
  final String flockId;
  @override
  @JsonKey(name: 'adjustment_type')
  final FlockAdjustmentType adjustmentType;
  @override
  @JsonKey(name: 'birds_changed')
  final int birdsChanged;
  @override
  @JsonKey(name: 'hens_changed')
  final int hensChanged;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime recordedAt;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'FlockAdjustmentModel(id: $id, farmId: $farmId, flockId: $flockId, adjustmentType: $adjustmentType, birdsChanged: $birdsChanged, hensChanged: $hensChanged, reason: $reason, recordedAt: $recordedAt, recordedBy: $recordedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlockAdjustmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.flockId, flockId) || other.flockId == flockId) &&
            (identical(other.adjustmentType, adjustmentType) ||
                other.adjustmentType == adjustmentType) &&
            (identical(other.birdsChanged, birdsChanged) ||
                other.birdsChanged == birdsChanged) &&
            (identical(other.hensChanged, hensChanged) ||
                other.hensChanged == hensChanged) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
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
    flockId,
    adjustmentType,
    birdsChanged,
    hensChanged,
    reason,
    recordedAt,
    recordedBy,
    createdAt,
  );

  /// Create a copy of FlockAdjustmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlockAdjustmentModelImplCopyWith<_$FlockAdjustmentModelImpl>
  get copyWith =>
      __$$FlockAdjustmentModelImplCopyWithImpl<_$FlockAdjustmentModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FlockAdjustmentModelImplToJson(this);
  }
}

abstract class _FlockAdjustmentModel implements FlockAdjustmentModel {
  const factory _FlockAdjustmentModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'flock_id') required final String flockId,
    @JsonKey(name: 'adjustment_type')
    required final FlockAdjustmentType adjustmentType,
    @JsonKey(name: 'birds_changed') required final int birdsChanged,
    @JsonKey(name: 'hens_changed') final int hensChanged,
    final String? reason,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime recordedAt,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$FlockAdjustmentModelImpl;

  factory _FlockAdjustmentModel.fromJson(Map<String, dynamic> json) =
      _$FlockAdjustmentModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'flock_id')
  String get flockId;
  @override
  @JsonKey(name: 'adjustment_type')
  FlockAdjustmentType get adjustmentType;
  @override
  @JsonKey(name: 'birds_changed')
  int get birdsChanged;
  @override
  @JsonKey(name: 'hens_changed')
  int get hensChanged;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of FlockAdjustmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlockAdjustmentModelImplCopyWith<_$FlockAdjustmentModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
