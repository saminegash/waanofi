// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PublicListingModel _$PublicListingModelFromJson(Map<String, dynamic> json) {
  return _PublicListingModel.fromJson(json);
}

/// @nodoc
mixin _$PublicListingModel {
  @JsonKey(name: 'listing_id')
  String get listingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'listing_status')
  String get listingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_title')
  String get publicTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_description')
  String get publicDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_unit')
  String get sellingUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_conversion')
  String get unitConversion => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_in_minor_units')
  int get priceInMinorUnits => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'minimum_order_quantity')
  int get minimumOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'maximum_order_quantity')
  int? get maximumOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'available_days')
  List<String> get availableDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_time')
  String get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_code')
  String get productCode => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name_en')
  String get productNameEn => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name_am')
  String? get productNameAm => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name_om')
  String? get productNameOm => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_default_image')
  String? get productDefaultImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_farm_name')
  String get publicFarmName => throw _privateConstructorUsedError;
  @JsonKey(name: 'general_location')
  String get generalLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_availability')
  bool get pickupAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_availability')
  bool get deliveryAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_radius_zones')
  List<String> get deliveryRadiusZones => throw _privateConstructorUsedError;
  @JsonKey(name: 'opening_hours')
  String get openingHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_logo')
  String? get farmLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_cover_image')
  String? get farmCoverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
  double get approximateAvailableQuantity => throw _privateConstructorUsedError;

  /// Serializes this PublicListingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicListingModelCopyWith<PublicListingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicListingModelCopyWith<$Res> {
  factory $PublicListingModelCopyWith(
    PublicListingModel value,
    $Res Function(PublicListingModel) then,
  ) = _$PublicListingModelCopyWithImpl<$Res, PublicListingModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'listing_id') String listingId,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'listing_status') String listingStatus,
    @JsonKey(name: 'public_title') String publicTitle,
    @JsonKey(name: 'public_description') String publicDescription,
    @JsonKey(name: 'selling_unit') String sellingUnit,
    @JsonKey(name: 'unit_conversion') String unitConversion,
    @JsonKey(name: 'price_in_minor_units') int priceInMinorUnits,
    String currency,
    @JsonKey(name: 'minimum_order_quantity') int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') List<String> availableDays,
    @JsonKey(name: 'preparation_time') String preparationTime,
    @JsonKey(name: 'product_code') String productCode,
    String category,
    @JsonKey(name: 'product_name_en') String productNameEn,
    @JsonKey(name: 'product_name_am') String? productNameAm,
    @JsonKey(name: 'product_name_om') String? productNameOm,
    @JsonKey(name: 'product_default_image') String? productDefaultImage,
    @JsonKey(name: 'public_farm_name') String publicFarmName,
    @JsonKey(name: 'general_location') String generalLocation,
    @JsonKey(name: 'pickup_availability') bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') List<String> deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'farm_logo') String? farmLogo,
    @JsonKey(name: 'farm_cover_image') String? farmCoverImage,
    @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
    double approximateAvailableQuantity,
  });
}

/// @nodoc
class _$PublicListingModelCopyWithImpl<$Res, $Val extends PublicListingModel>
    implements $PublicListingModelCopyWith<$Res> {
  _$PublicListingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? farmId = null,
    Object? listingStatus = null,
    Object? publicTitle = null,
    Object? publicDescription = null,
    Object? sellingUnit = null,
    Object? unitConversion = null,
    Object? priceInMinorUnits = null,
    Object? currency = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = freezed,
    Object? availableFulfilmentMethods = null,
    Object? availableDays = null,
    Object? preparationTime = null,
    Object? productCode = null,
    Object? category = null,
    Object? productNameEn = null,
    Object? productNameAm = freezed,
    Object? productNameOm = freezed,
    Object? productDefaultImage = freezed,
    Object? publicFarmName = null,
    Object? generalLocation = null,
    Object? pickupAvailability = null,
    Object? deliveryAvailability = null,
    Object? deliveryRadiusZones = null,
    Object? openingHours = null,
    Object? verificationStatus = null,
    Object? farmLogo = freezed,
    Object? farmCoverImage = freezed,
    Object? approximateAvailableQuantity = null,
  }) {
    return _then(
      _value.copyWith(
            listingId: null == listingId
                ? _value.listingId
                : listingId // ignore: cast_nullable_to_non_nullable
                      as String,
            farmId: null == farmId
                ? _value.farmId
                : farmId // ignore: cast_nullable_to_non_nullable
                      as String,
            listingStatus: null == listingStatus
                ? _value.listingStatus
                : listingStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            publicTitle: null == publicTitle
                ? _value.publicTitle
                : publicTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            publicDescription: null == publicDescription
                ? _value.publicDescription
                : publicDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            sellingUnit: null == sellingUnit
                ? _value.sellingUnit
                : sellingUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            unitConversion: null == unitConversion
                ? _value.unitConversion
                : unitConversion // ignore: cast_nullable_to_non_nullable
                      as String,
            priceInMinorUnits: null == priceInMinorUnits
                ? _value.priceInMinorUnits
                : priceInMinorUnits // ignore: cast_nullable_to_non_nullable
                      as int,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            minimumOrderQuantity: null == minimumOrderQuantity
                ? _value.minimumOrderQuantity
                : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            maximumOrderQuantity: freezed == maximumOrderQuantity
                ? _value.maximumOrderQuantity
                : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            availableFulfilmentMethods: null == availableFulfilmentMethods
                ? _value.availableFulfilmentMethods
                : availableFulfilmentMethods // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            availableDays: null == availableDays
                ? _value.availableDays
                : availableDays // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            preparationTime: null == preparationTime
                ? _value.preparationTime
                : preparationTime // ignore: cast_nullable_to_non_nullable
                      as String,
            productCode: null == productCode
                ? _value.productCode
                : productCode // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            productNameEn: null == productNameEn
                ? _value.productNameEn
                : productNameEn // ignore: cast_nullable_to_non_nullable
                      as String,
            productNameAm: freezed == productNameAm
                ? _value.productNameAm
                : productNameAm // ignore: cast_nullable_to_non_nullable
                      as String?,
            productNameOm: freezed == productNameOm
                ? _value.productNameOm
                : productNameOm // ignore: cast_nullable_to_non_nullable
                      as String?,
            productDefaultImage: freezed == productDefaultImage
                ? _value.productDefaultImage
                : productDefaultImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            publicFarmName: null == publicFarmName
                ? _value.publicFarmName
                : publicFarmName // ignore: cast_nullable_to_non_nullable
                      as String,
            generalLocation: null == generalLocation
                ? _value.generalLocation
                : generalLocation // ignore: cast_nullable_to_non_nullable
                      as String,
            pickupAvailability: null == pickupAvailability
                ? _value.pickupAvailability
                : pickupAvailability // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryAvailability: null == deliveryAvailability
                ? _value.deliveryAvailability
                : deliveryAvailability // ignore: cast_nullable_to_non_nullable
                      as bool,
            deliveryRadiusZones: null == deliveryRadiusZones
                ? _value.deliveryRadiusZones
                : deliveryRadiusZones // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            openingHours: null == openingHours
                ? _value.openingHours
                : openingHours // ignore: cast_nullable_to_non_nullable
                      as String,
            verificationStatus: null == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            farmLogo: freezed == farmLogo
                ? _value.farmLogo
                : farmLogo // ignore: cast_nullable_to_non_nullable
                      as String?,
            farmCoverImage: freezed == farmCoverImage
                ? _value.farmCoverImage
                : farmCoverImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            approximateAvailableQuantity: null == approximateAvailableQuantity
                ? _value.approximateAvailableQuantity
                : approximateAvailableQuantity // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PublicListingModelImplCopyWith<$Res>
    implements $PublicListingModelCopyWith<$Res> {
  factory _$$PublicListingModelImplCopyWith(
    _$PublicListingModelImpl value,
    $Res Function(_$PublicListingModelImpl) then,
  ) = __$$PublicListingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'listing_id') String listingId,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'listing_status') String listingStatus,
    @JsonKey(name: 'public_title') String publicTitle,
    @JsonKey(name: 'public_description') String publicDescription,
    @JsonKey(name: 'selling_unit') String sellingUnit,
    @JsonKey(name: 'unit_conversion') String unitConversion,
    @JsonKey(name: 'price_in_minor_units') int priceInMinorUnits,
    String currency,
    @JsonKey(name: 'minimum_order_quantity') int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') List<String> availableDays,
    @JsonKey(name: 'preparation_time') String preparationTime,
    @JsonKey(name: 'product_code') String productCode,
    String category,
    @JsonKey(name: 'product_name_en') String productNameEn,
    @JsonKey(name: 'product_name_am') String? productNameAm,
    @JsonKey(name: 'product_name_om') String? productNameOm,
    @JsonKey(name: 'product_default_image') String? productDefaultImage,
    @JsonKey(name: 'public_farm_name') String publicFarmName,
    @JsonKey(name: 'general_location') String generalLocation,
    @JsonKey(name: 'pickup_availability') bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones') List<String> deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') String openingHours,
    @JsonKey(name: 'verification_status') String verificationStatus,
    @JsonKey(name: 'farm_logo') String? farmLogo,
    @JsonKey(name: 'farm_cover_image') String? farmCoverImage,
    @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
    double approximateAvailableQuantity,
  });
}

/// @nodoc
class __$$PublicListingModelImplCopyWithImpl<$Res>
    extends _$PublicListingModelCopyWithImpl<$Res, _$PublicListingModelImpl>
    implements _$$PublicListingModelImplCopyWith<$Res> {
  __$$PublicListingModelImplCopyWithImpl(
    _$PublicListingModelImpl _value,
    $Res Function(_$PublicListingModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PublicListingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? farmId = null,
    Object? listingStatus = null,
    Object? publicTitle = null,
    Object? publicDescription = null,
    Object? sellingUnit = null,
    Object? unitConversion = null,
    Object? priceInMinorUnits = null,
    Object? currency = null,
    Object? minimumOrderQuantity = null,
    Object? maximumOrderQuantity = freezed,
    Object? availableFulfilmentMethods = null,
    Object? availableDays = null,
    Object? preparationTime = null,
    Object? productCode = null,
    Object? category = null,
    Object? productNameEn = null,
    Object? productNameAm = freezed,
    Object? productNameOm = freezed,
    Object? productDefaultImage = freezed,
    Object? publicFarmName = null,
    Object? generalLocation = null,
    Object? pickupAvailability = null,
    Object? deliveryAvailability = null,
    Object? deliveryRadiusZones = null,
    Object? openingHours = null,
    Object? verificationStatus = null,
    Object? farmLogo = freezed,
    Object? farmCoverImage = freezed,
    Object? approximateAvailableQuantity = null,
  }) {
    return _then(
      _$PublicListingModelImpl(
        listingId: null == listingId
            ? _value.listingId
            : listingId // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        listingStatus: null == listingStatus
            ? _value.listingStatus
            : listingStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        publicTitle: null == publicTitle
            ? _value.publicTitle
            : publicTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        publicDescription: null == publicDescription
            ? _value.publicDescription
            : publicDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        sellingUnit: null == sellingUnit
            ? _value.sellingUnit
            : sellingUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        unitConversion: null == unitConversion
            ? _value.unitConversion
            : unitConversion // ignore: cast_nullable_to_non_nullable
                  as String,
        priceInMinorUnits: null == priceInMinorUnits
            ? _value.priceInMinorUnits
            : priceInMinorUnits // ignore: cast_nullable_to_non_nullable
                  as int,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        minimumOrderQuantity: null == minimumOrderQuantity
            ? _value.minimumOrderQuantity
            : minimumOrderQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        maximumOrderQuantity: freezed == maximumOrderQuantity
            ? _value.maximumOrderQuantity
            : maximumOrderQuantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        availableFulfilmentMethods: null == availableFulfilmentMethods
            ? _value._availableFulfilmentMethods
            : availableFulfilmentMethods // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        availableDays: null == availableDays
            ? _value._availableDays
            : availableDays // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        preparationTime: null == preparationTime
            ? _value.preparationTime
            : preparationTime // ignore: cast_nullable_to_non_nullable
                  as String,
        productCode: null == productCode
            ? _value.productCode
            : productCode // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        productNameEn: null == productNameEn
            ? _value.productNameEn
            : productNameEn // ignore: cast_nullable_to_non_nullable
                  as String,
        productNameAm: freezed == productNameAm
            ? _value.productNameAm
            : productNameAm // ignore: cast_nullable_to_non_nullable
                  as String?,
        productNameOm: freezed == productNameOm
            ? _value.productNameOm
            : productNameOm // ignore: cast_nullable_to_non_nullable
                  as String?,
        productDefaultImage: freezed == productDefaultImage
            ? _value.productDefaultImage
            : productDefaultImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        publicFarmName: null == publicFarmName
            ? _value.publicFarmName
            : publicFarmName // ignore: cast_nullable_to_non_nullable
                  as String,
        generalLocation: null == generalLocation
            ? _value.generalLocation
            : generalLocation // ignore: cast_nullable_to_non_nullable
                  as String,
        pickupAvailability: null == pickupAvailability
            ? _value.pickupAvailability
            : pickupAvailability // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryAvailability: null == deliveryAvailability
            ? _value.deliveryAvailability
            : deliveryAvailability // ignore: cast_nullable_to_non_nullable
                  as bool,
        deliveryRadiusZones: null == deliveryRadiusZones
            ? _value._deliveryRadiusZones
            : deliveryRadiusZones // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        openingHours: null == openingHours
            ? _value.openingHours
            : openingHours // ignore: cast_nullable_to_non_nullable
                  as String,
        verificationStatus: null == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        farmLogo: freezed == farmLogo
            ? _value.farmLogo
            : farmLogo // ignore: cast_nullable_to_non_nullable
                  as String?,
        farmCoverImage: freezed == farmCoverImage
            ? _value.farmCoverImage
            : farmCoverImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        approximateAvailableQuantity: null == approximateAvailableQuantity
            ? _value.approximateAvailableQuantity
            : approximateAvailableQuantity // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicListingModelImpl implements _PublicListingModel {
  const _$PublicListingModelImpl({
    @JsonKey(name: 'listing_id') required this.listingId,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'listing_status') required this.listingStatus,
    @JsonKey(name: 'public_title') required this.publicTitle,
    @JsonKey(name: 'public_description') required this.publicDescription,
    @JsonKey(name: 'selling_unit') required this.sellingUnit,
    @JsonKey(name: 'unit_conversion') this.unitConversion = '1 unit',
    @JsonKey(name: 'price_in_minor_units') required this.priceInMinorUnits,
    this.currency = 'ETB',
    @JsonKey(name: 'minimum_order_quantity') this.minimumOrderQuantity = 1,
    @JsonKey(name: 'maximum_order_quantity') this.maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    final List<String> availableFulfilmentMethods = const [],
    @JsonKey(name: 'available_days')
    final List<String> availableDays = const [],
    @JsonKey(name: 'preparation_time') this.preparationTime = '24 hours',
    @JsonKey(name: 'product_code') required this.productCode,
    required this.category,
    @JsonKey(name: 'product_name_en') required this.productNameEn,
    @JsonKey(name: 'product_name_am') this.productNameAm,
    @JsonKey(name: 'product_name_om') this.productNameOm,
    @JsonKey(name: 'product_default_image') this.productDefaultImage,
    @JsonKey(name: 'public_farm_name') required this.publicFarmName,
    @JsonKey(name: 'general_location') required this.generalLocation,
    @JsonKey(name: 'pickup_availability') this.pickupAvailability = true,
    @JsonKey(name: 'delivery_availability') this.deliveryAvailability = false,
    @JsonKey(name: 'delivery_radius_zones')
    final List<String> deliveryRadiusZones = const [],
    @JsonKey(name: 'opening_hours')
    this.openingHours = 'Mon-Sat 6:00 AM - 6:00 PM',
    @JsonKey(name: 'verification_status') this.verificationStatus = 'approved',
    @JsonKey(name: 'farm_logo') this.farmLogo,
    @JsonKey(name: 'farm_cover_image') this.farmCoverImage,
    @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
    this.approximateAvailableQuantity = 0.0,
  }) : _availableFulfilmentMethods = availableFulfilmentMethods,
       _availableDays = availableDays,
       _deliveryRadiusZones = deliveryRadiusZones;

  factory _$PublicListingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicListingModelImplFromJson(json);

  @override
  @JsonKey(name: 'listing_id')
  final String listingId;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'listing_status')
  final String listingStatus;
  @override
  @JsonKey(name: 'public_title')
  final String publicTitle;
  @override
  @JsonKey(name: 'public_description')
  final String publicDescription;
  @override
  @JsonKey(name: 'selling_unit')
  final String sellingUnit;
  @override
  @JsonKey(name: 'unit_conversion')
  final String unitConversion;
  @override
  @JsonKey(name: 'price_in_minor_units')
  final int priceInMinorUnits;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(name: 'minimum_order_quantity')
  final int minimumOrderQuantity;
  @override
  @JsonKey(name: 'maximum_order_quantity')
  final int? maximumOrderQuantity;
  final List<String> _availableFulfilmentMethods;
  @override
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods {
    if (_availableFulfilmentMethods is EqualUnmodifiableListView)
      return _availableFulfilmentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableFulfilmentMethods);
  }

  final List<String> _availableDays;
  @override
  @JsonKey(name: 'available_days')
  List<String> get availableDays {
    if (_availableDays is EqualUnmodifiableListView) return _availableDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDays);
  }

  @override
  @JsonKey(name: 'preparation_time')
  final String preparationTime;
  @override
  @JsonKey(name: 'product_code')
  final String productCode;
  @override
  final String category;
  @override
  @JsonKey(name: 'product_name_en')
  final String productNameEn;
  @override
  @JsonKey(name: 'product_name_am')
  final String? productNameAm;
  @override
  @JsonKey(name: 'product_name_om')
  final String? productNameOm;
  @override
  @JsonKey(name: 'product_default_image')
  final String? productDefaultImage;
  @override
  @JsonKey(name: 'public_farm_name')
  final String publicFarmName;
  @override
  @JsonKey(name: 'general_location')
  final String generalLocation;
  @override
  @JsonKey(name: 'pickup_availability')
  final bool pickupAvailability;
  @override
  @JsonKey(name: 'delivery_availability')
  final bool deliveryAvailability;
  final List<String> _deliveryRadiusZones;
  @override
  @JsonKey(name: 'delivery_radius_zones')
  List<String> get deliveryRadiusZones {
    if (_deliveryRadiusZones is EqualUnmodifiableListView)
      return _deliveryRadiusZones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryRadiusZones);
  }

  @override
  @JsonKey(name: 'opening_hours')
  final String openingHours;
  @override
  @JsonKey(name: 'verification_status')
  final String verificationStatus;
  @override
  @JsonKey(name: 'farm_logo')
  final String? farmLogo;
  @override
  @JsonKey(name: 'farm_cover_image')
  final String? farmCoverImage;
  @override
  @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
  final double approximateAvailableQuantity;

  @override
  String toString() {
    return 'PublicListingModel(listingId: $listingId, farmId: $farmId, listingStatus: $listingStatus, publicTitle: $publicTitle, publicDescription: $publicDescription, sellingUnit: $sellingUnit, unitConversion: $unitConversion, priceInMinorUnits: $priceInMinorUnits, currency: $currency, minimumOrderQuantity: $minimumOrderQuantity, maximumOrderQuantity: $maximumOrderQuantity, availableFulfilmentMethods: $availableFulfilmentMethods, availableDays: $availableDays, preparationTime: $preparationTime, productCode: $productCode, category: $category, productNameEn: $productNameEn, productNameAm: $productNameAm, productNameOm: $productNameOm, productDefaultImage: $productDefaultImage, publicFarmName: $publicFarmName, generalLocation: $generalLocation, pickupAvailability: $pickupAvailability, deliveryAvailability: $deliveryAvailability, deliveryRadiusZones: $deliveryRadiusZones, openingHours: $openingHours, verificationStatus: $verificationStatus, farmLogo: $farmLogo, farmCoverImage: $farmCoverImage, approximateAvailableQuantity: $approximateAvailableQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicListingModelImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.listingStatus, listingStatus) ||
                other.listingStatus == listingStatus) &&
            (identical(other.publicTitle, publicTitle) ||
                other.publicTitle == publicTitle) &&
            (identical(other.publicDescription, publicDescription) ||
                other.publicDescription == publicDescription) &&
            (identical(other.sellingUnit, sellingUnit) ||
                other.sellingUnit == sellingUnit) &&
            (identical(other.unitConversion, unitConversion) ||
                other.unitConversion == unitConversion) &&
            (identical(other.priceInMinorUnits, priceInMinorUnits) ||
                other.priceInMinorUnits == priceInMinorUnits) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.minimumOrderQuantity, minimumOrderQuantity) ||
                other.minimumOrderQuantity == minimumOrderQuantity) &&
            (identical(other.maximumOrderQuantity, maximumOrderQuantity) ||
                other.maximumOrderQuantity == maximumOrderQuantity) &&
            const DeepCollectionEquality().equals(
              other._availableFulfilmentMethods,
              _availableFulfilmentMethods,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableDays,
              _availableDays,
            ) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.productNameEn, productNameEn) ||
                other.productNameEn == productNameEn) &&
            (identical(other.productNameAm, productNameAm) ||
                other.productNameAm == productNameAm) &&
            (identical(other.productNameOm, productNameOm) ||
                other.productNameOm == productNameOm) &&
            (identical(other.productDefaultImage, productDefaultImage) ||
                other.productDefaultImage == productDefaultImage) &&
            (identical(other.publicFarmName, publicFarmName) ||
                other.publicFarmName == publicFarmName) &&
            (identical(other.generalLocation, generalLocation) ||
                other.generalLocation == generalLocation) &&
            (identical(other.pickupAvailability, pickupAvailability) ||
                other.pickupAvailability == pickupAvailability) &&
            (identical(other.deliveryAvailability, deliveryAvailability) ||
                other.deliveryAvailability == deliveryAvailability) &&
            const DeepCollectionEquality().equals(
              other._deliveryRadiusZones,
              _deliveryRadiusZones,
            ) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.farmLogo, farmLogo) ||
                other.farmLogo == farmLogo) &&
            (identical(other.farmCoverImage, farmCoverImage) ||
                other.farmCoverImage == farmCoverImage) &&
            (identical(
                  other.approximateAvailableQuantity,
                  approximateAvailableQuantity,
                ) ||
                other.approximateAvailableQuantity ==
                    approximateAvailableQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    listingId,
    farmId,
    listingStatus,
    publicTitle,
    publicDescription,
    sellingUnit,
    unitConversion,
    priceInMinorUnits,
    currency,
    minimumOrderQuantity,
    maximumOrderQuantity,
    const DeepCollectionEquality().hash(_availableFulfilmentMethods),
    const DeepCollectionEquality().hash(_availableDays),
    preparationTime,
    productCode,
    category,
    productNameEn,
    productNameAm,
    productNameOm,
    productDefaultImage,
    publicFarmName,
    generalLocation,
    pickupAvailability,
    deliveryAvailability,
    const DeepCollectionEquality().hash(_deliveryRadiusZones),
    openingHours,
    verificationStatus,
    farmLogo,
    farmCoverImage,
    approximateAvailableQuantity,
  ]);

  /// Create a copy of PublicListingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicListingModelImplCopyWith<_$PublicListingModelImpl> get copyWith =>
      __$$PublicListingModelImplCopyWithImpl<_$PublicListingModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicListingModelImplToJson(this);
  }
}

abstract class _PublicListingModel implements PublicListingModel {
  const factory _PublicListingModel({
    @JsonKey(name: 'listing_id') required final String listingId,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'listing_status') required final String listingStatus,
    @JsonKey(name: 'public_title') required final String publicTitle,
    @JsonKey(name: 'public_description')
    required final String publicDescription,
    @JsonKey(name: 'selling_unit') required final String sellingUnit,
    @JsonKey(name: 'unit_conversion') final String unitConversion,
    @JsonKey(name: 'price_in_minor_units') required final int priceInMinorUnits,
    final String currency,
    @JsonKey(name: 'minimum_order_quantity') final int minimumOrderQuantity,
    @JsonKey(name: 'maximum_order_quantity') final int? maximumOrderQuantity,
    @JsonKey(name: 'available_fulfilment_methods')
    final List<String> availableFulfilmentMethods,
    @JsonKey(name: 'available_days') final List<String> availableDays,
    @JsonKey(name: 'preparation_time') final String preparationTime,
    @JsonKey(name: 'product_code') required final String productCode,
    required final String category,
    @JsonKey(name: 'product_name_en') required final String productNameEn,
    @JsonKey(name: 'product_name_am') final String? productNameAm,
    @JsonKey(name: 'product_name_om') final String? productNameOm,
    @JsonKey(name: 'product_default_image') final String? productDefaultImage,
    @JsonKey(name: 'public_farm_name') required final String publicFarmName,
    @JsonKey(name: 'general_location') required final String generalLocation,
    @JsonKey(name: 'pickup_availability') final bool pickupAvailability,
    @JsonKey(name: 'delivery_availability') final bool deliveryAvailability,
    @JsonKey(name: 'delivery_radius_zones')
    final List<String> deliveryRadiusZones,
    @JsonKey(name: 'opening_hours') final String openingHours,
    @JsonKey(name: 'verification_status') final String verificationStatus,
    @JsonKey(name: 'farm_logo') final String? farmLogo,
    @JsonKey(name: 'farm_cover_image') final String? farmCoverImage,
    @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
    final double approximateAvailableQuantity,
  }) = _$PublicListingModelImpl;

  factory _PublicListingModel.fromJson(Map<String, dynamic> json) =
      _$PublicListingModelImpl.fromJson;

  @override
  @JsonKey(name: 'listing_id')
  String get listingId;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'listing_status')
  String get listingStatus;
  @override
  @JsonKey(name: 'public_title')
  String get publicTitle;
  @override
  @JsonKey(name: 'public_description')
  String get publicDescription;
  @override
  @JsonKey(name: 'selling_unit')
  String get sellingUnit;
  @override
  @JsonKey(name: 'unit_conversion')
  String get unitConversion;
  @override
  @JsonKey(name: 'price_in_minor_units')
  int get priceInMinorUnits;
  @override
  String get currency;
  @override
  @JsonKey(name: 'minimum_order_quantity')
  int get minimumOrderQuantity;
  @override
  @JsonKey(name: 'maximum_order_quantity')
  int? get maximumOrderQuantity;
  @override
  @JsonKey(name: 'available_fulfilment_methods')
  List<String> get availableFulfilmentMethods;
  @override
  @JsonKey(name: 'available_days')
  List<String> get availableDays;
  @override
  @JsonKey(name: 'preparation_time')
  String get preparationTime;
  @override
  @JsonKey(name: 'product_code')
  String get productCode;
  @override
  String get category;
  @override
  @JsonKey(name: 'product_name_en')
  String get productNameEn;
  @override
  @JsonKey(name: 'product_name_am')
  String? get productNameAm;
  @override
  @JsonKey(name: 'product_name_om')
  String? get productNameOm;
  @override
  @JsonKey(name: 'product_default_image')
  String? get productDefaultImage;
  @override
  @JsonKey(name: 'public_farm_name')
  String get publicFarmName;
  @override
  @JsonKey(name: 'general_location')
  String get generalLocation;
  @override
  @JsonKey(name: 'pickup_availability')
  bool get pickupAvailability;
  @override
  @JsonKey(name: 'delivery_availability')
  bool get deliveryAvailability;
  @override
  @JsonKey(name: 'delivery_radius_zones')
  List<String> get deliveryRadiusZones;
  @override
  @JsonKey(name: 'opening_hours')
  String get openingHours;
  @override
  @JsonKey(name: 'verification_status')
  String get verificationStatus;
  @override
  @JsonKey(name: 'farm_logo')
  String? get farmLogo;
  @override
  @JsonKey(name: 'farm_cover_image')
  String? get farmCoverImage;
  @override
  @JsonKey(name: 'approximate_available_quantity', defaultValue: 0.0)
  double get approximateAvailableQuantity;

  /// Create a copy of PublicListingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicListingModelImplCopyWith<_$PublicListingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
