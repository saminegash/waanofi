// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FlockModel _$FlockModelFromJson(Map<String, dynamic> json) {
  return _FlockModel.fromJson(json);
}

/// @nodoc
mixin _$FlockModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flock_code')
  String get flockCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  FlockPurpose get purpose => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_birds')
  int get numberOfBirds => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_laying_hens')
  int get numberOfLayingHens => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get arrivalDate => throw _privateConstructorUsedError;
  @JsonKey(
    name: 'hatch_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get hatchDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'housing_type')
  String? get housingType => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  FlockStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this FlockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlockModelCopyWith<FlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlockModelCopyWith<$Res> {
  factory $FlockModelCopyWith(
    FlockModel value,
    $Res Function(FlockModel) then,
  ) = _$FlockModelCopyWithImpl<$Res, FlockModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_code') String flockCode,
    String name,
    String breed,
    FlockPurpose purpose,
    @JsonKey(name: 'number_of_birds') int numberOfBirds,
    @JsonKey(name: 'number_of_laying_hens') int numberOfLayingHens,
    @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
    DateTime arrivalDate,
    @JsonKey(
      name: 'hatch_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? hatchDate,
    @JsonKey(name: 'housing_type') String? housingType,
    String? source,
    FlockStatus status,
    String? notes,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  });
}

/// @nodoc
class _$FlockModelCopyWithImpl<$Res, $Val extends FlockModel>
    implements $FlockModelCopyWith<$Res> {
  _$FlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockCode = null,
    Object? name = null,
    Object? breed = null,
    Object? purpose = null,
    Object? numberOfBirds = null,
    Object? numberOfLayingHens = null,
    Object? arrivalDate = null,
    Object? hatchDate = freezed,
    Object? housingType = freezed,
    Object? source = freezed,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
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
            flockCode: null == flockCode
                ? _value.flockCode
                : flockCode // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            breed: null == breed
                ? _value.breed
                : breed // ignore: cast_nullable_to_non_nullable
                      as String,
            purpose: null == purpose
                ? _value.purpose
                : purpose // ignore: cast_nullable_to_non_nullable
                      as FlockPurpose,
            numberOfBirds: null == numberOfBirds
                ? _value.numberOfBirds
                : numberOfBirds // ignore: cast_nullable_to_non_nullable
                      as int,
            numberOfLayingHens: null == numberOfLayingHens
                ? _value.numberOfLayingHens
                : numberOfLayingHens // ignore: cast_nullable_to_non_nullable
                      as int,
            arrivalDate: null == arrivalDate
                ? _value.arrivalDate
                : arrivalDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            hatchDate: freezed == hatchDate
                ? _value.hatchDate
                : hatchDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            housingType: freezed == housingType
                ? _value.housingType
                : housingType // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FlockStatus,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FlockModelImplCopyWith<$Res>
    implements $FlockModelCopyWith<$Res> {
  factory _$$FlockModelImplCopyWith(
    _$FlockModelImpl value,
    $Res Function(_$FlockModelImpl) then,
  ) = __$$FlockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_code') String flockCode,
    String name,
    String breed,
    FlockPurpose purpose,
    @JsonKey(name: 'number_of_birds') int numberOfBirds,
    @JsonKey(name: 'number_of_laying_hens') int numberOfLayingHens,
    @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
    DateTime arrivalDate,
    @JsonKey(
      name: 'hatch_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    DateTime? hatchDate,
    @JsonKey(name: 'housing_type') String? housingType,
    String? source,
    FlockStatus status,
    String? notes,
    @JsonKey(name: 'created_by') String? createdBy,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  });
}

/// @nodoc
class __$$FlockModelImplCopyWithImpl<$Res>
    extends _$FlockModelCopyWithImpl<$Res, _$FlockModelImpl>
    implements _$$FlockModelImplCopyWith<$Res> {
  __$$FlockModelImplCopyWithImpl(
    _$FlockModelImpl _value,
    $Res Function(_$FlockModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockCode = null,
    Object? name = null,
    Object? breed = null,
    Object? purpose = null,
    Object? numberOfBirds = null,
    Object? numberOfLayingHens = null,
    Object? arrivalDate = null,
    Object? hatchDate = freezed,
    Object? housingType = freezed,
    Object? source = freezed,
    Object? status = null,
    Object? notes = freezed,
    Object? createdBy = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$FlockModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        flockCode: null == flockCode
            ? _value.flockCode
            : flockCode // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        breed: null == breed
            ? _value.breed
            : breed // ignore: cast_nullable_to_non_nullable
                  as String,
        purpose: null == purpose
            ? _value.purpose
            : purpose // ignore: cast_nullable_to_non_nullable
                  as FlockPurpose,
        numberOfBirds: null == numberOfBirds
            ? _value.numberOfBirds
            : numberOfBirds // ignore: cast_nullable_to_non_nullable
                  as int,
        numberOfLayingHens: null == numberOfLayingHens
            ? _value.numberOfLayingHens
            : numberOfLayingHens // ignore: cast_nullable_to_non_nullable
                  as int,
        arrivalDate: null == arrivalDate
            ? _value.arrivalDate
            : arrivalDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        hatchDate: freezed == hatchDate
            ? _value.hatchDate
            : hatchDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        housingType: freezed == housingType
            ? _value.housingType
            : housingType // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FlockStatus,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FlockModelImpl implements _FlockModel {
  const _$FlockModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'flock_code') required this.flockCode,
    required this.name,
    required this.breed,
    this.purpose = FlockPurpose.layers,
    @JsonKey(name: 'number_of_birds') this.numberOfBirds = 0,
    @JsonKey(name: 'number_of_laying_hens') this.numberOfLayingHens = 0,
    @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
    required this.arrivalDate,
    @JsonKey(
      name: 'hatch_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    this.hatchDate,
    @JsonKey(name: 'housing_type') this.housingType,
    this.source,
    this.status = FlockStatus.active,
    this.notes,
    @JsonKey(name: 'created_by') this.createdBy,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'deleted_at') this.deletedAt,
  });

  factory _$FlockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlockModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'flock_code')
  final String flockCode;
  @override
  final String name;
  @override
  final String breed;
  @override
  @JsonKey()
  final FlockPurpose purpose;
  @override
  @JsonKey(name: 'number_of_birds')
  final int numberOfBirds;
  @override
  @JsonKey(name: 'number_of_laying_hens')
  final int numberOfLayingHens;
  @override
  @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime arrivalDate;
  @override
  @JsonKey(
    name: 'hatch_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  final DateTime? hatchDate;
  @override
  @JsonKey(name: 'housing_type')
  final String? housingType;
  @override
  final String? source;
  @override
  @JsonKey()
  final FlockStatus status;
  @override
  final String? notes;
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
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'FlockModel(id: $id, farmId: $farmId, flockCode: $flockCode, name: $name, breed: $breed, purpose: $purpose, numberOfBirds: $numberOfBirds, numberOfLayingHens: $numberOfLayingHens, arrivalDate: $arrivalDate, hatchDate: $hatchDate, housingType: $housingType, source: $source, status: $status, notes: $notes, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlockModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.flockCode, flockCode) ||
                other.flockCode == flockCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.numberOfBirds, numberOfBirds) ||
                other.numberOfBirds == numberOfBirds) &&
            (identical(other.numberOfLayingHens, numberOfLayingHens) ||
                other.numberOfLayingHens == numberOfLayingHens) &&
            (identical(other.arrivalDate, arrivalDate) ||
                other.arrivalDate == arrivalDate) &&
            (identical(other.hatchDate, hatchDate) ||
                other.hatchDate == hatchDate) &&
            (identical(other.housingType, housingType) ||
                other.housingType == housingType) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    farmId,
    flockCode,
    name,
    breed,
    purpose,
    numberOfBirds,
    numberOfLayingHens,
    arrivalDate,
    hatchDate,
    housingType,
    source,
    status,
    notes,
    createdBy,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of FlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlockModelImplCopyWith<_$FlockModelImpl> get copyWith =>
      __$$FlockModelImplCopyWithImpl<_$FlockModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlockModelImplToJson(this);
  }
}

abstract class _FlockModel implements FlockModel {
  const factory _FlockModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'flock_code') required final String flockCode,
    required final String name,
    required final String breed,
    final FlockPurpose purpose,
    @JsonKey(name: 'number_of_birds') final int numberOfBirds,
    @JsonKey(name: 'number_of_laying_hens') final int numberOfLayingHens,
    @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime arrivalDate,
    @JsonKey(
      name: 'hatch_date',
      fromJson: nullableDateFromJson,
      toJson: nullableDateToJson,
    )
    final DateTime? hatchDate,
    @JsonKey(name: 'housing_type') final String? housingType,
    final String? source,
    final FlockStatus status,
    final String? notes,
    @JsonKey(name: 'created_by') final String? createdBy,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
    @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
  }) = _$FlockModelImpl;

  factory _FlockModel.fromJson(Map<String, dynamic> json) =
      _$FlockModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'flock_code')
  String get flockCode;
  @override
  String get name;
  @override
  String get breed;
  @override
  FlockPurpose get purpose;
  @override
  @JsonKey(name: 'number_of_birds')
  int get numberOfBirds;
  @override
  @JsonKey(name: 'number_of_laying_hens')
  int get numberOfLayingHens;
  @override
  @JsonKey(name: 'arrival_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get arrivalDate;
  @override
  @JsonKey(
    name: 'hatch_date',
    fromJson: nullableDateFromJson,
    toJson: nullableDateToJson,
  )
  DateTime? get hatchDate;
  @override
  @JsonKey(name: 'housing_type')
  String? get housingType;
  @override
  String? get source;
  @override
  FlockStatus get status;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_by')
  String? get createdBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;

  /// Create a copy of FlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlockModelImplCopyWith<_$FlockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
