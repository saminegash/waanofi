// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedRecordModel _$FeedRecordModelFromJson(Map<String, dynamic> json) {
  return _FeedRecordModel.fromJson(json);
}

/// @nodoc
mixin _$FeedRecordModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'animal_id')
  String? get animalId => throw _privateConstructorUsedError; // Null means farm-wide
  @JsonKey(name: 'feed_type')
  String get feedTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_kg')
  double get quantityKg => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedRecordModelCopyWith<FeedRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedRecordModelCopyWith<$Res> {
  factory $FeedRecordModelCopyWith(
    FeedRecordModel value,
    $Res Function(FeedRecordModel) then,
  ) = _$FeedRecordModelCopyWithImpl<$Res, FeedRecordModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'animal_id') String? animalId,
    @JsonKey(name: 'feed_type') String feedTypeId,
    @JsonKey(name: 'quantity_kg') double quantityKg,
    double cost,
    @JsonKey(name: 'recorded_at') DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$FeedRecordModelCopyWithImpl<$Res, $Val extends FeedRecordModel>
    implements $FeedRecordModelCopyWith<$Res> {
  _$FeedRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? animalId = freezed,
    Object? feedTypeId = null,
    Object? quantityKg = null,
    Object? cost = null,
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
            animalId: freezed == animalId
                ? _value.animalId
                : animalId // ignore: cast_nullable_to_non_nullable
                      as String?,
            feedTypeId: null == feedTypeId
                ? _value.feedTypeId
                : feedTypeId // ignore: cast_nullable_to_non_nullable
                      as String,
            quantityKg: null == quantityKg
                ? _value.quantityKg
                : quantityKg // ignore: cast_nullable_to_non_nullable
                      as double,
            cost: null == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$FeedRecordModelImplCopyWith<$Res>
    implements $FeedRecordModelCopyWith<$Res> {
  factory _$$FeedRecordModelImplCopyWith(
    _$FeedRecordModelImpl value,
    $Res Function(_$FeedRecordModelImpl) then,
  ) = __$$FeedRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'animal_id') String? animalId,
    @JsonKey(name: 'feed_type') String feedTypeId,
    @JsonKey(name: 'quantity_kg') double quantityKg,
    double cost,
    @JsonKey(name: 'recorded_at') DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$FeedRecordModelImplCopyWithImpl<$Res>
    extends _$FeedRecordModelCopyWithImpl<$Res, _$FeedRecordModelImpl>
    implements _$$FeedRecordModelImplCopyWith<$Res> {
  __$$FeedRecordModelImplCopyWithImpl(
    _$FeedRecordModelImpl _value,
    $Res Function(_$FeedRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? animalId = freezed,
    Object? feedTypeId = null,
    Object? quantityKg = null,
    Object? cost = null,
    Object? recordedAt = null,
    Object? recordedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$FeedRecordModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        animalId: freezed == animalId
            ? _value.animalId
            : animalId // ignore: cast_nullable_to_non_nullable
                  as String?,
        feedTypeId: null == feedTypeId
            ? _value.feedTypeId
            : feedTypeId // ignore: cast_nullable_to_non_nullable
                  as String,
        quantityKg: null == quantityKg
            ? _value.quantityKg
            : quantityKg // ignore: cast_nullable_to_non_nullable
                  as double,
        cost: null == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$FeedRecordModelImpl implements _FeedRecordModel {
  const _$FeedRecordModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'animal_id') this.animalId,
    @JsonKey(name: 'feed_type') required this.feedTypeId,
    @JsonKey(name: 'quantity_kg') required this.quantityKg,
    required this.cost,
    @JsonKey(name: 'recorded_at') required this.recordedAt,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$FeedRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedRecordModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'animal_id')
  final String? animalId;
  // Null means farm-wide
  @override
  @JsonKey(name: 'feed_type')
  final String feedTypeId;
  @override
  @JsonKey(name: 'quantity_kg')
  final double quantityKg;
  @override
  final double cost;
  @override
  @JsonKey(name: 'recorded_at')
  final DateTime recordedAt;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'FeedRecordModel(id: $id, farmId: $farmId, animalId: $animalId, feedTypeId: $feedTypeId, quantityKg: $quantityKg, cost: $cost, recordedAt: $recordedAt, recordedBy: $recordedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.animalId, animalId) ||
                other.animalId == animalId) &&
            (identical(other.feedTypeId, feedTypeId) ||
                other.feedTypeId == feedTypeId) &&
            (identical(other.quantityKg, quantityKg) ||
                other.quantityKg == quantityKg) &&
            (identical(other.cost, cost) || other.cost == cost) &&
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
    animalId,
    feedTypeId,
    quantityKg,
    cost,
    recordedAt,
    recordedBy,
    createdAt,
  );

  /// Create a copy of FeedRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedRecordModelImplCopyWith<_$FeedRecordModelImpl> get copyWith =>
      __$$FeedRecordModelImplCopyWithImpl<_$FeedRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedRecordModelImplToJson(this);
  }
}

abstract class _FeedRecordModel implements FeedRecordModel {
  const factory _FeedRecordModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'animal_id') final String? animalId,
    @JsonKey(name: 'feed_type') required final String feedTypeId,
    @JsonKey(name: 'quantity_kg') required final double quantityKg,
    required final double cost,
    @JsonKey(name: 'recorded_at') required final DateTime recordedAt,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$FeedRecordModelImpl;

  factory _FeedRecordModel.fromJson(Map<String, dynamic> json) =
      _$FeedRecordModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'animal_id')
  String? get animalId; // Null means farm-wide
  @override
  @JsonKey(name: 'feed_type')
  String get feedTypeId;
  @override
  @JsonKey(name: 'quantity_kg')
  double get quantityKg;
  @override
  double get cost;
  @override
  @JsonKey(name: 'recorded_at')
  DateTime get recordedAt;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of FeedRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedRecordModelImplCopyWith<_$FeedRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
