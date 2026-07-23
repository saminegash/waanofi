import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/admin_repository.dart';
import '../domain/audit_log_model.dart';
import '../domain/profile_model.dart';

final adminControllerProvider =
    StateNotifierProvider<AdminController, AdminState>((ref) {
  final repo = ref.watch(adminRepositoryProvider);
  return AdminController(repo);
});

class AdminState {
  const AdminState({
    this.workers = const AsyncLoading(),
    this.auditLogs = const AsyncLoading(),
  });

  final AsyncValue<List<ProfileModel>> workers;
  final AsyncValue<List<AuditLogModel>> auditLogs;

  AdminState copyWith({
    AsyncValue<List<ProfileModel>>? workers,
    AsyncValue<List<AuditLogModel>>? auditLogs,
  }) {
    return AdminState(
      workers: workers ?? this.workers,
      auditLogs: auditLogs ?? this.auditLogs,
    );
  }
}

class AdminController extends StateNotifier<AdminState> {
  AdminController(this._repo) : super(const AdminState()) {
    refreshAll();
  }

  final AdminRepository _repo;

  Future<void> refreshAll() async {
    fetchWorkers();
    fetchAuditLogs();
  }

  Future<void> fetchWorkers() async {
    state = state.copyWith(workers: const AsyncLoading());
    try {
      final workers = await _repo.getWorkers();
      if (mounted) state = state.copyWith(workers: AsyncData(workers));
    } catch (e, st) {
      if (mounted) state = state.copyWith(workers: AsyncError(e, st));
    }
  }

  Future<void> fetchAuditLogs() async {
    state = state.copyWith(auditLogs: const AsyncLoading());
    try {
      final logs = await _repo.getAuditLogs();
      if (mounted) state = state.copyWith(auditLogs: AsyncData(logs));
    } catch (e, st) {
      if (mounted) state = state.copyWith(auditLogs: AsyncError(e, st));
    }
  }

  Future<void> updateWorkerRole(String userId, String newRole) async {
    try {
      await _repo.updateWorkerRole(userId, newRole);
      fetchWorkers();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleWorkerStatus(String userId, bool active) async {
    try {
      await _repo.updateWorkerStatus(userId, active);
      fetchWorkers();
    } catch (e) {
      rethrow;
    }
  }
}
