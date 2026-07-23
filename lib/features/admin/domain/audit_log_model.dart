import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_log_model.freezed.dart';
part 'audit_log_model.g.dart';

@freezed
class AuditLogModel with _$AuditLogModel {
  const factory AuditLogModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'table_name') required String tableName,
    @JsonKey(name: 'record_id') required String recordId,
    required String action,
    @JsonKey(name: 'old_data') Map<String, dynamic>? oldData,
    @JsonKey(name: 'new_data') Map<String, dynamic>? newData,
    @JsonKey(name: 'changed_by') String? changedBy,
    @JsonKey(name: 'changed_at') required DateTime changedAt,
    // Joined field for display
    String? changedByFullName, 
  }) = _AuditLogModel;

  factory AuditLogModel.fromJson(Map<String, dynamic> json) =>
      _$AuditLogModelFromJson(json);
}
