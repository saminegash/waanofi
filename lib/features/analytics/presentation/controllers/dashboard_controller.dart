import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/analytics_repository.dart';
import '../../domain/dashboard_stats_model.dart';

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, AsyncValue<DashboardStatsModel>>(
        (ref) {
  final repo = ref.watch(analyticsRepositoryProvider);
  return DashboardController(repo);
});

class DashboardController extends StateNotifier<AsyncValue<DashboardStatsModel>> {
  DashboardController(this._repo) : super(const AsyncLoading()) {
    refresh();
  }

  final AnalyticsRepository _repo;

  Future<void> refresh() async {
    state = const AsyncLoading();
    try {
      final stats = await _repo.getDashboardStats();
      if (mounted) state = AsyncData(stats);
    } catch (e, st) {
      if (mounted) state = AsyncError(e, st);
    }
  }
}
