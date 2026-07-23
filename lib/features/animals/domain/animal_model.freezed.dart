// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnimalModel _$AnimalModelFromJson(Map<String, dynamic> json) {
  return _AnimalModel.fromJson(json);
}

/// @nodoc
mixin _$AnimalModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_number')
  String get tagNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  DateTime? get dob => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AnimalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimalModelCopyWith<AnimalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalModelCopyWith<$Res> {
  factory $AnimalModelCopyWith(
    AnimalModel value,
    $Res Function(AnimalModel) then,
  ) = _$AnimalModelCopyWithImpl<$Res, AnimalModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'tag_number') String tagNumber,
    String? name,
    String? breed,
    String sex,
    DateTime? dob,
    String status,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class _$AnimalModelCopyWithImpl<$Res, $Val extends AnimalModel>
    implements $AnimalModelCopyWith<$Res> {
  _$AnimalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tagNumber = null,
    Object? name = freezed,
    Object? breed = freezed,
    Object? sex = null,
    Object? dob = freezed,
    Object? status = null,
    Object? photoUrl = freezed,
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
            tagNumber: null == tagNumber
                ? _value.tagNumber
                : tagNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            breed: freezed == breed
                ? _value.breed
                : breed // ignore: cast_nullable_to_non_nullable
                      as String?,
            sex: null == sex
                ? _value.sex
                : sex // ignore: cast_nullable_to_non_nullable
                      as String,
            dob: freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AnimalModelImplCopyWith<$Res>
    implements $AnimalModelCopyWith<$Res> {
  factory _$$AnimalModelImplCopyWith(
    _$AnimalModelImpl value,
    $Res Function(_$AnimalModelImpl) then,
  ) = __$$AnimalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'tag_number') String tagNumber,
    String? name,
    String? breed,
    String sex,
    DateTime? dob,
    String status,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  });
}

/// @nodoc
class __$$AnimalModelImplCopyWithImpl<$Res>
    extends _$AnimalModelCopyWithImpl<$Res, _$AnimalModelImpl>
    implements _$$AnimalModelImplCopyWith<$Res> {
  __$$AnimalModelImplCopyWithImpl(
    _$AnimalModelImpl _value,
    $Res Function(_$AnimalModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tagNumber = null,
    Object? name = freezed,
    Object? breed = freezed,
    Object? sex = null,
    Object? dob = freezed,
    Object? status = null,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$AnimalModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        tagNumber: null == tagNumber
            ? _value.tagNumber
            : tagNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        breed: freezed == breed
            ? _value.breed
            : breed // ignore: cast_nullable_to_non_nullable
                  as String?,
        sex: null == sex
            ? _value.sex
            : sex // ignore: cast_nullable_to_non_nullable
                  as String,
        dob: freezed == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
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
class _$AnimalModelImpl implements _AnimalModel {
  const _$AnimalModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'tag_number') required this.tagNumber,
    this.name,
    this.breed,
    required this.sex,
    this.dob,
    required this.status,
    @JsonKey(name: 'photo_url') this.photoUrl,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$AnimalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimalModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'tag_number')
  final String tagNumber;
  @override
  final String? name;
  @override
  final String? breed;
  @override
  final String sex;
  @override
  final DateTime? dob;
  @override
  final String status;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AnimalModel(id: $id, farmId: $farmId, tagNumber: $tagNumber, name: $name, breed: $breed, sex: $sex, dob: $dob, status: $status, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimalModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
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
    tagNumber,
    name,
    breed,
    sex,
    dob,
    status,
    photoUrl,
    createdAt,
    updatedAt,
  );

  /// Create a copy of AnimalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimalModelImplCopyWith<_$AnimalModelImpl> get copyWith =>
      __$$AnimalModelImplCopyWithImpl<_$AnimalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimalModelImplToJson(this);
  }
}

abstract class _AnimalModel implements AnimalModel {
  const factory _AnimalModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'tag_number') required final String tagNumber,
    final String? name,
    final String? breed,
    required final String sex,
    final DateTime? dob,
    required final String status,
    @JsonKey(name: 'photo_url') final String? photoUrl,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'updated_at') required final DateTime updatedAt,
  }) = _$AnimalModelImpl;

  factory _AnimalModel.fromJson(Map<String, dynamic> json) =
      _$AnimalModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'tag_number')
  String get tagNumber;
  @override
  String? get name;
  @override
  String? get breed;
  @override
  String get sex;
  @override
  DateTime? get dob;
  @override
  String get status;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of AnimalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimalModelImplCopyWith<_$AnimalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
