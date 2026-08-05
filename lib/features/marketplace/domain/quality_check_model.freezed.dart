// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quality_check_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QualityCheckModel _$QualityCheckModelFromJson(Map<String, dynamic> json) {
  return _QualityCheckModel.fromJson(json);
}

/// @nodoc
mixin _$QualityCheckModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_id')
  String get batchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_type')
  String get checkType => throw _privateConstructorUsedError;
  String get result =>
      throw _privateConstructorUsedError; // 'pass', 'fail', 'conditional'
  Map<String, dynamic> get measurements => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'checked_by')
  String? get checkedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get checkedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'evidence_attachments')
  List<String> get evidenceAttachments => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_status')
  String get approvalStatus => throw _privateConstructorUsedError;

  /// Serializes this QualityCheckModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QualityCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityCheckModelCopyWith<QualityCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityCheckModelCopyWith<$Res> {
  factory $QualityCheckModelCopyWith(
    QualityCheckModel value,
    $Res Function(QualityCheckModel) then,
  ) = _$QualityCheckModelCopyWithImpl<$Res, QualityCheckModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'batch_id') String batchId,
    @JsonKey(name: 'check_type') String checkType,
    String result,
    Map<String, dynamic> measurements,
    String? notes,
    @JsonKey(name: 'checked_by') String? checkedBy,
    @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime checkedAt,
    @JsonKey(name: 'evidence_attachments') List<String> evidenceAttachments,
    @JsonKey(name: 'approval_status') String approvalStatus,
  });
}

/// @nodoc
class _$QualityCheckModelCopyWithImpl<$Res, $Val extends QualityCheckModel>
    implements $QualityCheckModelCopyWith<$Res> {
  _$QualityCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? checkType = null,
    Object? result = null,
    Object? measurements = null,
    Object? notes = freezed,
    Object? checkedBy = freezed,
    Object? checkedAt = null,
    Object? evidenceAttachments = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            batchId: null == batchId
                ? _value.batchId
                : batchId // ignore: cast_nullable_to_non_nullable
                      as String,
            checkType: null == checkType
                ? _value.checkType
                : checkType // ignore: cast_nullable_to_non_nullable
                      as String,
            result: null == result
                ? _value.result
                : result // ignore: cast_nullable_to_non_nullable
                      as String,
            measurements: null == measurements
                ? _value.measurements
                : measurements // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkedBy: freezed == checkedBy
                ? _value.checkedBy
                : checkedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkedAt: null == checkedAt
                ? _value.checkedAt
                : checkedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            evidenceAttachments: null == evidenceAttachments
                ? _value.evidenceAttachments
                : evidenceAttachments // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            approvalStatus: null == approvalStatus
                ? _value.approvalStatus
                : approvalStatus // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QualityCheckModelImplCopyWith<$Res>
    implements $QualityCheckModelCopyWith<$Res> {
  factory _$$QualityCheckModelImplCopyWith(
    _$QualityCheckModelImpl value,
    $Res Function(_$QualityCheckModelImpl) then,
  ) = __$$QualityCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'batch_id') String batchId,
    @JsonKey(name: 'check_type') String checkType,
    String result,
    Map<String, dynamic> measurements,
    String? notes,
    @JsonKey(name: 'checked_by') String? checkedBy,
    @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
    DateTime checkedAt,
    @JsonKey(name: 'evidence_attachments') List<String> evidenceAttachments,
    @JsonKey(name: 'approval_status') String approvalStatus,
  });
}

/// @nodoc
class __$$QualityCheckModelImplCopyWithImpl<$Res>
    extends _$QualityCheckModelCopyWithImpl<$Res, _$QualityCheckModelImpl>
    implements _$$QualityCheckModelImplCopyWith<$Res> {
  __$$QualityCheckModelImplCopyWithImpl(
    _$QualityCheckModelImpl _value,
    $Res Function(_$QualityCheckModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QualityCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? batchId = null,
    Object? checkType = null,
    Object? result = null,
    Object? measurements = null,
    Object? notes = freezed,
    Object? checkedBy = freezed,
    Object? checkedAt = null,
    Object? evidenceAttachments = null,
    Object? approvalStatus = null,
  }) {
    return _then(
      _$QualityCheckModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        batchId: null == batchId
            ? _value.batchId
            : batchId // ignore: cast_nullable_to_non_nullable
                  as String,
        checkType: null == checkType
            ? _value.checkType
            : checkType // ignore: cast_nullable_to_non_nullable
                  as String,
        result: null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as String,
        measurements: null == measurements
            ? _value._measurements
            : measurements // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkedBy: freezed == checkedBy
            ? _value.checkedBy
            : checkedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkedAt: null == checkedAt
            ? _value.checkedAt
            : checkedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        evidenceAttachments: null == evidenceAttachments
            ? _value._evidenceAttachments
            : evidenceAttachments // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        approvalStatus: null == approvalStatus
            ? _value.approvalStatus
            : approvalStatus // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QualityCheckModelImpl implements _QualityCheckModel {
  const _$QualityCheckModelImpl({
    required this.id,
    @JsonKey(name: 'batch_id') required this.batchId,
    @JsonKey(name: 'check_type') required this.checkType,
    required this.result,
    final Map<String, dynamic> measurements = const {},
    this.notes,
    @JsonKey(name: 'checked_by') this.checkedBy,
    @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
    required this.checkedAt,
    @JsonKey(name: 'evidence_attachments')
    final List<String> evidenceAttachments = const [],
    @JsonKey(name: 'approval_status') this.approvalStatus = 'pending',
  }) : _measurements = measurements,
       _evidenceAttachments = evidenceAttachments;

  factory _$QualityCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityCheckModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'batch_id')
  final String batchId;
  @override
  @JsonKey(name: 'check_type')
  final String checkType;
  @override
  final String result;
  // 'pass', 'fail', 'conditional'
  final Map<String, dynamic> _measurements;
  // 'pass', 'fail', 'conditional'
  @override
  @JsonKey()
  Map<String, dynamic> get measurements {
    if (_measurements is EqualUnmodifiableMapView) return _measurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_measurements);
  }

  @override
  final String? notes;
  @override
  @JsonKey(name: 'checked_by')
  final String? checkedBy;
  @override
  @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime checkedAt;
  final List<String> _evidenceAttachments;
  @override
  @JsonKey(name: 'evidence_attachments')
  List<String> get evidenceAttachments {
    if (_evidenceAttachments is EqualUnmodifiableListView)
      return _evidenceAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidenceAttachments);
  }

  @override
  @JsonKey(name: 'approval_status')
  final String approvalStatus;

  @override
  String toString() {
    return 'QualityCheckModel(id: $id, batchId: $batchId, checkType: $checkType, result: $result, measurements: $measurements, notes: $notes, checkedBy: $checkedBy, checkedAt: $checkedAt, evidenceAttachments: $evidenceAttachments, approvalStatus: $approvalStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityCheckModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.batchId, batchId) || other.batchId == batchId) &&
            (identical(other.checkType, checkType) ||
                other.checkType == checkType) &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(
              other._measurements,
              _measurements,
            ) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.checkedBy, checkedBy) ||
                other.checkedBy == checkedBy) &&
            (identical(other.checkedAt, checkedAt) ||
                other.checkedAt == checkedAt) &&
            const DeepCollectionEquality().equals(
              other._evidenceAttachments,
              _evidenceAttachments,
            ) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    batchId,
    checkType,
    result,
    const DeepCollectionEquality().hash(_measurements),
    notes,
    checkedBy,
    checkedAt,
    const DeepCollectionEquality().hash(_evidenceAttachments),
    approvalStatus,
  );

  /// Create a copy of QualityCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityCheckModelImplCopyWith<_$QualityCheckModelImpl> get copyWith =>
      __$$QualityCheckModelImplCopyWithImpl<_$QualityCheckModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QualityCheckModelImplToJson(this);
  }
}

abstract class _QualityCheckModel implements QualityCheckModel {
  const factory _QualityCheckModel({
    required final String id,
    @JsonKey(name: 'batch_id') required final String batchId,
    @JsonKey(name: 'check_type') required final String checkType,
    required final String result,
    final Map<String, dynamic> measurements,
    final String? notes,
    @JsonKey(name: 'checked_by') final String? checkedBy,
    @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
    required final DateTime checkedAt,
    @JsonKey(name: 'evidence_attachments')
    final List<String> evidenceAttachments,
    @JsonKey(name: 'approval_status') final String approvalStatus,
  }) = _$QualityCheckModelImpl;

  factory _QualityCheckModel.fromJson(Map<String, dynamic> json) =
      _$QualityCheckModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'batch_id')
  String get batchId;
  @override
  @JsonKey(name: 'check_type')
  String get checkType;
  @override
  String get result; // 'pass', 'fail', 'conditional'
  @override
  Map<String, dynamic> get measurements;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'checked_by')
  String? get checkedBy;
  @override
  @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson)
  DateTime get checkedAt;
  @override
  @JsonKey(name: 'evidence_attachments')
  List<String> get evidenceAttachments;
  @override
  @JsonKey(name: 'approval_status')
  String get approvalStatus;

  /// Create a copy of QualityCheckModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityCheckModelImplCopyWith<_$QualityCheckModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
