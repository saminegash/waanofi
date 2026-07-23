// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedTypeModel _$FeedTypeModelFromJson(Map<String, dynamic> json) {
  return _FeedTypeModel.fromJson(json);
}

/// @nodoc
mixin _$FeedTypeModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_cost')
  double get unitCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeedTypeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedTypeModelCopyWith<FeedTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedTypeModelCopyWith<$Res> {
  factory $FeedTypeModelCopyWith(
    FeedTypeModel value,
    $Res Function(FeedTypeModel) then,
  ) = _$FeedTypeModelCopyWithImpl<$Res, FeedTypeModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    String name,
    String unit,
    @JsonKey(name: 'unit_cost') double unitCost,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$FeedTypeModelCopyWithImpl<$Res, $Val extends FeedTypeModel>
    implements $FeedTypeModelCopyWith<$Res> {
  _$FeedTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? name = null,
    Object? unit = null,
    Object? unitCost = null,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            unitCost: null == unitCost
                ? _value.unitCost
                : unitCost // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$FeedTypeModelImplCopyWith<$Res>
    implements $FeedTypeModelCopyWith<$Res> {
  factory _$$FeedTypeModelImplCopyWith(
    _$FeedTypeModelImpl value,
    $Res Function(_$FeedTypeModelImpl) then,
  ) = __$$FeedTypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    String name,
    String unit,
    @JsonKey(name: 'unit_cost') double unitCost,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$FeedTypeModelImplCopyWithImpl<$Res>
    extends _$FeedTypeModelCopyWithImpl<$Res, _$FeedTypeModelImpl>
    implements _$$FeedTypeModelImplCopyWith<$Res> {
  __$$FeedTypeModelImplCopyWithImpl(
    _$FeedTypeModelImpl _value,
    $Res Function(_$FeedTypeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? name = null,
    Object? unit = null,
    Object? unitCost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$FeedTypeModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        unitCost: null == unitCost
            ? _value.unitCost
            : unitCost // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$FeedTypeModelImpl implements _FeedTypeModel {
  const _$FeedTypeModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    required this.name,
    required this.unit,
    @JsonKey(name: 'unit_cost') required this.unitCost,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$FeedTypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedTypeModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  final String name;
  @override
  final String unit;
  @override
  @JsonKey(name: 'unit_cost')
  final double unitCost;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FeedTypeModel(id: $id, farmId: $farmId, name: $name, unit: $unit, unitCost: $unitCost, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedTypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitCost, unitCost) ||
                other.unitCost == unitCost) &&
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
    name,
    unit,
    unitCost,
    createdAt,
    updatedAt,
  );

  /// Create a copy of FeedTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedTypeModelImplCopyWith<_$FeedTypeModelImpl> get copyWith =>
      __$$FeedTypeModelImplCopyWithImpl<_$FeedTypeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedTypeModelImplToJson(this);
  }
}

abstract class _FeedTypeModel implements FeedTypeModel {
  const factory _FeedTypeModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    required final String name,
    required final String unit,
    @JsonKey(name: 'unit_cost') required final double unitCost,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$FeedTypeModelImpl;

  factory _FeedTypeModel.fromJson(Map<String, dynamic> json) =
      _$FeedTypeModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  String get name;
  @override
  String get unit;
  @override
  @JsonKey(name: 'unit_cost')
  double get unitCost;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of FeedTypeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedTypeModelImplCopyWith<_$FeedTypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
