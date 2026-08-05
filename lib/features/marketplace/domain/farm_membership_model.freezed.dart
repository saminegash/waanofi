// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_membership_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FarmMembershipModel _$FarmMembershipModelFromJson(Map<String, dynamic> json) {
  return _FarmMembershipModel.fromJson(json);
}

/// @nodoc
mixin _$FarmMembershipModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'membership_role')
  MembershipRole get membershipRole => throw _privateConstructorUsedError;
  MembershipStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'invited_by')
  String? get invitedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get joinedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FarmMembershipModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmMembershipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmMembershipModelCopyWith<FarmMembershipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmMembershipModelCopyWith<$Res> {
  factory $FarmMembershipModelCopyWith(
    FarmMembershipModel value,
    $Res Function(FarmMembershipModel) then,
  ) = _$FarmMembershipModelCopyWithImpl<$Res, FarmMembershipModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'membership_role') MembershipRole membershipRole,
    MembershipStatus status,
    @JsonKey(name: 'invited_by') String? invitedBy,
    @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime joinedAt,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class _$FarmMembershipModelCopyWithImpl<$Res, $Val extends FarmMembershipModel>
    implements $FarmMembershipModelCopyWith<$Res> {
  _$FarmMembershipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmMembershipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? farmId = null,
    Object? membershipRole = null,
    Object? status = null,
    Object? invitedBy = freezed,
    Object? joinedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            farmId: null == farmId
                ? _value.farmId
                : farmId // ignore: cast_nullable_to_non_nullable
                      as String,
            membershipRole: null == membershipRole
                ? _value.membershipRole
                : membershipRole // ignore: cast_nullable_to_non_nullable
                      as MembershipRole,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as MembershipStatus,
            invitedBy: freezed == invitedBy
                ? _value.invitedBy
                : invitedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
abstract class _$$FarmMembershipModelImplCopyWith<$Res>
    implements $FarmMembershipModelCopyWith<$Res> {
  factory _$$FarmMembershipModelImplCopyWith(
    _$FarmMembershipModelImpl value,
    $Res Function(_$FarmMembershipModelImpl) then,
  ) = __$$FarmMembershipModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'membership_role') MembershipRole membershipRole,
    MembershipStatus status,
    @JsonKey(name: 'invited_by') String? invitedBy,
    @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime joinedAt,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$FarmMembershipModelImplCopyWithImpl<$Res>
    extends _$FarmMembershipModelCopyWithImpl<$Res, _$FarmMembershipModelImpl>
    implements _$$FarmMembershipModelImplCopyWith<$Res> {
  __$$FarmMembershipModelImplCopyWithImpl(
    _$FarmMembershipModelImpl _value,
    $Res Function(_$FarmMembershipModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FarmMembershipModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? farmId = null,
    Object? membershipRole = null,
    Object? status = null,
    Object? invitedBy = freezed,
    Object? joinedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$FarmMembershipModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        membershipRole: null == membershipRole
            ? _value.membershipRole
            : membershipRole // ignore: cast_nullable_to_non_nullable
                  as MembershipRole,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MembershipStatus,
        invitedBy: freezed == invitedBy
            ? _value.invitedBy
            : invitedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$FarmMembershipModelImpl implements _FarmMembershipModel {
  const _$FarmMembershipModelImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'membership_role')
    this.membershipRole = MembershipRole.worker,
    this.status = MembershipStatus.active,
    @JsonKey(name: 'invited_by') this.invitedBy,
    @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.joinedAt,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
  });

  factory _$FarmMembershipModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmMembershipModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'membership_role')
  final MembershipRole membershipRole;
  @override
  @JsonKey()
  final MembershipStatus status;
  @override
  @JsonKey(name: 'invited_by')
  final String? invitedBy;
  @override
  @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime joinedAt;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FarmMembershipModel(id: $id, userId: $userId, farmId: $farmId, membershipRole: $membershipRole, status: $status, invitedBy: $invitedBy, joinedAt: $joinedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmMembershipModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.membershipRole, membershipRole) ||
                other.membershipRole == membershipRole) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
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
    userId,
    farmId,
    membershipRole,
    status,
    invitedBy,
    joinedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of FarmMembershipModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmMembershipModelImplCopyWith<_$FarmMembershipModelImpl> get copyWith =>
      __$$FarmMembershipModelImplCopyWithImpl<_$FarmMembershipModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmMembershipModelImplToJson(this);
  }
}

abstract class _FarmMembershipModel implements FarmMembershipModel {
  const factory _FarmMembershipModel({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'membership_role') final MembershipRole membershipRole,
    final MembershipStatus status,
    @JsonKey(name: 'invited_by') final String? invitedBy,
    @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime joinedAt,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
  }) = _$FarmMembershipModelImpl;

  factory _FarmMembershipModel.fromJson(Map<String, dynamic> json) =
      _$FarmMembershipModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'membership_role')
  MembershipRole get membershipRole;
  @override
  MembershipStatus get status;
  @override
  @JsonKey(name: 'invited_by')
  String? get invitedBy;
  @override
  @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get joinedAt;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt;

  /// Create a copy of FarmMembershipModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmMembershipModelImplCopyWith<_$FarmMembershipModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
