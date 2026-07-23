import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/feed_types_dao.dart';
import '../../../data/local/daos/outbox_dao.dart';
import '../domain/feed_type_model.dart';

final feedTypesRepositoryProvider = Provider<FeedTypesRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final feedTypesDao = db.feedTypesDao;
  final outboxDao = db.outboxDao;
  final user = ref.watch(currentUserProvider);

  final repo = FeedTypesRepository(
    client: Supabase.instance.client,
    feedTypesDao: feedTypesDao,
    outboxDao: outboxDao,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class FeedTypesRepository {
  FeedTypesRepository({
    required SupabaseClient client,
    required FeedTypesDao feedTypesDao,
    required OutboxDao outboxDao,
    required String? farmId,
  })  : _client = client,
        _feedTypesDao = feedTypesDao,
        _outboxDao = outboxDao,
        _farmId = farmId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final FeedTypesDao _feedTypesDao;
  final OutboxDao _outboxDao;
  final String? _farmId;
  RealtimeChannel? _subscription;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isSyncing = false;

  Future<void> _init() async {
    await _syncFromRemote();

    _subscription = _client
        .channel('public:feed_types')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'feed_types',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'farm_id',
              value: _farmId!,
            ),
            callback: _onRealtimeChange)
        .subscribe();

    syncOutbox();

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
          await _client.from('feed_types').select().eq('farm_id', _farmId);

      final records = (response as List).map((json) => FeedTypeModel.fromJson(json)).toList();
      final localRecords = records.map(_toLocal).toList();

      await _feedTypesDao.batchInsertFeedTypes(localRecords);
    } catch (e) {
      debugPrint('Feed Types Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _feedTypesDao.deleteFeedType(id);
    } else {
      final record = FeedTypeModel.fromJson(payload.newRecord);
      _feedTypesDao.upsertFeedType(_toLocal(record));
    }
  }

  Stream<List<FeedTypeModel>> watchFeedTypes() {
    return _feedTypesDao.select(_feedTypesDao.feedTypesTable).watch().map((list) => list.map(_fromLocal).toList());
  }

  Future<void> upsertFeedType(FeedTypeModel feedType) async {
    // 1. Insert locally
    await _feedTypesDao.upsertFeedType(_toLocal(feedType));

    // 2. Queue to Outbox
    final json = feedType.toJson();
    if (feedType.id.isEmpty) {
      json.remove('id');
      json.remove('created_at');
      json.remove('updated_at');
    }
    
    await _outboxDao.enqueueAll('feed_type', 'upsert', [jsonEncode(json)]);
    
    // 3. Sync
    syncOutbox();
  }

  Future<void> syncOutbox() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final pending = await _outboxDao.getPending();
      if (pending.isEmpty) return;

      for (final item in pending) {
        try {
          if (item.entityType == 'feed_type' && item.operation == 'upsert') {
            final payload = jsonDecode(item.payload) as Map<String, dynamic>;
            await _client.from('feed_types').upsert(payload);
          }
          await _outboxDao.markProcessed(item.id);
        } catch (e) {
          debugPrint('Failed to sync feed type outbox item ${item.id}: $e');
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

  LocalFeedType _toLocal(FeedTypeModel model) {
    return LocalFeedType(
      id: model.id,
      farmId: model.farmId,
      name: model.name,
      unit: model.unit,
      unitCost: model.unitCost,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  FeedTypeModel _fromLocal(LocalFeedType local) {
    return FeedTypeModel(
      id: local.id,
      farmId: local.farmId,
      name: local.name,
      unit: local.unit,
      unitCost: local.unitCost,
      createdAt: local.createdAt,
      updatedAt: local.updatedAt,
    );
  }
}
