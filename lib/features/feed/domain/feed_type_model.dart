import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_type_model.freezed.dart';
part 'feed_type_model.g.dart';

@freezed
class FeedTypeModel with _$FeedTypeModel {
  const factory FeedTypeModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    required String name,
    required String unit,
    @JsonKey(name: 'unit_cost') required double unitCost,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _FeedTypeModel;

  factory FeedTypeModel.fromJson(Map<String, dynamic> json) =>
      _$FeedTypeModelFromJson(json);
}
