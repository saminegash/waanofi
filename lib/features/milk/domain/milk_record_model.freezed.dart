// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milk_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MilkRecordModel _$MilkRecordModelFromJson(Map<String, dynamic> json) {
  return _MilkRecordModel.fromJson(json);
}

/// @nodoc
mixin _$MilkRecordModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'animal_id')
  String get animalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt => throw _privateConstructorUsedError;
  MilkSession get session => throw _privateConstructorUsedError;
  double get litres => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MilkRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MilkRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MilkRecordModelCopyWith<MilkRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilkRecordModelCopyWith<$Res> {
  factory $MilkRecordModelCopyWith(
    MilkRecordModel value,
    $Res Function(MilkRecordModel) then,
  ) = _$MilkRecordModelCopyWithImpl<$Res, MilkRecordModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'animal_id') String animalId,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    MilkSession session,
    double litres,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class _$MilkRecordModelCopyWithImpl<$Res, $Val extends MilkRecordModel>
    implements $MilkRecordModelCopyWith<$Res> {
  _$MilkRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MilkRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? animalId = null,
    Object? recordedAt = null,
    Object? session = null,
    Object? litres = null,
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
            animalId: null == animalId
                ? _value.animalId
                : animalId // ignore: cast_nullable_to_non_nullable
                      as String,
            recordedAt: null == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            session: null == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                      as MilkSession,
            litres: null == litres
                ? _value.litres
                : litres // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$MilkRecordModelImplCopyWith<$Res>
    implements $MilkRecordModelCopyWith<$Res> {
  factory _$$MilkRecordModelImplCopyWith(
    _$MilkRecordModelImpl value,
    $Res Function(_$MilkRecordModelImpl) then,
  ) = __$$MilkRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'animal_id') String animalId,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime recordedAt,
    MilkSession session,
    double litres,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
  });
}

/// @nodoc
class __$$MilkRecordModelImplCopyWithImpl<$Res>
    extends _$MilkRecordModelCopyWithImpl<$Res, _$MilkRecordModelImpl>
    implements _$$MilkRecordModelImplCopyWith<$Res> {
  __$$MilkRecordModelImplCopyWithImpl(
    _$MilkRecordModelImpl _value,
    $Res Function(_$MilkRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MilkRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? animalId = null,
    Object? recordedAt = null,
    Object? session = null,
    Object? litres = null,
    Object? recordedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$MilkRecordModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        animalId: null == animalId
            ? _value.animalId
            : animalId // ignore: cast_nullable_to_non_nullable
                  as String,
        recordedAt: null == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        session: null == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as MilkSession,
        litres: null == litres
            ? _value.litres
            : litres // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$MilkRecordModelImpl implements _MilkRecordModel {
  const _$MilkRecordModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'animal_id') required this.animalId,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.recordedAt,
    required this.session,
    required this.litres,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    @JsonKey(name: 'created_at') required this.createdAt,
  });

  factory _$MilkRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MilkRecordModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'animal_id')
  final String animalId;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime recordedAt;
  @override
  final MilkSession session;
  @override
  final double litres;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'MilkRecordModel(id: $id, farmId: $farmId, animalId: $animalId, recordedAt: $recordedAt, session: $session, litres: $litres, recordedBy: $recordedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MilkRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.animalId, animalId) ||
                other.animalId == animalId) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.litres, litres) || other.litres == litres) &&
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
    recordedAt,
    session,
    litres,
    recordedBy,
    createdAt,
  );

  /// Create a copy of MilkRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MilkRecordModelImplCopyWith<_$MilkRecordModelImpl> get copyWith =>
      __$$MilkRecordModelImplCopyWithImpl<_$MilkRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MilkRecordModelImplToJson(this);
  }
}

abstract class _MilkRecordModel implements MilkRecordModel {
  const factory _MilkRecordModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'animal_id') required final String animalId,
    @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime recordedAt,
    required final MilkSession session,
    required final double litres,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
  }) = _$MilkRecordModelImpl;

  factory _MilkRecordModel.fromJson(Map<String, dynamic> json) =
      _$MilkRecordModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'animal_id')
  String get animalId;
  @override
  @JsonKey(name: 'recorded_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get recordedAt;
  @override
  MilkSession get session;
  @override
  double get litres;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of MilkRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MilkRecordModelImplCopyWith<_$MilkRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
