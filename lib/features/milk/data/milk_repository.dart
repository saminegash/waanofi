import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/milk_dao.dart';
import '../../../data/local/daos/outbox_dao.dart';
import '../domain/milk_record_model.dart';

final milkRepositoryProvider = Provider<MilkRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final milkDao = MilkDao(db);
  final outboxDao = OutboxDao(db);
  final user = ref.watch(currentUserProvider);

  final repo = MilkRepository(
    client: Supabase.instance.client,
    milkDao: milkDao,
    outboxDao: outboxDao,
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
    required OutboxDao outboxDao,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _milkDao = milkDao,
        _outboxDao = outboxDao,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final MilkDao _milkDao;
  final OutboxDao _outboxDao;
  final String? _farmId;
  final String? _userId;
  RealtimeChannel? _subscription;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isSyncing = false;

  Future<void> _init() async {
    // 1. Fetch remote baseline
    await _syncFromRemote();

    // 2. Realtime updates (only read, writes go through outbox)
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

    // 3. Sync outbox on startup
    syncOutbox();

    // 4. Sync outbox on network reconnect
    _connSub = Connectivity().onConnectivityChanged.listen((results) {
      if (!results.contains(ConnectivityResult.none)) {
        syncOutbox();
      }
    });
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

  /// Batch upsert milk records (Local + Queue to Outbox)
  Future<void> batchUpsertMilkRecords(List<MilkRecordModel> records) async {
    if (records.isEmpty) return;

    // 1. Insert into local DB immediately for zero-latency UI
    final localRecords = records.map(_toLocal).toList();
    await _milkDao.insertOrUpdateAll(localRecords);

    // 2. Queue to Outbox
    final payloads = records.map((r) {
      final json = r.toJson();
      if (r.id.isEmpty) {
        json.remove('id');
        json.remove('created_at');
      }
      return jsonEncode(json);
    }).toList();

    await _outboxDao.enqueueAll('milk_record', 'upsert', payloads);

    // 3. Trigger a sync attempt
    syncOutbox();
  }

  /// Process the outbox
  Future<void> syncOutbox() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final pending = await _outboxDao.getPending();
      if (pending.isEmpty) return;

      for (final item in pending) {
        try {
          if (item.entityType == 'milk_record' && item.operation == 'upsert') {
            final payload = jsonDecode(item.payload) as Map<String, dynamic>;
            await _client.from('milk_records').upsert(payload);
          }
          // Mark as processed (delete)
          await _outboxDao.markProcessed(item.id);
        } on PostgrestException catch (e) {
          if (e.code == '23505') {
            await _outboxDao.markProcessed(item.id);
          } else {
            debugPrint('Failed to sync outbox item ${item.id}: $e');
            await _outboxDao.markFailed(item.id, e.message);
          }
        } catch (e) {
          debugPrint('Failed to sync outbox item ${item.id}: $e');
          await _outboxDao.markFailed(item.id, e.toString());
        }
      }
    } finally {
      _isSyncing = false;
    }
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
    _connSub?.cancel();
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
