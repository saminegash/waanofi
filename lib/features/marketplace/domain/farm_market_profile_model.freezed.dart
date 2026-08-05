// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_market_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FarmMarketProfileModel _$FarmMarketProfileModelFromJson(
  Map<String, dynamic> json,
) {
  return _FarmMarketProfileModel.fromJson(json);
}

/// @nodoc
mixin _$FarmMarketProfileModel {
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_farm_name')
  String get publicFarmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_description')
  String? get publicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_phone')
  String? get publicPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_email')
  String? get publicEmail => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'general_location')
  String get generalLocation => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_availability')
  bool get pickupAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_availability')
  bool get deliveryAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_radius_zones')
  String? get deliveryRadiusZones => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  String get openingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'marketplace_status')
  MarketProfileStatus get marketplaceStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FarmMarketProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FarmMarketProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FarmMarketProfileModelCopyWith<FarmMarketProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FarmMarketProfileModelCopyWith<$Res> {
  factory $FarmMarketProfileModelCopyWith(
    FarmMarketProfileModel value,
    $Res Function(FarmMarketProfileModel) then,
  ) = _$FarmMarketProfileModelCopyWithImpl<$Res, FarmMarketProfileModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'public_farm_name') String publicFarmName,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'public_phone') String? publicPhone,
    @JsonKey(name: 'public_email') String? publicEmail,
    String? logo,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'general_location') String generalLocation,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'pickup_availability') bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') String? deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'marketplace_status') MarketProfileStatus marketplaceStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class _$FarmMarketProfileModelCopyWithImpl<
  $Res,
  $Val extends FarmMarketProfileModel
>
    implements $FarmMarketProfileModelCopyWith<$Res> {
  _$FarmMarketProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FarmMarketProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = null,
    Object? publicFarmName = null,
    Object? publicDescription = freezed,
    Object? publicPhone = freezed,
    Object? publicEmail = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? generalLocation = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pickupAvailability = null,
    Object? deliveryAvailability = null,
    Object? deliveryRadiusZones = freezed,
    Object? openingHours = null,
    Object? verificationStatus = null,
    Object? marketplaceStatus = null,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            farmId: null == farmId
                ? _value.farmId
                : farmId // ignore: cast_nullable_to_non_nullable
                      as String,
            publicFarmName: null == publicFarmName
                ? _value.publicFarmName
                : publicFarmName // ignore: cast_nullable_to_non_nullable
                      as String,
            publicDescription: freezed == publicDescription
                ? _value.publicDescription
                : publicDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            publicPhone: freezed == publicPhone
                ? _value.publicPhone
                : publicPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            publicEmail: freezed == publicEmail
                ? _value.publicEmail
                : publicEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            logo: freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String?,
            coverImage: freezed == coverImage
                ? _value.coverImage
                : coverImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            generalLocation: null == generalLocation
                ? _value.generalLocation
                : generalLocation // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            pickupAvailability: null == pickupAvailability
                ? _value.pickupAvailability
                : pickupAvailability // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryAvailability: null == deliveryAvailability
                ? _value.deliveryAvailability
                : deliveryAvailability // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryRadiusZones: freezed == deliveryRadiusZones
                ? _value.deliveryRadiusZones
                : deliveryRadiusZones // ignore: cast_nullable_to_non_nullable
                      as String?,
            openingHours: null == openingHours
                ? _value.openingHours
                : openingHours // ignore: cast_nullable_to_non_nullable
                      as String,
            verificationStatus: null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            marketplaceStatus: null == marketplaceStatus
                ? _value.marketplaceStatus
                : marketplaceStatus // ignore: cast_nullable_to_non_nullable
                      as MarketProfileStatus,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FarmMarketProfileModelImplCopyWith<$Res>
    implements $FarmMarketProfileModelCopyWith<$Res> {
  factory _$$FarmMarketProfileModelImplCopyWith(
    _$FarmMarketProfileModelImpl value,
    $Res Function(_$FarmMarketProfileModelImpl) then,
  ) = __$$FarmMarketProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'public_farm_name') String publicFarmName,
    @JsonKey(name: 'public_description') String? publicDescription,
    @JsonKey(name: 'public_phone') String? publicPhone,
    @JsonKey(name: 'public_email') String? publicEmail,
    String? logo,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'general_location') String generalLocation,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'pickup_availability') bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') String? deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'marketplace_status') MarketProfileStatus marketplaceStatus,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$FarmMarketProfileModelImplCopyWithImpl<$Res>
    extends
        _$FarmMarketProfileModelCopyWithImpl<$Res, _$FarmMarketProfileModelImpl>
    implements _$$FarmMarketProfileModelImplCopyWith<$Res> {
  __$$FarmMarketProfileModelImplCopyWithImpl(
    _$FarmMarketProfileModelImpl _value,
    $Res Function(_$FarmMarketProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FarmMarketProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? farmId = null,
    Object? publicFarmName = null,
    Object? publicDescription = freezed,
    Object? publicPhone = freezed,
    Object? publicEmail = freezed,
    Object? logo = freezed,
    Object? coverImage = freezed,
    Object? generalLocation = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? pickupAvailability = null,
    Object? deliveryAvailability = null,
    Object? deliveryRadiusZones = freezed,
    Object? openingHours = null,
    Object? verificationStatus = null,
    Object? marketplaceStatus = null,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$FarmMarketProfileModelImpl(
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        publicFarmName: null == publicFarmName
            ? _value.publicFarmName
            : publicFarmName // ignore: cast_nullable_to_non_nullable
                  as String,
        publicDescription: freezed == publicDescription
            ? _value.publicDescription
            : publicDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        publicPhone: freezed == publicPhone
            ? _value.publicPhone
            : publicPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        publicEmail: freezed == publicEmail
            ? _value.publicEmail
            : publicEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        logo: freezed == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String?,
        coverImage: freezed == coverImage
            ? _value.coverImage
            : coverImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        generalLocation: null == generalLocation
            ? _value.generalLocation
            : generalLocation // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        pickupAvailability: null == pickupAvailability
            ? _value.pickupAvailability
            : pickupAvailability // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryAvailability: null == deliveryAvailability
            ? _value.deliveryAvailability
            : deliveryAvailability // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryRadiusZones: freezed == deliveryRadiusZones
            ? _value.deliveryRadiusZones
            : deliveryRadiusZones // ignore: cast_nullable_to_non_nullable
                  as String?,
        openingHours: null == openingHours
            ? _value.openingHours
            : openingHours // ignore: cast_nullable_to_non_nullable
                  as String,
        verificationStatus: null == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        marketplaceStatus: null == marketplaceStatus
            ? _value.marketplaceStatus
            : marketplaceStatus // ignore: cast_nullable_to_non_nullable
                  as MarketProfileStatus,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
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
class _$FarmMarketProfileModelImpl implements _FarmMarketProfileModel {
  const _$FarmMarketProfileModelImpl({
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'public_farm_name') required this.publicFarmName,
    @JsonKey(name: 'public_description') this.publicDescription,
    @JsonKey(name: 'public_phone') this.publicPhone,
    @JsonKey(name: 'public_email') this.publicEmail,
    this.logo,
    @JsonKey(name: 'cover_image') this.coverImage,
    @JsonKey(name: 'general_location') required this.generalLocation,
    this.latitude,
    this.longitude,
    @JsonKey(name: 'pickup_availability') this.pickupAvailability = true,
    @JsonKey(name: 'delivery_availability') this.deliveryAvailability = false,
    @JsonKey(name: 'delivery_radius_zones') this.deliveryRadiusZones,
    @JsonKey(name: 'opening_hours')
    this.openingHours = 'Mon-Sat 8:00 AM - 5:00 PM',
    @JsonKey(name: 'verification_status')
    this.verificationStatus = 'unverified',
    @JsonKey(name: 'marketplace_status')
    this.marketplaceStatus = MarketProfileStatus.draft,
    @JsonKey(name: 'rejection_reason') this.rejectionReason,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.updatedAt,
  });

  factory _$FarmMarketProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FarmMarketProfileModelImplFromJson(json);

  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'public_farm_name')
  final String publicFarmName;
  @override
  @JsonKey(name: 'public_description')
  final String? publicDescription;
  @override
  @JsonKey(name: 'public_phone')
  final String? publicPhone;
  @override
  @JsonKey(name: 'public_email')
  final String? publicEmail;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'general_location')
  final String generalLocation;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'pickup_availability')
  final bool pickupAvailability;
  @override
  @JsonKey(name: 'delivery_availability')
  final bool deliveryAvailability;
  @override
  @JsonKey(name: 'delivery_radius_zones')
  final String? deliveryRadiusZones;
  @override
  @JsonKey(name: 'opening_hours')
  final String openingHours;
  @override
  @JsonKey(name: 'verification_status')
  final String verificationStatus;
  @override
  @JsonKey(name: 'marketplace_status')
  final MarketProfileStatus marketplaceStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FarmMarketProfileModel(farmId: $farmId, publicFarmName: $publicFarmName, publicDescription: $publicDescription, publicPhone: $publicPhone, publicEmail: $publicEmail, logo: $logo, coverImage: $coverImage, generalLocation: $generalLocation, latitude: $latitude, longitude: $longitude, pickupAvailability: $pickupAvailability, deliveryAvailability: $deliveryAvailability, deliveryRadiusZones: $deliveryRadiusZones, openingHours: $openingHours, verificationStatus: $verificationStatus, marketplaceStatus: $marketplaceStatus, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FarmMarketProfileModelImpl &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.publicFarmName, publicFarmName) ||
                other.publicFarmName == publicFarmName) &&
            (identical(other.publicDescription, publicDescription) ||
                other.publicDescription == publicDescription) &&
            (identical(other.publicPhone, publicPhone) ||
                other.publicPhone == publicPhone) &&
            (identical(other.publicEmail, publicEmail) ||
                other.publicEmail == publicEmail) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.generalLocation, generalLocation) ||
                other.generalLocation == generalLocation) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.pickupAvailability, pickupAvailability) ||
                other.pickupAvailability == pickupAvailability) &&
            (identical(other.deliveryAvailability, deliveryAvailability) ||
                other.deliveryAvailability == deliveryAvailability) &&
            (identical(other.deliveryRadiusZones, deliveryRadiusZones) ||
                other.deliveryRadiusZones == deliveryRadiusZones) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.marketplaceStatus, marketplaceStatus) ||
                other.marketplaceStatus == marketplaceStatus) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    farmId,
    publicFarmName,
    publicDescription,
    publicPhone,
    publicEmail,
    logo,
    coverImage,
    generalLocation,
    latitude,
    longitude,
    pickupAvailability,
    deliveryAvailability,
    deliveryRadiusZones,
    openingHours,
    verificationStatus,
    marketplaceStatus,
    rejectionReason,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of FarmMarketProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FarmMarketProfileModelImplCopyWith<_$FarmMarketProfileModelImpl>
  get copyWith =>
      __$$FarmMarketProfileModelImplCopyWithImpl<_$FarmMarketProfileModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FarmMarketProfileModelImplToJson(this);
  }
}

abstract class _FarmMarketProfileModel implements FarmMarketProfileModel {
  const factory _FarmMarketProfileModel({
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'public_farm_name') required final String publicFarmName,
    @JsonKey(name: 'public_description') final String? publicDescription,
    @JsonKey(name: 'public_phone') final String? publicPhone,
    @JsonKey(name: 'public_email') final String? publicEmail,
    final String? logo,
    @JsonKey(name: 'cover_image') final String? coverImage,
    @JsonKey(name: 'general_location') required final String generalLocation,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'pickup_availability') final bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') final bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') final String? deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') final String openingHours,
    @JsonKey(name: 'verification_status') final String verificationStatus,
    @JsonKey(name: 'marketplace_status')
    final MarketProfileStatus marketplaceStatus,
    @JsonKey(name: 'rejection_reason') final String? rejectionReason,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime updatedAt,
  }) = _$FarmMarketProfileModelImpl;

  factory _FarmMarketProfileModel.fromJson(Map<String, dynamic> json) =
      _$FarmMarketProfileModelImpl.fromJson;

  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'public_farm_name')
  String get publicFarmName;
  @override
  @JsonKey(name: 'public_description')
  String? get publicDescription;
  @override
  @JsonKey(name: 'public_phone')
  String? get publicPhone;
  @override
  @JsonKey(name: 'public_email')
  String? get publicEmail;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'general_location')
  String get generalLocation;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'pickup_availability')
  bool get pickupAvailability;
  @override
  @JsonKey(name: 'delivery_availability')
  bool get deliveryAvailability;
  @override
  @JsonKey(name: 'delivery_radius_zones')
  String? get deliveryRadiusZones;
  @override
  @JsonKey(name: 'opening_hours')
  String get openingHours;
  @override
  @JsonKey(name: 'verification_status')
  String get verificationStatus;
  @override
  @JsonKey(name: 'marketplace_status')
  MarketProfileStatus get marketplaceStatus;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get updatedAt;

  /// Create a copy of FarmMarketProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FarmMarketProfileModelImplCopyWith<_$FarmMarketProfileModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
