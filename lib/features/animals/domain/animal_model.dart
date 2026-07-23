import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_model.freezed.dart';
part 'animal_model.g.dart';

@freezed
class AnimalModel with _$AnimalModel {
  const factory AnimalModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'tag_number') required String tagNumber,
    String? name,
    String? breed,
    required String sex,
    DateTime? dob,
    required String status,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _AnimalModel;

  factory AnimalModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalModelFromJson(json);
}
