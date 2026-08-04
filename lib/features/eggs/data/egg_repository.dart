import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/egg_records_dao.dart';
import '../../../data/local/daos/outbox_dao.dart';
import '../domain/egg_record_model.dart';

final eggRepositoryProvider = Provider<EggRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final eggDao = EggRecordsDao(db);
  final outboxDao = OutboxDao(db);
  final user = ref.watch(currentUserProvider);

  final repo = EggRepository(
    client: Supabase.instance.client,
    eggDao: eggDao,
    outboxDao: outboxDao,
    farmId: user?.farmId,
    userId: user?.id,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class EggRepository {
  EggRepository({
    required SupabaseClient client,
    required EggRecordsDao eggDao,
    required OutboxDao outboxDao,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _eggDao = eggDao,
        _outboxDao = outboxDao,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final EggRecordsDao _eggDao;
  final OutboxDao _outboxDao;
  final String? _farmId;
  final String? _userId;
  RealtimeChannel? _subscription;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isSyncing = false;

  Future<void> _init() async {
    // 1. Fetch remote baseline
    await _syncFromRemote();

    // 2. Realtime updates
    _subscription = _client
        .channel('public:egg_records')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'egg_records',
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
          await _client.from('egg_records').select().eq('farm_id', _farmId);

      final records = (response as List).map((json) => EggRecordModel.fromJson(json)).toList();
      final localRecords = records.map(_toLocal).toList();

      await _eggDao.insertOrUpdateAll(localRecords);
    } catch (e) {
      debugPrint('Egg Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _eggDao.deleteRecord(id);
    } else {
      final record = EggRecordModel.fromJson(payload.newRecord);
      _eggDao.insertOrUpdate(_toLocal(record));
    }
  }

  /// Batch upsert egg records (Local + Queue to Outbox)
  Future<void> batchUpsertEggRecords(List<EggRecordModel> records) async {
    if (records.isEmpty) return;

    // 1. Insert into local DB immediately for zero-latency UI
    final localRecords = records.map(_toLocal).toList();
    await _eggDao.insertOrUpdateAll(localRecords);

    // 2. Queue to Outbox
    final payloads = records.map((r) {
      final json = r.toJson();
      if (r.id.isEmpty) {
        json.remove('id');
        json.remove('created_at');
      }
      return jsonEncode(json);
    }).toList();

    await _outboxDao.enqueueAll('egg_record', 'upsert', payloads);

    // 3. Trigger a sync attempt
    await syncOutbox();
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
          if (item.entityType == 'egg_record' && item.operation == 'upsert') {
            final payload = jsonDecode(item.payload) as Map<String, dynamic>;
            await _client.from('egg_records').upsert(payload);
          }
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
  Stream<List<EggRecordModel>> watchEggRecords() {
    if (_farmId == null) return Stream.value([]);
    return _eggDao.watchEggRecordsByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  void dispose() {
    _subscription?.unsubscribe();
    _connSub?.cancel();
  }

  // Mappers
  LocalEggRecord _toLocal(EggRecordModel model) {
    return LocalEggRecord(
      id: model.id,
      farmId: model.farmId,
      flockName: model.flockName,
      productionType: model.productionType.name,
      recordedAt: model.recordedAt,
      quantity: model.quantity,
      brokenCount: model.brokenCount,
      notes: model.notes,
      recordedBy: model.recordedBy,
      createdAt: model.createdAt,
    );
  }

  EggRecordModel _fromLocal(LocalEggRecord local) {
    return EggRecordModel(
      id: local.id,
      farmId: local.farmId,
      flockName: local.flockName,
      productionType: EggProductionType.values.firstWhere(
        (e) => e.name == local.productionType,
        orElse: () => EggProductionType.freeRange,
      ),
      recordedAt: local.recordedAt,
      quantity: local.quantity,
      brokenCount: local.brokenCount,
      notes: local.notes,
      recordedBy: local.recordedBy,
      createdAt: local.createdAt,
    );
  }
}
