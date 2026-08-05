import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/flocks_dao.dart';
import '../domain/flock_model.dart';

final flockRepositoryProvider = Provider<FlockRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final flockDao = FlocksDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = FlockRepository(
    client: Supabase.instance.client,
    flockDao: flockDao,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
    userId: user?.id,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class FlockRepository {
  FlockRepository({
    required SupabaseClient client,
    required FlocksDao flockDao,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
    required String? userId,
  })  : _client = client,
        _flockDao = flockDao,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId,
        _userId = userId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final FlocksDao _flockDao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  final String? _userId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    _syncCoordinator.registerHandler('flock', _handleSync);
    _syncCoordinator.start();

    await _syncFromRemote();

    _subscription = _client
        .channel('public:flocks')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'flocks',
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
      await _client.from('flocks').upsert(payload);
    } else if (operation == 'delete') {
      final id = payload['id'] as String;
      await _client.from('flocks').delete().eq('id', id);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response = await _client
          .from('flocks')
          .select()
          .eq('farm_id', _farmId)
          .isFilter('deleted_at', null);

      final models = (response as List).map((json) => FlockModel.fromJson(json)).toList();
      final localFlocks = models.map(_toLocal).toList();
      await _flockDao.insertOrUpdateAll(localFlocks);
    } catch (e) {
      debugPrint('Flock Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete || payload.newRecord['deleted_at'] != null) {
      final id = (payload.oldRecord['id'] ?? payload.newRecord['id']) as String;
      _flockDao.deleteFlock(id);
    } else {
      final model = FlockModel.fromJson(payload.newRecord);
      _flockDao.insertOrUpdate(_toLocal(model));
    }
  }

  Stream<List<FlockModel>> watchFlocks() {
    if (_farmId == null) return Stream.value([]);
    return _flockDao.watchFlocksByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  Future<FlockModel?> getFlockById(String id) async {
    final local = await _flockDao.getFlockById(id);
    if (local == null) return null;
    return _fromLocal(local);
  }

  Future<void> saveFlock(FlockModel flock) async {
    final local = _toLocal(flock);
    await _flockDao.insertOrUpdate(local);
    await _syncCoordinator.enqueue('flock', 'upsert', flock.toJson(), idempotencyKey: 'flock_${flock.id}');
  }

  Future<void> deleteFlock(String id) async {
    await _flockDao.deleteFlock(id);
    await _syncCoordinator.enqueue('flock', 'delete', {'id': id}, idempotencyKey: 'delete_flock_$id');
  }

  void dispose() {
    _subscription?.unsubscribe();
  }

  LocalFlock _toLocal(FlockModel model) {
    return LocalFlock(
      id: model.id,
      farmId: model.farmId,
      flockCode: model.flockCode,
      name: model.name,
      breed: model.breed,
      purpose: model.purpose.name,
      numberOfBirds: model.numberOfBirds,
      numberOfLayingHens: model.numberOfLayingHens,
      arrivalDate: model.arrivalDate,
      hatchDate: model.hatchDate,
      housingType: model.housingType,
      source: model.source,
      status: model.status.name,
      notes: model.notes,
      createdBy: model.createdBy,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      deletedAt: model.deletedAt,
    );
  }

  FlockModel _fromLocal(LocalFlock local) {
    return FlockModel(
      id: local.id,
      farmId: local.farmId,
      flockCode: local.flockCode,
      name: local.name,
      breed: local.breed,
      purpose: FlockPurpose.values.firstWhere((e) => e.name == local.purpose, orElse: () => FlockPurpose.layers),
      numberOfBirds: local.numberOfBirds,
      numberOfLayingHens: local.numberOfLayingHens,
      arrivalDate: local.arrivalDate,
      hatchDate: local.hatchDate,
      housingType: local.housingType,
      source: local.source,
      status: FlockStatus.values.firstWhere((e) => e.name == local.status, orElse: () => FlockStatus.active),
      notes: local.notes,
      createdBy: local.createdBy,
      createdAt: local.createdAt,
      updatedAt: local.updatedAt,
      deletedAt: local.deletedAt,
    );
  }
}
