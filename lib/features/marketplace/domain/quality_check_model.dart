// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'quality_check_model.freezed.dart';
part 'quality_check_model.g.dart';

@freezed
class QualityCheckModel with _$QualityCheckModel {
  const factory QualityCheckModel({
    required String id,
    @JsonKey(name: 'batch_id') required String batchId,
    @JsonKey(name: 'check_type') required String checkType,
    required String result, // 'pass', 'fail', 'conditional'
    @Default({}) Map<String, dynamic> measurements,
    String? notes,
    @JsonKey(name: 'checked_by') String? checkedBy,
    @JsonKey(name: 'checked_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime checkedAt,
    @JsonKey(name: 'evidence_attachments') @Default([]) List<String> evidenceAttachments,
    @JsonKey(name: 'approval_status') @Default('pending') String approvalStatus,
  }) = _QualityCheckModel;

  factory QualityCheckModel.fromJson(Map<String, dynamic> json) => _$QualityCheckModelFromJson(json);
}

extension QualityCheckStatus on QualityCheckModel {
  bool get isPass => result.toLowerCase() == 'pass';
  bool get isFail => result.toLowerCase() == 'fail';
}
