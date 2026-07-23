import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../domain/dashboard_stats_model.dart';

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  final user = ref.watch(currentUserProvider);
  return AnalyticsRepository(
    client: Supabase.instance.client,
    farmId: user?.farmId,
  );
});

class AnalyticsRepository {
  AnalyticsRepository({
    required SupabaseClient client,
    required String? farmId,
  })  : _client = client,
        _farmId = farmId;

  final SupabaseClient _client;
  final String? _farmId;

  Future<DashboardStatsModel> getDashboardStats() async {
    if (_farmId == null) throw Exception('No farm selected');

    // 1. Get primary stats from the RPC
    final statsResponse = await _client.rpc('get_dashboard_stats', params: {'p_farm_id': _farmId});
    final Map<String, dynamic> statsMap = Map<String, dynamic>.from(statsResponse);

    // 2. Get top producers
    final topProducersResponse = await _client.rpc('get_top_producers', params: {'p_farm_id': _farmId, 'p_limit': 5});
    final List topProducersList = List.from(topProducersResponse);
    statsMap['topProducers'] = topProducersList;

    // 3. Get status counts from the view
    final statusResponse = await _client.from('farm_animal_status_counts').select('status, count').eq('farm_id', _farmId);
    final List statusList = List.from(statusResponse);
    statsMap['statusCounts'] = statusList;

    return DashboardStatsModel.fromJson(statsMap);
  }

  Future<List<ReportRowModel>> generateMilkReport({
    required DateTime start,
    required DateTime end,
    required String groupBy, // 'animal', 'day', 'month'
  }) async {
    if (_farmId == null) throw Exception('No farm selected');

    final response = await _client.rpc('generate_milk_report', params: {
      'p_farm_id': _farmId,
      'p_start_date': start.toIso8601String().split('T').first,
      'p_end_date': end.toIso8601String().split('T').first,
      'p_group_by': groupBy,
    });

    final list = List.from(response);
    return list.map((e) => ReportRowModel.fromJson(Map<String, dynamic>.from(e))).toList();
  }
}
