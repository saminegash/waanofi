// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'egg_production_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EggProductionRecordModel _$EggProductionRecordModelFromJson(
  Map<String, dynamic> json,
) {
  return _EggProductionRecordModel.fromJson(json);
}

/// @nodoc
mixin _$EggProductionRecordModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'flock_id')
  String get flockId => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get productionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'good_eggs')
  int get goodEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'cracked_eggs')
  int get crackedEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejected_eggs')
  int get rejectedEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_use_eggs')
  int get farmUseEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'sold_directly_eggs')
  int get soldDirectlyEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_eggs')
  int get availableEggs => throw _privateConstructorUsedError;
  @JsonKey(name: 'recorded_by')
  String? get recordedBy => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EggProductionRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EggProductionRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EggProductionRecordModelCopyWith<EggProductionRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EggProductionRecordModelCopyWith<$Res> {
  factory $EggProductionRecordModelCopyWith(
    EggProductionRecordModel value,
    $Res Function(EggProductionRecordModel) then,
  ) = _$EggProductionRecordModelCopyWithImpl<$Res, EggProductionRecordModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_id') String flockId,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    DateTime productionDate,
    @JsonKey(name: 'good_eggs') int goodEggs,
    @JsonKey(name: 'cracked_eggs') int crackedEggs,
    @JsonKey(name: 'rejected_eggs') int rejectedEggs,
    @JsonKey(name: 'farm_use_eggs') int farmUseEggs,
    @JsonKey(name: 'sold_directly_eggs') int soldDirectlyEggs,
    @JsonKey(name: 'available_eggs') int availableEggs,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    String? notes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$EggProductionRecordModelCopyWithImpl<
  $Res,
  $Val extends EggProductionRecordModel
>
    implements $EggProductionRecordModelCopyWith<$Res> {
  _$EggProductionRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EggProductionRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockId = null,
    Object? productionDate = null,
    Object? goodEggs = null,
    Object? crackedEggs = null,
    Object? rejectedEggs = null,
    Object? farmUseEggs = null,
    Object? soldDirectlyEggs = null,
    Object? availableEggs = null,
    Object? recordedBy = freezed,
    Object? notes = freezed,
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
            flockId: null == flockId
                ? _value.flockId
                : flockId // ignore: cast_nullable_to_non_nullable
                      as String,
            productionDate: null == productionDate
                ? _value.productionDate
                : productionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            goodEggs: null == goodEggs
                ? _value.goodEggs
                : goodEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            crackedEggs: null == crackedEggs
                ? _value.crackedEggs
                : crackedEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            rejectedEggs: null == rejectedEggs
                ? _value.rejectedEggs
                : rejectedEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            farmUseEggs: null == farmUseEggs
                ? _value.farmUseEggs
                : farmUseEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            soldDirectlyEggs: null == soldDirectlyEggs
                ? _value.soldDirectlyEggs
                : soldDirectlyEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            availableEggs: null == availableEggs
                ? _value.availableEggs
                : availableEggs // ignore: cast_nullable_to_non_nullable
                      as int,
            recordedBy: freezed == recordedBy
                ? _value.recordedBy
                : recordedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EggProductionRecordModelImplCopyWith<$Res>
    implements $EggProductionRecordModelCopyWith<$Res> {
  factory _$$EggProductionRecordModelImplCopyWith(
    _$EggProductionRecordModelImpl value,
    $Res Function(_$EggProductionRecordModelImpl) then,
  ) = __$$EggProductionRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'flock_id') String flockId,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    DateTime productionDate,
    @JsonKey(name: 'good_eggs') int goodEggs,
    @JsonKey(name: 'cracked_eggs') int crackedEggs,
    @JsonKey(name: 'rejected_eggs') int rejectedEggs,
    @JsonKey(name: 'farm_use_eggs') int farmUseEggs,
    @JsonKey(name: 'sold_directly_eggs') int soldDirectlyEggs,
    @JsonKey(name: 'available_eggs') int availableEggs,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    String? notes,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$EggProductionRecordModelImplCopyWithImpl<$Res>
    extends
        _$EggProductionRecordModelCopyWithImpl<
          $Res,
          _$EggProductionRecordModelImpl
        >
    implements _$$EggProductionRecordModelImplCopyWith<$Res> {
  __$$EggProductionRecordModelImplCopyWithImpl(
    _$EggProductionRecordModelImpl _value,
    $Res Function(_$EggProductionRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EggProductionRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? flockId = null,
    Object? productionDate = null,
    Object? goodEggs = null,
    Object? crackedEggs = null,
    Object? rejectedEggs = null,
    Object? farmUseEggs = null,
    Object? soldDirectlyEggs = null,
    Object? availableEggs = null,
    Object? recordedBy = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$EggProductionRecordModelImpl(
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
        productionDate: null == productionDate
            ? _value.productionDate
            : productionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        goodEggs: null == goodEggs
            ? _value.goodEggs
            : goodEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        crackedEggs: null == crackedEggs
            ? _value.crackedEggs
            : crackedEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        rejectedEggs: null == rejectedEggs
            ? _value.rejectedEggs
            : rejectedEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        farmUseEggs: null == farmUseEggs
            ? _value.farmUseEggs
            : farmUseEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        soldDirectlyEggs: null == soldDirectlyEggs
            ? _value.soldDirectlyEggs
            : soldDirectlyEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        availableEggs: null == availableEggs
            ? _value.availableEggs
            : availableEggs // ignore: cast_nullable_to_non_nullable
                  as int,
        recordedBy: freezed == recordedBy
            ? _value.recordedBy
            : recordedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
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
class _$EggProductionRecordModelImpl implements _EggProductionRecordModel {
  const _$EggProductionRecordModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'flock_id') required this.flockId,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    required this.productionDate,
    @JsonKey(name: 'good_eggs') this.goodEggs = 0,
    @JsonKey(name: 'cracked_eggs') this.crackedEggs = 0,
    @JsonKey(name: 'rejected_eggs') this.rejectedEggs = 0,
    @JsonKey(name: 'farm_use_eggs') this.farmUseEggs = 0,
    @JsonKey(name: 'sold_directly_eggs') this.soldDirectlyEggs = 0,
    @JsonKey(name: 'available_eggs') this.availableEggs = 0,
    @JsonKey(name: 'recorded_by') this.recordedBy,
    this.notes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$EggProductionRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EggProductionRecordModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'flock_id')
  final String flockId;
  @override
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime productionDate;
  @override
  @JsonKey(name: 'good_eggs')
  final int goodEggs;
  @override
  @JsonKey(name: 'cracked_eggs')
  final int crackedEggs;
  @override
  @JsonKey(name: 'rejected_eggs')
  final int rejectedEggs;
  @override
  @JsonKey(name: 'farm_use_eggs')
  final int farmUseEggs;
  @override
  @JsonKey(name: 'sold_directly_eggs')
  final int soldDirectlyEggs;
  @override
  @JsonKey(name: 'available_eggs')
  final int availableEggs;
  @override
  @JsonKey(name: 'recorded_by')
  final String? recordedBy;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EggProductionRecordModel(id: $id, farmId: $farmId, flockId: $flockId, productionDate: $productionDate, goodEggs: $goodEggs, crackedEggs: $crackedEggs, rejectedEggs: $rejectedEggs, farmUseEggs: $farmUseEggs, soldDirectlyEggs: $soldDirectlyEggs, availableEggs: $availableEggs, recordedBy: $recordedBy, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EggProductionRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.flockId, flockId) || other.flockId == flockId) &&
            (identical(other.productionDate, productionDate) ||
                other.productionDate == productionDate) &&
            (identical(other.goodEggs, goodEggs) ||
                other.goodEggs == goodEggs) &&
            (identical(other.crackedEggs, crackedEggs) ||
                other.crackedEggs == crackedEggs) &&
            (identical(other.rejectedEggs, rejectedEggs) ||
                other.rejectedEggs == rejectedEggs) &&
            (identical(other.farmUseEggs, farmUseEggs) ||
                other.farmUseEggs == farmUseEggs) &&
            (identical(other.soldDirectlyEggs, soldDirectlyEggs) ||
                other.soldDirectlyEggs == soldDirectlyEggs) &&
            (identical(other.availableEggs, availableEggs) ||
                other.availableEggs == availableEggs) &&
            (identical(other.recordedBy, recordedBy) ||
                other.recordedBy == recordedBy) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    flockId,
    productionDate,
    goodEggs,
    crackedEggs,
    rejectedEggs,
    farmUseEggs,
    soldDirectlyEggs,
    availableEggs,
    recordedBy,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of EggProductionRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EggProductionRecordModelImplCopyWith<_$EggProductionRecordModelImpl>
  get copyWith =>
      __$$EggProductionRecordModelImplCopyWithImpl<
        _$EggProductionRecordModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EggProductionRecordModelImplToJson(this);
  }
}

abstract class _EggProductionRecordModel implements EggProductionRecordModel {
  const factory _EggProductionRecordModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'flock_id') required final String flockId,
    @JsonKey(
      name: 'production_date',
      fromJson: dateFromJson,
      toJson: dateToJson,
    )
    required final DateTime productionDate,
    @JsonKey(name: 'good_eggs') final int goodEggs,
    @JsonKey(name: 'cracked_eggs') final int crackedEggs,
    @JsonKey(name: 'rejected_eggs') final int rejectedEggs,
    @JsonKey(name: 'farm_use_eggs') final int farmUseEggs,
    @JsonKey(name: 'sold_directly_eggs') final int soldDirectlyEggs,
    @JsonKey(name: 'available_eggs') final int availableEggs,
    @JsonKey(name: 'recorded_by') final String? recordedBy,
    final String? notes,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$EggProductionRecordModelImpl;

  factory _EggProductionRecordModel.fromJson(Map<String, dynamic> json) =
      _$EggProductionRecordModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'flock_id')
  String get flockId;
  @override
  @JsonKey(name: 'production_date', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get productionDate;
  @override
  @JsonKey(name: 'good_eggs')
  int get goodEggs;
  @override
  @JsonKey(name: 'cracked_eggs')
  int get crackedEggs;
  @override
  @JsonKey(name: 'rejected_eggs')
  int get rejectedEggs;
  @override
  @JsonKey(name: 'farm_use_eggs')
  int get farmUseEggs;
  @override
  @JsonKey(name: 'sold_directly_eggs')
  int get soldDirectlyEggs;
  @override
  @JsonKey(name: 'available_eggs')
  int get availableEggs;
  @override
  @JsonKey(name: 'recorded_by')
  String? get recordedBy;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of EggProductionRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EggProductionRecordModelImplCopyWith<_$EggProductionRecordModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
