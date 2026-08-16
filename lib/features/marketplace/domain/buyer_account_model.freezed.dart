// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BuyerAccountModel _$BuyerAccountModelFromJson(Map<String, dynamic> json) {
  return _BuyerAccountModel.fromJson(json);
}

/// @nodoc
mixin _$BuyerAccountModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_type')
  BuyerType get buyerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_name')
  String? get organizationName => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_name')
  String get contactName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_number')
  String? get taxNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BuyerAccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuyerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuyerAccountModelCopyWith<BuyerAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerAccountModelCopyWith<$Res> {
  factory $BuyerAccountModelCopyWith(
    BuyerAccountModel value,
    $Res Function(BuyerAccountModel) then,
  ) = _$BuyerAccountModelCopyWithImpl<$Res, BuyerAccountModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'buyer_type') BuyerType buyerType,
    @JsonKey(name: 'organization_name') String? organizationName,
    @JsonKey(name: 'contact_name') String contactName,
    String phone,
    String email,
    @JsonKey(name: 'tax_number') String? taxNumber,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'preferred_language') String preferredLanguage,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class _$BuyerAccountModelCopyWithImpl<$Res, $Val extends BuyerAccountModel>
    implements $BuyerAccountModelCopyWith<$Res> {
  _$BuyerAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuyerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? buyerType = null,
    Object? organizationName = freezed,
    Object? contactName = null,
    Object? phone = null,
    Object? email = null,
    Object? taxNumber = freezed,
    Object? verificationStatus = null,
    Object? preferredLanguage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            buyerType: null == buyerType
                ? _value.buyerType
                : buyerType // ignore: cast_nullable_to_non_nullable
                      as BuyerType,
            organizationName: freezed == organizationName
                ? _value.organizationName
                : organizationName // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactName: null == contactName
                ? _value.contactName
                : contactName // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            taxNumber: freezed == taxNumber
                ? _value.taxNumber
                : taxNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationStatus: null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            preferredLanguage: null == preferredLanguage
                ? _value.preferredLanguage
                : preferredLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$BuyerAccountModelImplCopyWith<$Res>
    implements $BuyerAccountModelCopyWith<$Res> {
  factory _$$BuyerAccountModelImplCopyWith(
    _$BuyerAccountModelImpl value,
    $Res Function(_$BuyerAccountModelImpl) then,
  ) = __$$BuyerAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'buyer_type') BuyerType buyerType,
    @JsonKey(name: 'organization_name') String? organizationName,
    @JsonKey(name: 'contact_name') String contactName,
    String phone,
    String email,
    @JsonKey(name: 'tax_number') String? taxNumber,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'preferred_language') String preferredLanguage,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$BuyerAccountModelImplCopyWithImpl<$Res>
    extends _$BuyerAccountModelCopyWithImpl<$Res, _$BuyerAccountModelImpl>
    implements _$$BuyerAccountModelImplCopyWith<$Res> {
  __$$BuyerAccountModelImplCopyWithImpl(
    _$BuyerAccountModelImpl _value,
    $Res Function(_$BuyerAccountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BuyerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? buyerType = null,
    Object? organizationName = freezed,
    Object? contactName = null,
    Object? phone = null,
    Object? email = null,
    Object? taxNumber = freezed,
    Object? verificationStatus = null,
    Object? preferredLanguage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$BuyerAccountModelImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        buyerType: null == buyerType
            ? _value.buyerType
            : buyerType // ignore: cast_nullable_to_non_nullable
                  as BuyerType,
        organizationName: freezed == organizationName
            ? _value.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactName: null == contactName
            ? _value.contactName
            : contactName // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        taxNumber: freezed == taxNumber
            ? _value.taxNumber
            : taxNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationStatus: null == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        preferredLanguage: null == preferredLanguage
            ? _value.preferredLanguage
            : preferredLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$BuyerAccountModelImpl implements _BuyerAccountModel {
  const _$BuyerAccountModelImpl({
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'buyer_type') this.buyerType = BuyerType.household,
    @JsonKey(name: 'organization_name') this.organizationName,
    @JsonKey(name: 'contact_name') required this.contactName,
    required this.phone,
    required this.email,
    @JsonKey(name: 'tax_number') this.taxNumber,
    @JsonKey(name: 'verification_status')
    this.verificationStatus = 'unverified',
    @JsonKey(name: 'preferred_language') this.preferredLanguage = 'en',
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
  });

  factory _$BuyerAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuyerAccountModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'buyer_type')
  final BuyerType buyerType;
  @override
  @JsonKey(name: 'organization_name')
  final String? organizationName;
  @override
  @JsonKey(name: 'contact_name')
  final String contactName;
  @override
  final String phone;
  @override
  final String email;
  @override
  @JsonKey(name: 'tax_number')
  final String? taxNumber;
  @override
  @JsonKey(name: 'verification_status')
  final String verificationStatus;
  @override
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BuyerAccountModel(userId: $userId, buyerType: $buyerType, organizationName: $organizationName, contactName: $contactName, phone: $phone, email: $email, taxNumber: $taxNumber, verificationStatus: $verificationStatus, preferredLanguage: $preferredLanguage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuyerAccountModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.buyerType, buyerType) ||
                other.buyerType == buyerType) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.taxNumber, taxNumber) ||
                other.taxNumber == taxNumber) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    buyerType,
    organizationName,
    contactName,
    phone,
    email,
    taxNumber,
    verificationStatus,
    preferredLanguage,
    createdAt,
    updatedAt,
  );

  /// Create a copy of BuyerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuyerAccountModelImplCopyWith<_$BuyerAccountModelImpl> get copyWith =>
      __$$BuyerAccountModelImplCopyWithImpl<_$BuyerAccountModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyerAccountModelImplToJson(this);
  }
}

abstract class _BuyerAccountModel implements BuyerAccountModel {
  const factory _BuyerAccountModel({
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'buyer_type') final BuyerType buyerType,
    @JsonKey(name: 'organization_name') final String? organizationName,
    @JsonKey(name: 'contact_name') required final String contactName,
    required final String phone,
    required final String email,
    @JsonKey(name: 'tax_number') final String? taxNumber,
    @JsonKey(name: 'verification_status') final String verificationStatus,
    @JsonKey(name: 'preferred_language') final String preferredLanguage,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
  }) = _$BuyerAccountModelImpl;

  factory _BuyerAccountModel.fromJson(Map<String, dynamic> json) =
      _$BuyerAccountModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'buyer_type')
  BuyerType get buyerType;
  @override
  @JsonKey(name: 'organization_name')
  String? get organizationName;
  @override
  @JsonKey(name: 'contact_name')
  String get contactName;
  @override
  String get phone;
  @override
  String get email;
  @override
  @JsonKey(name: 'tax_number')
  String? get taxNumber;
  @override
  @JsonKey(name: 'verification_status')
  String get verificationStatus;
  @override
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt;

  /// Create a copy of BuyerAccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuyerAccountModelImplCopyWith<_$BuyerAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
