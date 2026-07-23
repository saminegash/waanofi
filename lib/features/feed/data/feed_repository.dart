import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/feed_records_dao.dart';
import '../../../data/local/daos/outbox_dao.dart';
import '../domain/feed_record_model.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final feedDao = db.feedRecordsDao;
  final outboxDao = db.outboxDao;
  final user = ref.watch(currentUserProvider);

  final repo = FeedRepository(
    client: Supabase.instance.client,
    feedDao: feedDao,
    outboxDao: outboxDao,
    farmId: user?.farmId,
    userId: user?.id,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class FeedRepository {
  FeedRepository({
    required SupabaseClient client,
    required FeedRecordsDao feedDao,
    required OutboxDao outboxDao,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _feedDao = feedDao,
        _outboxDao = outboxDao,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final FeedRecordsDao _feedDao;
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
        .channel('public:feed_records')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'feed_records',
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
          await _client.from('feed_records').select().eq('farm_id', _farmId);

      final records = (response as List).map((json) => FeedRecordModel.fromJson(json)).toList();
      final localRecords = records.map(_toLocal).toList();

      await _feedDao.batchInsertFeedRecords(localRecords);
    } catch (e) {
      debugPrint('Feed Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      // Assuming a delete method exists or we can ignore deletes for simplicity
      // In a full implementation, we'd add deleteRecord to the DAO.
    } else {
      final record = FeedRecordModel.fromJson(payload.newRecord);
      _feedDao.batchInsertFeedRecords([_toLocal(record)]);
    }
  }

  /// Batch upsert feed records (Local + Queue to Outbox)
  Future<void> batchUpsertFeedRecords(List<FeedRecordModel> records) async {
    if (records.isEmpty) return;

    // 1. Insert into local DB immediately
    final localRecords = records.map(_toLocal).toList();
    await _feedDao.batchInsertFeedRecords(localRecords);

    // 2. Queue to Outbox
    final payloads = records.map((r) {
      final json = r.toJson();
      if (r.id.isEmpty) {
        json.remove('id');
        json.remove('created_at');
      }
      return jsonEncode(json);
    }).toList();

    await _outboxDao.enqueueAll('feed_record', 'upsert', payloads);

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
          if (item.entityType == 'feed_record' && item.operation == 'upsert') {
            final payload = jsonDecode(item.payload) as Map<String, dynamic>;
            await _client.from('feed_records').upsert(payload);
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

  void dispose() {
    _subscription?.unsubscribe();
    _connSub?.cancel();
  }

  LocalFeedRecord _toLocal(FeedRecordModel model) {
    return LocalFeedRecord(
      id: model.id,
      farmId: model.farmId,
      animalId: model.animalId,
      feedTypeId: model.feedTypeId,
      quantityKg: model.quantityKg,
      cost: model.cost,
      recordedAt: model.recordedAt,
      recordedBy: model.recordedBy,
      createdAt: model.createdAt,
    );
  }

  FeedRecordModel _fromLocal(LocalFeedRecord local) {
    return FeedRecordModel(
      id: local.id,
      farmId: local.farmId,
      animalId: local.animalId,
      feedTypeId: local.feedTypeId,
      quantityKg: local.quantityKg,
      cost: local.cost,
      recordedAt: local.recordedAt,
      recordedBy: local.recordedBy,
      createdAt: local.createdAt,
    );
  }
}
