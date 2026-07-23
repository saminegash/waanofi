// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyTrendModelImpl _$$DailyTrendModelImplFromJson(
  Map<String, dynamic> json,
) => _$DailyTrendModelImpl(
  date: DateTime.parse(json['date'] as String),
  litres: (json['litres'] as num).toDouble(),
);

Map<String, dynamic> _$$DailyTrendModelImplToJson(
  _$DailyTrendModelImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'litres': instance.litres,
};

_$TopProducerModelImpl _$$TopProducerModelImplFromJson(
  Map<String, dynamic> json,
) => _$TopProducerModelImpl(
  animalId: json['animal_id'] as String,
  tagNumber: json['tag_number'] as String,
  name: json['name'] as String?,
  totalLitres: (json['total_litres'] as num).toDouble(),
);

Map<String, dynamic> _$$TopProducerModelImplToJson(
  _$TopProducerModelImpl instance,
) => <String, dynamic>{
  'animal_id': instance.animalId,
  'tag_number': instance.tagNumber,
  'name': instance.name,
  'total_litres': instance.totalLitres,
};

_$AnimalStatusCountModelImpl _$$AnimalStatusCountModelImplFromJson(
  Map<String, dynamic> json,
) => _$AnimalStatusCountModelImpl(
  status: json['status'] as String,
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$$AnimalStatusCountModelImplToJson(
  _$AnimalStatusCountModelImpl instance,
) => <String, dynamic>{'status': instance.status, 'count': instance.count};

_$DashboardStatsModelImpl _$$DashboardStatsModelImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardStatsModelImpl(
  todayMilkLitres: (json['today_milk_litres'] as num).toDouble(),
  milkRevenue30d: (json['milk_revenue_30d'] as num).toDouble(),
  feedCost30d: (json['feed_cost_30d'] as num).toDouble(),
  trend:
      (json['trend'] as List<dynamic>?)
          ?.map((e) => DailyTrendModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  topProducers:
      (json['topProducers'] as List<dynamic>?)
          ?.map((e) => TopProducerModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  statusCounts:
      (json['statusCounts'] as List<dynamic>?)
          ?.map(
            (e) => AnimalStatusCountModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DashboardStatsModelImplToJson(
  _$DashboardStatsModelImpl instance,
) => <String, dynamic>{
  'today_milk_litres': instance.todayMilkLitres,
  'milk_revenue_30d': instance.milkRevenue30d,
  'feed_cost_30d': instance.feedCost30d,
  'trend': instance.trend,
  'topProducers': instance.topProducers,
  'statusCounts': instance.statusCounts,
};

_$ReportRowModelImpl _$$ReportRowModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportRowModelImpl(
      groupLabel: json['group_label'] as String,
      totalLitres: (json['total_litres'] as num).toDouble(),
      sessionCount: (json['session_count'] as num).toInt(),
    );

Map<String, dynamic> _$$ReportRowModelImplToJson(
  _$ReportRowModelImpl instance,
) => <String, dynamic>{
  'group_label': instance.groupLabel,
  'total_litres': instance.totalLitres,
  'session_count': instance.sessionCount,
};
