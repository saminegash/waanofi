// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuditLogModel _$AuditLogModelFromJson(Map<String, dynamic> json) {
  return _AuditLogModel.fromJson(json);
}

/// @nodoc
mixin _$AuditLogModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'farm_id')
  String get farmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_name')
  String get tableName => throw _privateConstructorUsedError;
  @JsonKey(name: 'record_id')
  String get recordId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_data')
  Map<String, dynamic>? get oldData => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_data')
  Map<String, dynamic>? get newData => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_by')
  String? get changedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'changed_at')
  DateTime get changedAt => throw _privateConstructorUsedError; // Joined field for display
  String? get changedByFullName => throw _privateConstructorUsedError;

  /// Serializes this AuditLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuditLogModelCopyWith<AuditLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditLogModelCopyWith<$Res> {
  factory $AuditLogModelCopyWith(
    AuditLogModel value,
    $Res Function(AuditLogModel) then,
  ) = _$AuditLogModelCopyWithImpl<$Res, AuditLogModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'table_name') String tableName,
    @JsonKey(name: 'record_id') String recordId,
    String action,
    @JsonKey(name: 'old_data') Map<String, dynamic>? oldData,
    @JsonKey(name: 'new_data') Map<String, dynamic>? newData,
    @JsonKey(name: 'changed_by') String? changedBy,
    @JsonKey(name: 'changed_at') DateTime changedAt,
    String? changedByFullName,
  });
}

/// @nodoc
class _$AuditLogModelCopyWithImpl<$Res, $Val extends AuditLogModel>
    implements $AuditLogModelCopyWith<$Res> {
  _$AuditLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tableName = null,
    Object? recordId = null,
    Object? action = null,
    Object? oldData = freezed,
    Object? newData = freezed,
    Object? changedBy = freezed,
    Object? changedAt = null,
    Object? changedByFullName = freezed,
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
            tableName: null == tableName
                ? _value.tableName
                : tableName // ignore: cast_nullable_to_non_nullable
                      as String,
            recordId: null == recordId
                ? _value.recordId
                : recordId // ignore: cast_nullable_to_non_nullable
                      as String,
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as String,
            oldData: freezed == oldData
                ? _value.oldData
                : oldData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            newData: freezed == newData
                ? _value.newData
                : newData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            changedBy: freezed == changedBy
                ? _value.changedBy
                : changedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            changedAt: null == changedAt
                ? _value.changedAt
                : changedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            changedByFullName: freezed == changedByFullName
                ? _value.changedByFullName
                : changedByFullName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuditLogModelImplCopyWith<$Res>
    implements $AuditLogModelCopyWith<$Res> {
  factory _$$AuditLogModelImplCopyWith(
    _$AuditLogModelImpl value,
    $Res Function(_$AuditLogModelImpl) then,
  ) = __$$AuditLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'farm_id') String farmId,
    @JsonKey(name: 'table_name') String tableName,
    @JsonKey(name: 'record_id') String recordId,
    String action,
    @JsonKey(name: 'old_data') Map<String, dynamic>? oldData,
    @JsonKey(name: 'new_data') Map<String, dynamic>? newData,
    @JsonKey(name: 'changed_by') String? changedBy,
    @JsonKey(name: 'changed_at') DateTime changedAt,
    String? changedByFullName,
  });
}

/// @nodoc
class __$$AuditLogModelImplCopyWithImpl<$Res>
    extends _$AuditLogModelCopyWithImpl<$Res, _$AuditLogModelImpl>
    implements _$$AuditLogModelImplCopyWith<$Res> {
  __$$AuditLogModelImplCopyWithImpl(
    _$AuditLogModelImpl _value,
    $Res Function(_$AuditLogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? farmId = null,
    Object? tableName = null,
    Object? recordId = null,
    Object? action = null,
    Object? oldData = freezed,
    Object? newData = freezed,
    Object? changedBy = freezed,
    Object? changedAt = null,
    Object? changedByFullName = freezed,
  }) {
    return _then(
      _$AuditLogModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        farmId: null == farmId
            ? _value.farmId
            : farmId // ignore: cast_nullable_to_non_nullable
                  as String,
        tableName: null == tableName
            ? _value.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String,
        recordId: null == recordId
            ? _value.recordId
            : recordId // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as String,
        oldData: freezed == oldData
            ? _value._oldData
            : oldData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        newData: freezed == newData
            ? _value._newData
            : newData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        changedBy: freezed == changedBy
            ? _value.changedBy
            : changedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        changedAt: null == changedAt
            ? _value.changedAt
            : changedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        changedByFullName: freezed == changedByFullName
            ? _value.changedByFullName
            : changedByFullName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditLogModelImpl implements _AuditLogModel {
  const _$AuditLogModelImpl({
    required this.id,
    @JsonKey(name: 'farm_id') required this.farmId,
    @JsonKey(name: 'table_name') required this.tableName,
    @JsonKey(name: 'record_id') required this.recordId,
    required this.action,
    @JsonKey(name: 'old_data') final Map<String, dynamic>? oldData,
    @JsonKey(name: 'new_data') final Map<String, dynamic>? newData,
    @JsonKey(name: 'changed_by') this.changedBy,
    @JsonKey(name: 'changed_at') required this.changedAt,
    this.changedByFullName,
  }) : _oldData = oldData,
       _newData = newData;

  factory _$AuditLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditLogModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'farm_id')
  final String farmId;
  @override
  @JsonKey(name: 'table_name')
  final String tableName;
  @override
  @JsonKey(name: 'record_id')
  final String recordId;
  @override
  final String action;
  final Map<String, dynamic>? _oldData;
  @override
  @JsonKey(name: 'old_data')
  Map<String, dynamic>? get oldData {
    final value = _oldData;
    if (value == null) return null;
    if (_oldData is EqualUnmodifiableMapView) return _oldData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _newData;
  @override
  @JsonKey(name: 'new_data')
  Map<String, dynamic>? get newData {
    final value = _newData;
    if (value == null) return null;
    if (_newData is EqualUnmodifiableMapView) return _newData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'changed_by')
  final String? changedBy;
  @override
  @JsonKey(name: 'changed_at')
  final DateTime changedAt;
  // Joined field for display
  @override
  final String? changedByFullName;

  @override
  String toString() {
    return 'AuditLogModel(id: $id, farmId: $farmId, tableName: $tableName, recordId: $recordId, action: $action, oldData: $oldData, newData: $newData, changedBy: $changedBy, changedAt: $changedAt, changedByFullName: $changedByFullName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditLogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.farmId, farmId) || other.farmId == farmId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._oldData, _oldData) &&
            const DeepCollectionEquality().equals(other._newData, _newData) &&
            (identical(other.changedBy, changedBy) ||
                other.changedBy == changedBy) &&
            (identical(other.changedAt, changedAt) ||
                other.changedAt == changedAt) &&
            (identical(other.changedByFullName, changedByFullName) ||
                other.changedByFullName == changedByFullName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    farmId,
    tableName,
    recordId,
    action,
    const DeepCollectionEquality().hash(_oldData),
    const DeepCollectionEquality().hash(_newData),
    changedBy,
    changedAt,
    changedByFullName,
  );

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditLogModelImplCopyWith<_$AuditLogModelImpl> get copyWith =>
      __$$AuditLogModelImplCopyWithImpl<_$AuditLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditLogModelImplToJson(this);
  }
}

abstract class _AuditLogModel implements AuditLogModel {
  const factory _AuditLogModel({
    required final String id,
    @JsonKey(name: 'farm_id') required final String farmId,
    @JsonKey(name: 'table_name') required final String tableName,
    @JsonKey(name: 'record_id') required final String recordId,
    required final String action,
    @JsonKey(name: 'old_data') final Map<String, dynamic>? oldData,
    @JsonKey(name: 'new_data') final Map<String, dynamic>? newData,
    @JsonKey(name: 'changed_by') final String? changedBy,
    @JsonKey(name: 'changed_at') required final DateTime changedAt,
    final String? changedByFullName,
  }) = _$AuditLogModelImpl;

  factory _AuditLogModel.fromJson(Map<String, dynamic> json) =
      _$AuditLogModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'farm_id')
  String get farmId;
  @override
  @JsonKey(name: 'table_name')
  String get tableName;
  @override
  @JsonKey(name: 'record_id')
  String get recordId;
  @override
  String get action;
  @override
  @JsonKey(name: 'old_data')
  Map<String, dynamic>? get oldData;
  @override
  @JsonKey(name: 'new_data')
  Map<String, dynamic>? get newData;
  @override
  @JsonKey(name: 'changed_by')
  String? get changedBy;
  @override
  @JsonKey(name: 'changed_at')
  DateTime get changedAt; // Joined field for display
  @override
  String? get changedByFullName;

  /// Create a copy of AuditLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuditLogModelImplCopyWith<_$AuditLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
