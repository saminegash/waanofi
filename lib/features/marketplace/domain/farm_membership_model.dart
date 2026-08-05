// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/date_formatter.dart';

part 'farm_membership_model.freezed.dart';
part 'farm_membership_model.g.dart';

enum MembershipRole {
  @JsonValue('owner') owner,
  @JsonValue('manager') manager,
  @JsonValue('worker') worker,
  @JsonValue('viewer') viewer,
  @JsonValue('admin') admin,
  @JsonValue('user') user,
  @JsonValue('guest') guest,
}

enum MembershipStatus {
  @JsonValue('invited') invited,
  @JsonValue('active') active,
  @JsonValue('suspended') suspended,
  @JsonValue('removed') removed,
}

@freezed
class FarmMembershipModel with _$FarmMembershipModel {
  const factory FarmMembershipModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'membership_role') @Default(MembershipRole.worker) MembershipRole membershipRole,
    @Default(MembershipStatus.active) MembershipStatus status,
    @JsonKey(name: 'invited_by') String? invitedBy,
    @JsonKey(name: 'joined_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime joinedAt,
    @JsonKey(name: 'created_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: dateFromJson, toJson: dateToJson) required DateTime updatedAt,
  }) = _FarmMembershipModel;

  factory FarmMembershipModel.fromJson(Map<String, dynamic> json) => _$FarmMembershipModelFromJson(json);
}

extension FarmMembershipRights on FarmMembershipModel {
  bool get canApproveBatches => membershipRole == MembershipRole.owner || membershipRole == MembershipRole.manager || membershipRole == MembershipRole.admin;
  bool get canManageListings => membershipRole == MembershipRole.owner || membershipRole == MembershipRole.manager || membershipRole == MembershipRole.admin;
}
