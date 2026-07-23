import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_record_model.freezed.dart';
part 'feed_record_model.g.dart';

@freezed
class FeedRecordModel with _$FeedRecordModel {
  const factory FeedRecordModel({
    required String id,
    @JsonKey(name: 'farm_id') required String farmId,
    @JsonKey(name: 'animal_id') String? animalId, // Null means farm-wide
    @JsonKey(name: 'feed_type') required String feedTypeId,
    @JsonKey(name: 'quantity_kg') required double quantityKg,
    required double cost,
    @JsonKey(name: 'recorded_at') required DateTime recordedAt,
    @JsonKey(name: 'recorded_by') String? recordedBy,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _FeedRecordModel;

  factory FeedRecordModel.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordModelFromJson(json);
}
