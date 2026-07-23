import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_stats_model.freezed.dart';
part 'dashboard_stats_model.g.dart';

@freezed
class DailyTrendModel with _$DailyTrendModel {
  const factory DailyTrendModel({
    required DateTime date,
    required double litres,
  }) = _DailyTrendModel;

  factory DailyTrendModel.fromJson(Map<String, dynamic> json) =>
      _$DailyTrendModelFromJson(json);
}

@freezed
class TopProducerModel with _$TopProducerModel {
  const factory TopProducerModel({
    @JsonKey(name: 'animal_id') required String animalId,
    @JsonKey(name: 'tag_number') required String tagNumber,
    String? name,
    @JsonKey(name: 'total_litres') required double totalLitres,
  }) = _TopProducerModel;

  factory TopProducerModel.fromJson(Map<String, dynamic> json) =>
      _$TopProducerModelFromJson(json);
}

@freezed
class AnimalStatusCountModel with _$AnimalStatusCountModel {
  const factory AnimalStatusCountModel({
    required String status,
    required int count,
  }) = _AnimalStatusCountModel;

  factory AnimalStatusCountModel.fromJson(Map<String, dynamic> json) =>
      _$AnimalStatusCountModelFromJson(json);
}

@freezed
class DashboardStatsModel with _$DashboardStatsModel {
  const factory DashboardStatsModel({
    @JsonKey(name: 'today_milk_litres') required double todayMilkLitres,
    @JsonKey(name: 'milk_revenue_30d') required double milkRevenue30d,
    @JsonKey(name: 'feed_cost_30d') required double feedCost30d,
    @Default([]) List<DailyTrendModel> trend,
    @Default([]) List<TopProducerModel> topProducers,
    @Default([]) List<AnimalStatusCountModel> statusCounts,
  }) = _DashboardStatsModel;

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsModelFromJson(json);
}

@freezed
class ReportRowModel with _$ReportRowModel {
  const factory ReportRowModel({
    @JsonKey(name: 'group_label') required String groupLabel,
    @JsonKey(name: 'total_litres') required double totalLitres,
    @JsonKey(name: 'session_count') required int sessionCount,
  }) = _ReportRowModel;

  factory ReportRowModel.fromJson(Map<String, dynamic> json) =>
      _$ReportRowModelFromJson(json);
}
