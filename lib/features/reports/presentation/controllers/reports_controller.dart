import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/analytics_repository.dart';
import '../../domain/dashboard_stats_model.dart';

final reportsControllerProvider =
    StateNotifierProvider<ReportsController, ReportsState>((ref) {
  final repo = ref.watch(analyticsRepositoryProvider);
  return ReportsController(repo);
});

class ReportsState {
  const ReportsState({
    required this.startDate,
    required this.endDate,
    this.groupBy = 'day',
    this.reportData = const AsyncData([]),
  });

  final DateTime startDate;
  final DateTime endDate;
  final String groupBy; // 'animal', 'day', 'month'
  final AsyncValue<List<ReportRowModel>> reportData;

  ReportsState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? groupBy,
    AsyncValue<List<ReportRowModel>>? reportData,
  }) {
    return ReportsState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      groupBy: groupBy ?? this.groupBy,
      reportData: reportData ?? this.reportData,
    );
  }
}

class ReportsController extends StateNotifier<ReportsState> {
  ReportsController(this._repo)
      : super(ReportsState(
          startDate: DateTime.now().subtract(const Duration(days: 30)),
          endDate: DateTime.now(),
        )) {
    _generate();
  }

  final AnalyticsRepository _repo;

  void updateDateRange(DateTime start, DateTime end) {
    state = state.copyWith(startDate: start, endDate: end);
    _generate();
  }

  void updateGroupBy(String groupBy) {
    state = state.copyWith(groupBy: groupBy);
    _generate();
  }

  Future<void> _generate() async {
    state = state.copyWith(reportData: const AsyncLoading());
    try {
      final data = await _repo.generateMilkReport(
        start: state.startDate,
        end: state.endDate,
        groupBy: state.groupBy,
      );
      if (mounted) state = state.copyWith(reportData: AsyncData(data));
    } catch (e, st) {
      if (mounted) state = state.copyWith(reportData: AsyncError(e, st));
    }
  }
}
