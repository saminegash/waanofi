// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditLogModelImpl _$$AuditLogModelImplFromJson(Map<String, dynamic> json) =>
    _$AuditLogModelImpl(
      id: json['id'] as String,
      farmId: json['farm_id'] as String,
      tableName: json['table_name'] as String,
      recordId: json['record_id'] as String,
      action: json['action'] as String,
      oldData: json['old_data'] as Map<String, dynamic>?,
      newData: json['new_data'] as Map<String, dynamic>?,
      changedBy: json['changed_by'] as String?,
      changedAt: DateTime.parse(json['changed_at'] as String),
      changedByFullName: json['changedByFullName'] as String?,
    );

Map<String, dynamic> _$$AuditLogModelImplToJson(_$AuditLogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'farm_id': instance.farmId,
      'table_name': instance.tableName,
      'record_id': instance.recordId,
      'action': instance.action,
      'old_data': instance.oldData,
      'new_data': instance.newData,
      'changed_by': instance.changedBy,
      'changed_at': instance.changedAt.toIso8601String(),
      'changedByFullName': instance.changedByFullName,
    };
