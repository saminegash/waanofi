import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/feed_records_dao.dart';
import '../domain/feed_record_model.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final feedDao = db.feedRecordsDao;
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = FeedRepository(
    client: Supabase.instance.client,
    feedDao: feedDao,
    syncCoordinator: syncCoordinator,
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
    required SyncCoordinator syncCoordinator,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _feedDao = feedDao,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final FeedRecordsDao _feedDao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  final String? _userId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    // 1. Register sync handler with Centralized Coordinator
    _syncCoordinator.registerHandler('feed_record', _handleSync);
    _syncCoordinator.start();

    // 2. Fetch remote baseline
    await _syncFromRemote();

    // 3. Realtime updates
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
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('feed_records').upsert(payload);
    }
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
      // Ignore deletes for simplicity
    } else {
      final record = FeedRecordModel.fromJson(payload.newRecord);
      _feedDao.batchInsertFeedRecords([_toLocal(record)]);
    }
  }

  /// Batch upsert feed records (Local + Queue to Centralized SyncCoordinator)
  Future<void> batchUpsertFeedRecords(List<FeedRecordModel> records) async {
    if (records.isEmpty) return;

    // 1. Insert into local DB immediately
    final localRecords = records.map(_toLocal).toList();
    await _feedDao.batchInsertFeedRecords(localRecords);

    // 2. Queue to Centralized Coordinator
    final payloads = records.map((r) {
      final json = r.toJson();
      if (r.id.isEmpty) {
        json.remove('id');
        json.remove('created_at');
      }
      return json;
    }).toList();

    await _syncCoordinator.enqueueAll('feed_record', 'upsert', payloads);
  }

  void dispose() {
    _subscription?.unsubscribe();
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
