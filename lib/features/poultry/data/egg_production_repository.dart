import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/egg_production_records_dao.dart';
import '../domain/egg_production_record_model.dart';

final eggProductionRepositoryProvider = Provider<EggProductionRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final dao = EggProductionRecordsDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = EggProductionRepository(
    client: Supabase.instance.client,
    dao: dao,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());
  return repo;
});

class EggProductionRepository {
  EggProductionRepository({
    required SupabaseClient client,
    required EggProductionRecordsDao dao,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
  })  : _client = client,
        _dao = dao,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final EggProductionRecordsDao _dao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    _syncCoordinator.registerHandler('egg_production_record', _handleSync);
    _syncCoordinator.start();

    await _syncFromRemote();

    _subscription = _client
        .channel('public:egg_production_records')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'egg_production_records',
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
      await _client.from('egg_production_records').upsert(payload);
    } else if (operation == 'delete') {
      final id = payload['id'] as String;
      await _client.from('egg_production_records').delete().eq('id', id);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response = await _client
          .from('egg_production_records')
          .select()
          .eq('farm_id', _farmId);

      final models = (response as List).map((json) => EggProductionRecordModel.fromJson(json)).toList();
      final locals = models.map(_toLocal).toList();
      await _dao.insertOrUpdateAll(locals);
    } catch (e) {
      debugPrint('Egg Production Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _dao.deleteRecord(id);
    } else {
      final model = EggProductionRecordModel.fromJson(payload.newRecord);
      _dao.insertOrUpdate(_toLocal(model));
    }
  }

  Stream<List<EggProductionRecordModel>> watchRecords() {
    if (_farmId == null) return Stream.value([]);
    return _dao.watchRecordsByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  Stream<List<EggProductionRecordModel>> watchRecordsByFlock(String flockId) {
    return _dao.watchRecordsByFlock(flockId).map((list) => list.map(_fromLocal).toList());
  }

  Future<void> saveRecord(EggProductionRecordModel record) async {
    // Validate domain rules before allowing saving
    record.validate();

    final local = _toLocal(record);
    await _dao.insertOrUpdate(local);
    await _syncCoordinator.enqueue('egg_production_record', 'upsert', record.toJson(), idempotencyKey: 'egg_prod_${record.id}');
  }

  Future<void> deleteRecord(String id) async {
    await _dao.deleteRecord(id);
    await _syncCoordinator.enqueue('egg_production_record', 'delete', {'id': id}, idempotencyKey: 'delete_egg_prod_$id');
  }

  void dispose() {
    _subscription?.unsubscribe();
  }

  LocalEggProductionRecord _toLocal(EggProductionRecordModel model) {
    return LocalEggProductionRecord(
      id: model.id,
      farmId: model.farmId,
      flockId: model.flockId,
      productionDate: model.productionDate,
      goodEggs: model.goodEggs,
      crackedEggs: model.crackedEggs,
      rejectedEggs: model.rejectedEggs,
      farmUseEggs: model.farmUseEggs,
      soldDirectlyEggs: model.soldDirectlyEggs,
      availableEggs: model.availableEggs,
      recordedBy: model.recordedBy,
      notes: model.notes,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  EggProductionRecordModel _fromLocal(LocalEggProductionRecord local) {
    return EggProductionRecordModel(
      id: local.id,
      farmId: local.farmId,
      flockId: local.flockId,
      productionDate: local.productionDate,
      goodEggs: local.goodEggs,
      crackedEggs: local.crackedEggs,
      rejectedEggs: local.rejectedEggs,
      farmUseEggs: local.farmUseEggs,
      soldDirectlyEggs: local.soldDirectlyEggs,
      availableEggs: local.availableEggs,
      recordedBy: local.recordedBy,
      notes: local.notes,
      createdAt: local.createdAt,
      updatedAt: local.updatedAt,
    );
  }
}
