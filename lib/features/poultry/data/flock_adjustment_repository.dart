import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/flock_adjustments_dao.dart';
import '../domain/flock_adjustment_model.dart';
import 'flock_repository.dart';

final flockAdjustmentRepositoryProvider = Provider<FlockAdjustmentRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final dao = FlockAdjustmentsDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);
  final flockRepo = ref.watch(flockRepositoryProvider);

  final repo = FlockAdjustmentRepository(
    client: Supabase.instance.client,
    dao: dao,
    syncCoordinator: syncCoordinator,
    flockRepository: flockRepo,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());
  return repo;
});

class FlockAdjustmentRepository {
  FlockAdjustmentRepository({
    required SupabaseClient client,
    required FlockAdjustmentsDao dao,
    required SyncCoordinator syncCoordinator,
    required FlockRepository flockRepository,
    required String? farmId,
  })  : _client = client,
        _dao = dao,
        _syncCoordinator = syncCoordinator,
        _flockRepository = flockRepository,
        _farmId = farmId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final FlockAdjustmentsDao _dao;
  final SyncCoordinator _syncCoordinator;
  final FlockRepository _flockRepository;
  final String? _farmId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    _syncCoordinator.registerHandler('flock_adjustment', _handleSync);
    _syncCoordinator.start();

    await _syncFromRemote();

    _subscription = _client
        .channel('public:flock_adjustments')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'flock_adjustments',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'farm_id',
              value: _farmId!,
            ),
            callback: _onRealtimeChange)
        .subscribe();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('flock_adjustments').upsert(payload);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response = await _client
          .from('flock_adjustments')
          .select()
          .eq('farm_id', _farmId);

      final models = (response as List).map((json) => FlockAdjustmentModel.fromJson(json)).toList();
      final locals = models.map(_toLocal).toList();
      await _dao.insertOrUpdateAll(locals);
    } catch (e) {
      debugPrint('Flock Adjustment Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _dao.deleteAdjustment(id);
    } else {
      final model = FlockAdjustmentModel.fromJson(payload.newRecord);
      _dao.insertOrUpdate(_toLocal(model));
    }
  }

  Stream<List<FlockAdjustmentModel>> watchAdjustmentsByFlock(String flockId) {
    return _dao.watchAdjustmentsByFlock(flockId).map((list) => list.map(_fromLocal).toList());
  }

  Future<void> recordAdjustment(FlockAdjustmentModel adjustment) async {
    // Save adjustment locally and enqueue
    final local = _toLocal(adjustment);
    await _dao.insertOrUpdate(local);
    await _syncCoordinator.enqueue('flock_adjustment', 'upsert', adjustment.toJson(), idempotencyKey: 'adj_${adjustment.id}');

    // Immediately reflect population change locally on the flock record so UI updates instantly offline!
    final currentFlock = await _flockRepository.getFlockById(adjustment.flockId);
    if (currentFlock != null) {
      final newBirds = currentFlock.numberOfBirds + adjustment.birdsChanged;
      final newHens = currentFlock.numberOfLayingHens + adjustment.hensChanged;
      if (newBirds >= 0 && newHens >= 0 && newHens <= newBirds) {
        final updatedFlock = currentFlock.copyWith(
          numberOfBirds: newBirds,
          numberOfLayingHens: newHens,
          updatedAt: DateTime.now(),
        );
        // Note: we update locally without triggering a duplicate remote flock update because the SQL trigger will handle remote population count!
        await _flockRepository.saveFlock(updatedFlock);
      }
    }
  }

  void dispose() {
    _subscription?.unsubscribe();
  }

  LocalFlockAdjustment _toLocal(FlockAdjustmentModel model) {
    return LocalFlockAdjustment(
      id: model.id,
      farmId: model.farmId,
      flockId: model.flockId,
      adjustmentType: model.adjustmentType.name,
      birdsChanged: model.birdsChanged,
      hensChanged: model.hensChanged,
      reason: model.reason,
      recordedAt: model.recordedAt,
      recordedBy: model.recordedBy,
      createdAt: model.createdAt,
    );
  }

  FlockAdjustmentModel _fromLocal(LocalFlockAdjustment local) {
    return FlockAdjustmentModel(
      id: local.id,
      farmId: local.farmId,
      flockId: local.flockId,
      adjustmentType: FlockAdjustmentType.values.firstWhere((e) => e.name == local.adjustmentType, orElse: () => FlockAdjustmentType.mortality),
      birdsChanged: local.birdsChanged,
      hensChanged: local.hensChanged,
      reason: local.reason,
      recordedAt: local.recordedAt,
      recordedBy: local.recordedBy,
      createdAt: local.createdAt,
    );
  }
}
