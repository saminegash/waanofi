import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/milk_dao.dart';
import '../domain/milk_record_model.dart';

final milkRepositoryProvider = Provider<MilkRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final milkDao = MilkDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = MilkRepository(
    client: Supabase.instance.client,
    milkDao: milkDao,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
    userId: user?.id,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class MilkRepository {
  MilkRepository({
    required SupabaseClient client,
    required MilkDao milkDao,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _milkDao = milkDao,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final MilkDao _milkDao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  final String? _userId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    // 1. Register sync handler with Centralized Coordinator
    _syncCoordinator.registerHandler('milk_record', _handleSync);
    _syncCoordinator.start();

    // 2. Fetch remote baseline
    await _syncFromRemote();

    // 3. Realtime updates (only read, writes go through outbox)
    _subscription = _client
        .channel('public:milk_records')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'milk_records',
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
      await _client.from('milk_records').upsert(payload);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response =
          await _client.from('milk_records').select().eq('farm_id', _farmId);

      final records = (response as List).map((json) => MilkRecordModel.fromJson(json)).toList();
      final localRecords = records.map(_toLocal).toList();

      await _milkDao.insertOrUpdateAll(localRecords);
    } catch (e) {
      debugPrint('Milk Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _milkDao.deleteRecord(id);
    } else {
      final record = MilkRecordModel.fromJson(payload.newRecord);
      _milkDao.insertOrUpdate(_toLocal(record));
    }
  }

  /// Batch upsert milk records (Local + Queue to Centralized SyncCoordinator)
  Future<void> batchUpsertMilkRecords(List<MilkRecordModel> records) async {
    if (records.isEmpty) return;

    // 1. Insert into local DB immediately for zero-latency UI
    final localRecords = records.map(_toLocal).toList();
    await _milkDao.insertOrUpdateAll(localRecords);

    // 2. Queue to Centralized Coordinator
    final payloads = records.map((r) {
      final json = r.toJson();
      if (r.id.isEmpty) {
        json.remove('id');
        json.remove('created_at');
      }
      return json;
    }).toList();

    await _syncCoordinator.enqueueAll('milk_record', 'upsert', payloads);
  }

  /// Watch local records
  Stream<List<MilkRecordModel>> watchMilkRecords() {
    if (_farmId == null) return Stream.value([]);
    return _milkDao.watchMilkRecordsByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  /// Get recent records for an animal (e.g. for sparklines)
  Future<List<MilkRecordModel>> getRecentMilkForAnimal(String animalId, DateTime startDate) async {
    final list = await _milkDao.getRecentMilkForAnimal(animalId, startDate);
    return list.map(_fromLocal).toList();
  }

  void dispose() {
    _subscription?.unsubscribe();
  }


  // Mappers
  LocalMilkRecord _toLocal(MilkRecordModel model) {
    return LocalMilkRecord(
      id: model.id,
      farmId: model.farmId,
      animalId: model.animalId,
      recordedAt: model.recordedAt,
      session: model.session.name,
      litres: model.litres,
      recordedBy: model.recordedBy,
      createdAt: model.createdAt,
    );
  }

  MilkRecordModel _fromLocal(LocalMilkRecord local) {
    return MilkRecordModel(
      id: local.id,
      farmId: local.farmId,
      animalId: local.animalId,
      recordedAt: local.recordedAt,
      session: MilkSession.values.firstWhere((e) => e.name == local.session, orElse: () => MilkSession.morning),
      litres: local.litres,
      recordedBy: local.recordedBy,
      createdAt: local.createdAt,
    );
  }
}
