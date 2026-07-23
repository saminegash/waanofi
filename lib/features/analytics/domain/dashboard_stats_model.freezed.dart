// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyTrendModel _$DailyTrendModelFromJson(Map<String, dynamic> json) {
  return _DailyTrendModel.fromJson(json);
}

/// @nodoc
mixin _$DailyTrendModel {
  DateTime get date => throw _privateConstructorUsedError;
  double get litres => throw _privateConstructorUsedError;

  /// Serializes this DailyTrendModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTrendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTrendModelCopyWith<DailyTrendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTrendModelCopyWith<$Res> {
  factory $DailyTrendModelCopyWith(
    DailyTrendModel value,
    $Res Function(DailyTrendModel) then,
  ) = _$DailyTrendModelCopyWithImpl<$Res, DailyTrendModel>;
  @useResult
  $Res call({DateTime date, double litres});
}

/// @nodoc
class _$DailyTrendModelCopyWithImpl<$Res, $Val extends DailyTrendModel>
    implements $DailyTrendModelCopyWith<$Res> {
  _$DailyTrendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTrendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? litres = null}) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            litres: null == litres
                ? _value.litres
                : litres // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyTrendModelImplCopyWith<$Res>
    implements $DailyTrendModelCopyWith<$Res> {
  factory _$$DailyTrendModelImplCopyWith(
    _$DailyTrendModelImpl value,
    $Res Function(_$DailyTrendModelImpl) then,
  ) = __$$DailyTrendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double litres});
}

/// @nodoc
class __$$DailyTrendModelImplCopyWithImpl<$Res>
    extends _$DailyTrendModelCopyWithImpl<$Res, _$DailyTrendModelImpl>
    implements _$$DailyTrendModelImplCopyWith<$Res> {
  __$$DailyTrendModelImplCopyWithImpl(
    _$DailyTrendModelImpl _value,
    $Res Function(_$DailyTrendModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyTrendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? date = null, Object? litres = null}) {
    return _then(
      _$DailyTrendModelImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        litres: null == litres
            ? _value.litres
            : litres // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTrendModelImpl implements _DailyTrendModel {
  const _$DailyTrendModelImpl({required this.date, required this.litres});

  factory _$DailyTrendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTrendModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double litres;

  @override
  String toString() {
    return 'DailyTrendModel(date: $date, litres: $litres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTrendModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.litres, litres) || other.litres == litres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, litres);

  /// Create a copy of DailyTrendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTrendModelImplCopyWith<_$DailyTrendModelImpl> get copyWith =>
      __$$DailyTrendModelImplCopyWithImpl<_$DailyTrendModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTrendModelImplToJson(this);
  }
}

abstract class _DailyTrendModel implements DailyTrendModel {
  const factory _DailyTrendModel({
    required final DateTime date,
    required final double litres,
  }) = _$DailyTrendModelImpl;

  factory _DailyTrendModel.fromJson(Map<String, dynamic> json) =
      _$DailyTrendModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get litres;

  /// Create a copy of DailyTrendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTrendModelImplCopyWith<_$DailyTrendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopProducerModel _$TopProducerModelFromJson(Map<String, dynamic> json) {
  return _TopProducerModel.fromJson(json);
}

/// @nodoc
mixin _$TopProducerModel {
  @JsonKey(name: 'animal_id')
  String get animalId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_number')
  String get tagNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_litres')
  double get totalLitres => throw _privateConstructorUsedError;

  /// Serializes this TopProducerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopProducerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopProducerModelCopyWith<TopProducerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopProducerModelCopyWith<$Res> {
  factory $TopProducerModelCopyWith(
    TopProducerModel value,
    $Res Function(TopProducerModel) then,
  ) = _$TopProducerModelCopyWithImpl<$Res, TopProducerModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'animal_id') String animalId,
    @JsonKey(name: 'tag_number') String tagNumber,
    String? name,
    @JsonKey(name: 'total_litres') double totalLitres,
  });
}

/// @nodoc
class _$TopProducerModelCopyWithImpl<$Res, $Val extends TopProducerModel>
    implements $TopProducerModelCopyWith<$Res> {
  _$TopProducerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopProducerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animalId = null,
    Object? tagNumber = null,
    Object? name = freezed,
    Object? totalLitres = null,
  }) {
    return _then(
      _value.copyWith(
            animalId: null == animalId
                ? _value.animalId
                : animalId // ignore: cast_nullable_to_non_nullable
                      as String,
            tagNumber: null == tagNumber
                ? _value.tagNumber
                : tagNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalLitres: null == totalLitres
                ? _value.totalLitres
                : totalLitres // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopProducerModelImplCopyWith<$Res>
    implements $TopProducerModelCopyWith<$Res> {
  factory _$$TopProducerModelImplCopyWith(
    _$TopProducerModelImpl value,
    $Res Function(_$TopProducerModelImpl) then,
  ) = __$$TopProducerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'animal_id') String animalId,
    @JsonKey(name: 'tag_number') String tagNumber,
    String? name,
    @JsonKey(name: 'total_litres') double totalLitres,
  });
}

/// @nodoc
class __$$TopProducerModelImplCopyWithImpl<$Res>
    extends _$TopProducerModelCopyWithImpl<$Res, _$TopProducerModelImpl>
    implements _$$TopProducerModelImplCopyWith<$Res> {
  __$$TopProducerModelImplCopyWithImpl(
    _$TopProducerModelImpl _value,
    $Res Function(_$TopProducerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopProducerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animalId = null,
    Object? tagNumber = null,
    Object? name = freezed,
    Object? totalLitres = null,
  }) {
    return _then(
      _$TopProducerModelImpl(
        animalId: null == animalId
            ? _value.animalId
            : animalId // ignore: cast_nullable_to_non_nullable
                  as String,
        tagNumber: null == tagNumber
            ? _value.tagNumber
            : tagNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalLitres: null == totalLitres
            ? _value.totalLitres
            : totalLitres // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopProducerModelImpl implements _TopProducerModel {
  const _$TopProducerModelImpl({
    @JsonKey(name: 'animal_id') required this.animalId,
    @JsonKey(name: 'tag_number') required this.tagNumber,
    this.name,
    @JsonKey(name: 'total_litres') required this.totalLitres,
  });

  factory _$TopProducerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopProducerModelImplFromJson(json);

  @override
  @JsonKey(name: 'animal_id')
  final String animalId;
  @override
  @JsonKey(name: 'tag_number')
  final String tagNumber;
  @override
  final String? name;
  @override
  @JsonKey(name: 'total_litres')
  final double totalLitres;

  @override
  String toString() {
    return 'TopProducerModel(animalId: $animalId, tagNumber: $tagNumber, name: $name, totalLitres: $totalLitres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopProducerModelImpl &&
            (identical(other.animalId, animalId) ||
                other.animalId == animalId) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalLitres, totalLitres) ||
                other.totalLitres == totalLitres));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, animalId, tagNumber, name, totalLitres);

  /// Create a copy of TopProducerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopProducerModelImplCopyWith<_$TopProducerModelImpl> get copyWith =>
      __$$TopProducerModelImplCopyWithImpl<_$TopProducerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TopProducerModelImplToJson(this);
  }
}

abstract class _TopProducerModel implements TopProducerModel {
  const factory _TopProducerModel({
    @JsonKey(name: 'animal_id') required final String animalId,
    @JsonKey(name: 'tag_number') required final String tagNumber,
    final String? name,
    @JsonKey(name: 'total_litres') required final double totalLitres,
  }) = _$TopProducerModelImpl;

  factory _TopProducerModel.fromJson(Map<String, dynamic> json) =
      _$TopProducerModelImpl.fromJson;

  @override
  @JsonKey(name: 'animal_id')
  String get animalId;
  @override
  @JsonKey(name: 'tag_number')
  String get tagNumber;
  @override
  String? get name;
  @override
  @JsonKey(name: 'total_litres')
  double get totalLitres;

  /// Create a copy of TopProducerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopProducerModelImplCopyWith<_$TopProducerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimalStatusCountModel _$AnimalStatusCountModelFromJson(
  Map<String, dynamic> json,
) {
  return _AnimalStatusCountModel.fromJson(json);
}

/// @nodoc
mixin _$AnimalStatusCountModel {
  String get status => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this AnimalStatusCountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimalStatusCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimalStatusCountModelCopyWith<AnimalStatusCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalStatusCountModelCopyWith<$Res> {
  factory $AnimalStatusCountModelCopyWith(
    AnimalStatusCountModel value,
    $Res Function(AnimalStatusCountModel) then,
  ) = _$AnimalStatusCountModelCopyWithImpl<$Res, AnimalStatusCountModel>;
  @useResult
  $Res call({String status, int count});
}

/// @nodoc
class _$AnimalStatusCountModelCopyWithImpl<
  $Res,
  $Val extends AnimalStatusCountModel
>
    implements $AnimalStatusCountModelCopyWith<$Res> {
  _$AnimalStatusCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimalStatusCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? count = null}) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimalStatusCountModelImplCopyWith<$Res>
    implements $AnimalStatusCountModelCopyWith<$Res> {
  factory _$$AnimalStatusCountModelImplCopyWith(
    _$AnimalStatusCountModelImpl value,
    $Res Function(_$AnimalStatusCountModelImpl) then,
  ) = __$$AnimalStatusCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int count});
}

/// @nodoc
class __$$AnimalStatusCountModelImplCopyWithImpl<$Res>
    extends
        _$AnimalStatusCountModelCopyWithImpl<$Res, _$AnimalStatusCountModelImpl>
    implements _$$AnimalStatusCountModelImplCopyWith<$Res> {
  __$$AnimalStatusCountModelImplCopyWithImpl(
    _$AnimalStatusCountModelImpl _value,
    $Res Function(_$AnimalStatusCountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimalStatusCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? count = null}) {
    return _then(
      _$AnimalStatusCountModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimalStatusCountModelImpl implements _AnimalStatusCountModel {
  const _$AnimalStatusCountModelImpl({
    required this.status,
    required this.count,
  });

  factory _$AnimalStatusCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimalStatusCountModelImplFromJson(json);

  @override
  final String status;
  @override
  final int count;

  @override
  String toString() {
    return 'AnimalStatusCountModel(status: $status, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimalStatusCountModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, count);

  /// Create a copy of AnimalStatusCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimalStatusCountModelImplCopyWith<_$AnimalStatusCountModelImpl>
  get copyWith =>
      __$$AnimalStatusCountModelImplCopyWithImpl<_$AnimalStatusCountModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimalStatusCountModelImplToJson(this);
  }
}

abstract class _AnimalStatusCountModel implements AnimalStatusCountModel {
  const factory _AnimalStatusCountModel({
    required final String status,
    required final int count,
  }) = _$AnimalStatusCountModelImpl;

  factory _AnimalStatusCountModel.fromJson(Map<String, dynamic> json) =
      _$AnimalStatusCountModelImpl.fromJson;

  @override
  String get status;
  @override
  int get count;

  /// Create a copy of AnimalStatusCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimalStatusCountModelImplCopyWith<_$AnimalStatusCountModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DashboardStatsModel _$DashboardStatsModelFromJson(Map<String, dynamic> json) {
  return _DashboardStatsModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardStatsModel {
  @JsonKey(name: 'today_milk_litres')
  double get todayMilkLitres => throw _privateConstructorUsedError;
  @JsonKey(name: 'milk_revenue_30d')
  double get milkRevenue30d => throw _privateConstructorUsedError;
  @JsonKey(name: 'feed_cost_30d')
  double get feedCost30d => throw _privateConstructorUsedError;
  List<DailyTrendModel> get trend => throw _privateConstructorUsedError;
  List<TopProducerModel> get topProducers => throw _privateConstructorUsedError;
  List<AnimalStatusCountModel> get statusCounts =>
      throw _privateConstructorUsedError;

  /// Serializes this DashboardStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsModelCopyWith<DashboardStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsModelCopyWith<$Res> {
  factory $DashboardStatsModelCopyWith(
    DashboardStatsModel value,
    $Res Function(DashboardStatsModel) then,
  ) = _$DashboardStatsModelCopyWithImpl<$Res, DashboardStatsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'today_milk_litres') double todayMilkLitres,
    @JsonKey(name: 'milk_revenue_30d') double milkRevenue30d,
    @JsonKey(name: 'feed_cost_30d') double feedCost30d,
    List<DailyTrendModel> trend,
    List<TopProducerModel> topProducers,
    List<AnimalStatusCountModel> statusCounts,
  });
}

/// @nodoc
class _$DashboardStatsModelCopyWithImpl<$Res, $Val extends DashboardStatsModel>
    implements $DashboardStatsModelCopyWith<$Res> {
  _$DashboardStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayMilkLitres = null,
    Object? milkRevenue30d = null,
    Object? feedCost30d = null,
    Object? trend = null,
    Object? topProducers = null,
    Object? statusCounts = null,
  }) {
    return _then(
      _value.copyWith(
            todayMilkLitres: null == todayMilkLitres
                ? _value.todayMilkLitres
                : todayMilkLitres // ignore: cast_nullable_to_non_nullable
                      as double,
            milkRevenue30d: null == milkRevenue30d
                ? _value.milkRevenue30d
                : milkRevenue30d // ignore: cast_nullable_to_non_nullable
                      as double,
            feedCost30d: null == feedCost30d
                ? _value.feedCost30d
                : feedCost30d // ignore: cast_nullable_to_non_nullable
                      as double,
            trend: null == trend
                ? _value.trend
                : trend // ignore: cast_nullable_to_non_nullable
                      as List<DailyTrendModel>,
            topProducers: null == topProducers
                ? _value.topProducers
                : topProducers // ignore: cast_nullable_to_non_nullable
                      as List<TopProducerModel>,
            statusCounts: null == statusCounts
                ? _value.statusCounts
                : statusCounts // ignore: cast_nullable_to_non_nullable
                      as List<AnimalStatusCountModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardStatsModelImplCopyWith<$Res>
    implements $DashboardStatsModelCopyWith<$Res> {
  factory _$$DashboardStatsModelImplCopyWith(
    _$DashboardStatsModelImpl value,
    $Res Function(_$DashboardStatsModelImpl) then,
  ) = __$$DashboardStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'today_milk_litres') double todayMilkLitres,
    @JsonKey(name: 'milk_revenue_30d') double milkRevenue30d,
    @JsonKey(name: 'feed_cost_30d') double feedCost30d,
    List<DailyTrendModel> trend,
    List<TopProducerModel> topProducers,
    List<AnimalStatusCountModel> statusCounts,
  });
}

/// @nodoc
class __$$DashboardStatsModelImplCopyWithImpl<$Res>
    extends _$DashboardStatsModelCopyWithImpl<$Res, _$DashboardStatsModelImpl>
    implements _$$DashboardStatsModelImplCopyWith<$Res> {
  __$$DashboardStatsModelImplCopyWithImpl(
    _$DashboardStatsModelImpl _value,
    $Res Function(_$DashboardStatsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayMilkLitres = null,
    Object? milkRevenue30d = null,
    Object? feedCost30d = null,
    Object? trend = null,
    Object? topProducers = null,
    Object? statusCounts = null,
  }) {
    return _then(
      _$DashboardStatsModelImpl(
        todayMilkLitres: null == todayMilkLitres
            ? _value.todayMilkLitres
            : todayMilkLitres // ignore: cast_nullable_to_non_nullable
                  as double,
        milkRevenue30d: null == milkRevenue30d
            ? _value.milkRevenue30d
            : milkRevenue30d // ignore: cast_nullable_to_non_nullable
                  as double,
        feedCost30d: null == feedCost30d
            ? _value.feedCost30d
            : feedCost30d // ignore: cast_nullable_to_non_nullable
                  as double,
        trend: null == trend
            ? _value._trend
            : trend // ignore: cast_nullable_to_non_nullable
                  as List<DailyTrendModel>,
        topProducers: null == topProducers
            ? _value._topProducers
            : topProducers // ignore: cast_nullable_to_non_nullable
                  as List<TopProducerModel>,
        statusCounts: null == statusCounts
            ? _value._statusCounts
            : statusCounts // ignore: cast_nullable_to_non_nullable
                  as List<AnimalStatusCountModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsModelImpl implements _DashboardStatsModel {
  const _$DashboardStatsModelImpl({
    @JsonKey(name: 'today_milk_litres') required this.todayMilkLitres,
    @JsonKey(name: 'milk_revenue_30d') required this.milkRevenue30d,
    @JsonKey(name: 'feed_cost_30d') required this.feedCost30d,
    final List<DailyTrendModel> trend = const [],
    final List<TopProducerModel> topProducers = const [],
    final List<AnimalStatusCountModel> statusCounts = const [],
  }) : _trend = trend,
       _topProducers = topProducers,
       _statusCounts = statusCounts;

  factory _$DashboardStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'today_milk_litres')
  final double todayMilkLitres;
  @override
  @JsonKey(name: 'milk_revenue_30d')
  final double milkRevenue30d;
  @override
  @JsonKey(name: 'feed_cost_30d')
  final double feedCost30d;
  final List<DailyTrendModel> _trend;
  @override
  @JsonKey()
  List<DailyTrendModel> get trend {
    if (_trend is EqualUnmodifiableListView) return _trend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trend);
  }

  final List<TopProducerModel> _topProducers;
  @override
  @JsonKey()
  List<TopProducerModel> get topProducers {
    if (_topProducers is EqualUnmodifiableListView) return _topProducers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topProducers);
  }

  final List<AnimalStatusCountModel> _statusCounts;
  @override
  @JsonKey()
  List<AnimalStatusCountModel> get statusCounts {
    if (_statusCounts is EqualUnmodifiableListView) return _statusCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusCounts);
  }

  @override
  String toString() {
    return 'DashboardStatsModel(todayMilkLitres: $todayMilkLitres, milkRevenue30d: $milkRevenue30d, feedCost30d: $feedCost30d, trend: $trend, topProducers: $topProducers, statusCounts: $statusCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsModelImpl &&
            (identical(other.todayMilkLitres, todayMilkLitres) ||
                other.todayMilkLitres == todayMilkLitres) &&
            (identical(other.milkRevenue30d, milkRevenue30d) ||
                other.milkRevenue30d == milkRevenue30d) &&
            (identical(other.feedCost30d, feedCost30d) ||
                other.feedCost30d == feedCost30d) &&
            const DeepCollectionEquality().equals(other._trend, _trend) &&
            const DeepCollectionEquality().equals(
              other._topProducers,
              _topProducers,
            ) &&
            const DeepCollectionEquality().equals(
              other._statusCounts,
              _statusCounts,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    todayMilkLitres,
    milkRevenue30d,
    feedCost30d,
    const DeepCollectionEquality().hash(_trend),
    const DeepCollectionEquality().hash(_topProducers),
    const DeepCollectionEquality().hash(_statusCounts),
  );

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsModelImplCopyWith<_$DashboardStatsModelImpl> get copyWith =>
      __$$DashboardStatsModelImplCopyWithImpl<_$DashboardStatsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsModelImplToJson(this);
  }
}

abstract class _DashboardStatsModel implements DashboardStatsModel {
  const factory _DashboardStatsModel({
    @JsonKey(name: 'today_milk_litres') required final double todayMilkLitres,
    @JsonKey(name: 'milk_revenue_30d') required final double milkRevenue30d,
    @JsonKey(name: 'feed_cost_30d') required final double feedCost30d,
    final List<DailyTrendModel> trend,
    final List<TopProducerModel> topProducers,
    final List<AnimalStatusCountModel> statusCounts,
  }) = _$DashboardStatsModelImpl;

  factory _DashboardStatsModel.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'today_milk_litres')
  double get todayMilkLitres;
  @override
  @JsonKey(name: 'milk_revenue_30d')
  double get milkRevenue30d;
  @override
  @JsonKey(name: 'feed_cost_30d')
  double get feedCost30d;
  @override
  List<DailyTrendModel> get trend;
  @override
  List<TopProducerModel> get topProducers;
  @override
  List<AnimalStatusCountModel> get statusCounts;

  /// Create a copy of DashboardStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsModelImplCopyWith<_$DashboardStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportRowModel _$ReportRowModelFromJson(Map<String, dynamic> json) {
  return _ReportRowModel.fromJson(json);
}

/// @nodoc
mixin _$ReportRowModel {
  @JsonKey(name: 'group_label')
  String get groupLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_litres')
  double get totalLitres => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_count')
  int get sessionCount => throw _privateConstructorUsedError;

  /// Serializes this ReportRowModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportRowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportRowModelCopyWith<ReportRowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportRowModelCopyWith<$Res> {
  factory $ReportRowModelCopyWith(
    ReportRowModel value,
    $Res Function(ReportRowModel) then,
  ) = _$ReportRowModelCopyWithImpl<$Res, ReportRowModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'group_label') String groupLabel,
    @JsonKey(name: 'total_litres') double totalLitres,
    @JsonKey(name: 'session_count') int sessionCount,
  });
}

/// @nodoc
class _$ReportRowModelCopyWithImpl<$Res, $Val extends ReportRowModel>
    implements $ReportRowModelCopyWith<$Res> {
  _$ReportRowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportRowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupLabel = null,
    Object? totalLitres = null,
    Object? sessionCount = null,
  }) {
    return _then(
      _value.copyWith(
            groupLabel: null == groupLabel
                ? _value.groupLabel
                : groupLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            totalLitres: null == totalLitres
                ? _value.totalLitres
                : totalLitres // ignore: cast_nullable_to_non_nullable
                      as double,
            sessionCount: null == sessionCount
                ? _value.sessionCount
                : sessionCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportRowModelImplCopyWith<$Res>
    implements $ReportRowModelCopyWith<$Res> {
  factory _$$ReportRowModelImplCopyWith(
    _$ReportRowModelImpl value,
    $Res Function(_$ReportRowModelImpl) then,
  ) = __$$ReportRowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'group_label') String groupLabel,
    @JsonKey(name: 'total_litres') double totalLitres,
    @JsonKey(name: 'session_count') int sessionCount,
  });
}

/// @nodoc
class __$$ReportRowModelImplCopyWithImpl<$Res>
    extends _$ReportRowModelCopyWithImpl<$Res, _$ReportRowModelImpl>
    implements _$$ReportRowModelImplCopyWith<$Res> {
  __$$ReportRowModelImplCopyWithImpl(
    _$ReportRowModelImpl _value,
    $Res Function(_$ReportRowModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportRowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupLabel = null,
    Object? totalLitres = null,
    Object? sessionCount = null,
  }) {
    return _then(
      _$ReportRowModelImpl(
        groupLabel: null == groupLabel
            ? _value.groupLabel
            : groupLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        totalLitres: null == totalLitres
            ? _value.totalLitres
            : totalLitres // ignore: cast_nullable_to_non_nullable
                  as double,
        sessionCount: null == sessionCount
            ? _value.sessionCount
            : sessionCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportRowModelImpl implements _ReportRowModel {
  const _$ReportRowModelImpl({
    @JsonKey(name: 'group_label') required this.groupLabel,
    @JsonKey(name: 'total_litres') required this.totalLitres,
    @JsonKey(name: 'session_count') required this.sessionCount,
  });

  factory _$ReportRowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportRowModelImplFromJson(json);

  @override
  @JsonKey(name: 'group_label')
  final String groupLabel;
  @override
  @JsonKey(name: 'total_litres')
  final double totalLitres;
  @override
  @JsonKey(name: 'session_count')
  final int sessionCount;

  @override
  String toString() {
    return 'ReportRowModel(groupLabel: $groupLabel, totalLitres: $totalLitres, sessionCount: $sessionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportRowModelImpl &&
            (identical(other.groupLabel, groupLabel) ||
                other.groupLabel == groupLabel) &&
            (identical(other.totalLitres, totalLitres) ||
                other.totalLitres == totalLitres) &&
            (identical(other.sessionCount, sessionCount) ||
                other.sessionCount == sessionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, groupLabel, totalLitres, sessionCount);

  /// Create a copy of ReportRowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportRowModelImplCopyWith<_$ReportRowModelImpl> get copyWith =>
      __$$ReportRowModelImplCopyWithImpl<_$ReportRowModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportRowModelImplToJson(this);
  }
}

abstract class _ReportRowModel implements ReportRowModel {
  const factory _ReportRowModel({
    @JsonKey(name: 'group_label') required final String groupLabel,
    @JsonKey(name: 'total_litres') required final double totalLitres,
    @JsonKey(name: 'session_count') required final int sessionCount,
  }) = _$ReportRowModelImpl;

  factory _ReportRowModel.fromJson(Map<String, dynamic> json) =
      _$ReportRowModelImpl.fromJson;

  @override
  @JsonKey(name: 'group_label')
  String get groupLabel;
  @override
  @JsonKey(name: 'total_litres')
  double get totalLitres;
  @override
  @JsonKey(name: 'session_count')
  int get sessionCount;

  /// Create a copy of ReportRowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportRowModelImplCopyWith<_$ReportRowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
