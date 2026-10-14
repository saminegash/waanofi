import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/animals_dao.dart';
import '../../../data/local/daos/animal_state_logs_dao.dart';
import '../domain/animal_enums.dart';
import '../domain/animal_model.dart';
import '../domain/animal_state_log_model.dart';

final animalsRepositoryProvider = Provider<AnimalsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final dao = AnimalsDao(db);
  final stateLogsDao = AnimalStateLogsDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = AnimalsRepository(
    client: Supabase.instance.client,
    dao: dao,
    stateLogsDao: stateLogsDao,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
    currentUserId: user?.id,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class AnimalsRepository {
  AnimalsRepository({
    required SupabaseClient client,
    required AnimalsDao dao,
    required AnimalStateLogsDao stateLogsDao,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
    required String? currentUserId,
  })  : _client = client,
        _dao = dao,
        _stateLogsDao = stateLogsDao,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId,
        _currentUserId = currentUserId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final AnimalsDao _dao;
  final AnimalStateLogsDao _stateLogsDao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  final String? _currentUserId;
  RealtimeChannel? _animalsSubscription;
  RealtimeChannel? _logsSubscription;

  Future<void> _init() async {
    // 1. Register sync handlers with Centralized Coordinator
    _syncCoordinator.registerHandler('animal', _handleAnimalSync);
    _syncCoordinator.registerHandler('animal_state_log', _handleStateLogSync);
    _syncCoordinator.start();

    // 2. Initial fetch from remote to populate local cache
    await syncFromRemote();

    // 3. Subscribe to realtime changes for animals
    _animalsSubscription = _client
        .channel('public:animals')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'animals',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'farm_id',
              value: _farmId!,
            ),
            callback: _onAnimalRealtimeChange)
        .subscribe();

    // 4. Subscribe to realtime changes for state logs
    _logsSubscription = _client
        .channel('public:animal_state_logs')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'animal_state_logs',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'farm_id',
              value: _farmId!,
            ),
            callback: _onStateLogRealtimeChange)
        .subscribe();
  }

  Future<void> _handleAnimalSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('animals').upsert(payload);
    } else if (operation == 'delete') {
      await _client.from('animals').delete().eq('id', payload['id']);
    }
  }

  Future<void> _handleStateLogSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('animal_state_logs').upsert(payload);
    } else if (operation == 'delete') {
      await _client.from('animal_state_logs').delete().eq('id', payload['id']);
    }
  }

  /// Manually sync all animals and their state logs from remote to local cache.
  Future<void> syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response =
          await _client.from('animals').select().eq('farm_id', _farmId);

      final animals = (response as List).map((json) => AnimalModel.fromJson(json)).toList();
      final localAnimals = animals.map(_toLocal).toList();

      await _dao.insertOrUpdateAll(localAnimals);

      // Fetch state logs
      final logsResponse = await _client.from('animal_state_logs').select().eq('farm_id', _farmId);
      final logs = (logsResponse as List).map((json) => AnimalStateLogModel.fromJson(json)).toList();
      final localLogs = logs.map(_logToLocal).toList();
      await _stateLogsDao.insertAllLogs(localLogs);
    } catch (e) {
      debugPrint('Sync failed: $e');
    }
  }

  void _onAnimalRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _dao.deleteAnimal(id);
    } else {
      final animal = AnimalModel.fromJson(payload.newRecord);
      _dao.insertOrUpdate(_toLocal(animal));
    }
  }

  void _onStateLogRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType != PostgresChangeEvent.delete) {
      final log = AnimalStateLogModel.fromJson(payload.newRecord);
      _stateLogsDao.insertLog(_logToLocal(log));
    }
  }

  /// Watch local animals cache
  Stream<List<AnimalModel>> watchAnimals() {
    if (_farmId == null) return Stream.value([]);
    return _dao.watchAnimalsByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  /// Watch local state logs for a specific animal
  Stream<List<AnimalStateLogModel>> watchStateLogs(String animalId) {
    return _stateLogsDao.watchLogsForAnimal(animalId).map((list) => list.map(_logFromLocal).toList());
  }

  /// Create or Update an animal offline-first with invariant enforcement.
  Future<void> saveAnimal(AnimalModel animal) async {
    animal.validate();

    // 1. Insert locally
    await _dao.insertOrUpdate(_toLocal(animal));

    // 2. Queue to outbox via Centralized Coordinator
    final json = animal.toJson();
    await _syncCoordinator.enqueue('animal', 'upsert', json, idempotencyKey: 'animal_${animal.id}_v${animal.updatedAt.millisecondsSinceEpoch}');
  }

  /// Transition an animal state dimension, recording an auditable state-change event.
  Future<void> changeState({
    required String animalId,
    required AnimalStateDimension dimension,
    required String newValue,
    String? reason,
    String? notes,
    String? recordedBy,
    DateTime? effectiveDate,
  }) async {
    final currentList = await _dao.watchAnimalsByFarm(_farmId ?? '').first;
    final currentLocal = currentList.where((a) => a.id == animalId).firstOrNull;
    if (currentLocal == null) {
      throw StateError('Animal $animalId not found.');
    }

    final currentModel = _fromLocal(currentLocal);
    String? prevValue;
    AnimalModel updated;

    switch (dimension) {
      case AnimalStateDimension.lifecycle:
        prevValue = currentModel.lifecycleStatus.name;
        final newStatus = AnimalLifecycleStatus.values.firstWhere((e) => e.name == newValue, orElse: () => AnimalLifecycleStatus.unknown);
        updated = currentModel.copyWith(lifecycleStatus: newStatus, updatedAt: DateTime.now());
        break;
      case AnimalStateDimension.reproduction:
        prevValue = currentModel.reproductiveStatus.name;
        final newStatus = AnimalReproductiveStatus.values.firstWhere((e) => e.name == newValue, orElse: () => AnimalReproductiveStatus.unknown);
        updated = currentModel.copyWith(reproductiveStatus: newStatus, updatedAt: DateTime.now());
        break;
      case AnimalStateDimension.lactation:
        prevValue = currentModel.lactationStatus.name;
        final newStatus = AnimalLactationStatus.values.firstWhere((e) => e.name == newValue, orElse: () => AnimalLactationStatus.unknown);
        updated = currentModel.copyWith(lactationStatus: newStatus, updatedAt: DateTime.now());
        break;
      case AnimalStateDimension.health:
        prevValue = currentModel.healthStatus.name;
        final newStatus = AnimalHealthStatus.values.firstWhere((e) => e.name == newValue, orElse: () => AnimalHealthStatus.unknown);
        updated = currentModel.copyWith(healthStatus: newStatus, updatedAt: DateTime.now());
        break;
      case AnimalStateDimension.cattleClass:
        prevValue = currentModel.cattleClass.name;
        final newStatus = CattleClass.values.firstWhere((e) => e.name == newValue, orElse: () => CattleClass.unknown);
        updated = currentModel.copyWith(cattleClass: newStatus, updatedAt: DateTime.now());
        break;
      case AnimalStateDimension.location:
        prevValue = currentModel.location;
        updated = currentModel.copyWith(location: newValue, updatedAt: DateTime.now());
        break;
    }

    // Validate domain invariants
    updated.validate();

    final now = DateTime.now();
    final log = AnimalStateLogModel(
      id: const Uuid().v4(),
      farmId: currentModel.farmId,
      animalId: animalId,
      dimension: dimension,
      previousValue: prevValue,
      newValue: newValue,
      effectiveTimestamp: effectiveDate ?? now,
      recordedTimestamp: now,
      recordedBy: recordedBy ?? _currentUserId,
      reason: reason,
      notes: notes,
      createdAt: now,
    );

    // Save animal and state log locally
    await _dao.insertOrUpdate(_toLocal(updated));
    await _stateLogsDao.insertLog(_logToLocal(log));

    // Enqueue outbox items
    await _syncCoordinator.enqueue(
      'animal',
      'upsert',
      updated.toJson(),
      idempotencyKey: 'animal_${updated.id}_v${updated.updatedAt.millisecondsSinceEpoch}',
    );
    await _syncCoordinator.enqueue(
      'animal_state_log',
      'upsert',
      log.toJson(),
      idempotencyKey: 'state_log_${log.id}',
    );
  }

  Future<void> deleteAnimal(String id) async {
    // 1. Delete locally
    await _dao.deleteAnimal(id);

    // 2. Queue to outbox via Centralized Coordinator
    await _syncCoordinator.enqueue('animal', 'delete', {'id': id}, idempotencyKey: 'animal_del_$id');
  }

  void dispose() {
    _animalsSubscription?.unsubscribe();
    _logsSubscription?.unsubscribe();
  }

  // Mappers
  LocalAnimal _toLocal(AnimalModel model) {
    return LocalAnimal(
      id: model.id,
      farmId: model.farmId,
      tagNumber: model.tagNumber,
      name: model.name,
      breed: model.breed,
      sex: model.sex,
      dob: model.dob,
      status: model.lifecycleStatus.name,
      lifecycleStatus: model.lifecycleStatus.name,
      reproductiveStatus: model.reproductiveStatus.name,
      lactationStatus: model.lactationStatus.name,
      healthStatus: model.healthStatus.name,
      cattleClass: model.cattleClass.name,
      location: model.location,
      photoUrl: model.photoUrl,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      deletedAt: model.deletedAt,
    );
  }

  AnimalModel _fromLocal(LocalAnimal local) {
    return AnimalModel(
      id: local.id,
      farmId: local.farmId,
      tagNumber: local.tagNumber,
      name: local.name,
      breed: local.breed,
      sex: local.sex,
      dob: local.dob,
      lifecycleStatus: AnimalLifecycleStatus.values.firstWhere(
        (e) => e.name == local.lifecycleStatus,
        orElse: () => _parseLifecycleFallback(local.status),
      ),
      reproductiveStatus: AnimalReproductiveStatus.values.firstWhere(
        (e) => e.name == local.reproductiveStatus,
        orElse: () => _parseReproductiveFallback(local.status, local.sex),
      ),
      lactationStatus: AnimalLactationStatus.values.firstWhere(
        (e) => e.name == local.lactationStatus,
        orElse: () => _parseLactationFallback(local.status, local.sex),
      ),
      healthStatus: AnimalHealthStatus.values.firstWhere(
        (e) => e.name == local.healthStatus,
        orElse: () => _parseHealthFallback(local.status),
      ),
      cattleClass: CattleClass.values.firstWhere(
        (e) => e.name == local.cattleClass,
        orElse: () => _parseClassFallback(local.sex),
      ),
      location: local.location,
      photoUrl: local.photoUrl,
      createdAt: local.createdAt,
      updatedAt: local.updatedAt,
      deletedAt: local.deletedAt,
    );
  }

  LocalAnimalStateLog _logToLocal(AnimalStateLogModel model) {
    return LocalAnimalStateLog(
      id: model.id,
      farmId: model.farmId,
      animalId: model.animalId,
      dimension: model.dimension.name,
      previousValue: model.previousValue,
      newValue: model.newValue,
      effectiveTimestamp: model.effectiveTimestamp,
      recordedTimestamp: model.recordedTimestamp,
      recordedBy: model.recordedBy,
      reason: model.reason,
      notes: model.notes,
      createdAt: model.createdAt,
    );
  }

  AnimalStateLogModel _logFromLocal(LocalAnimalStateLog local) {
    return AnimalStateLogModel(
      id: local.id,
      farmId: local.farmId,
      animalId: local.animalId,
      dimension: AnimalStateDimension.values.firstWhere((e) => e.name == local.dimension, orElse: () => AnimalStateDimension.lifecycle),
      previousValue: local.previousValue,
      newValue: local.newValue,
      effectiveTimestamp: local.effectiveTimestamp,
      recordedTimestamp: local.recordedTimestamp,
      recordedBy: local.recordedBy,
      reason: local.reason,
      notes: local.notes,
      createdAt: local.createdAt,
    );
  }

  AnimalLifecycleStatus _parseLifecycleFallback(String status) {
    switch (status.toLowerCase()) {
      case 'sold':
        return AnimalLifecycleStatus.sold;
      case 'deceased':
        return AnimalLifecycleStatus.deceased;
      default:
        return AnimalLifecycleStatus.active;
    }
  }

  AnimalReproductiveStatus _parseReproductiveFallback(String status, String sex) {
    if (sex.toLowerCase() == 'male') return AnimalReproductiveStatus.notApplicable;
    switch (status.toLowerCase()) {
      case 'pregnant':
        return AnimalReproductiveStatus.pregnant;
      case 'active':
      case 'dry':
        return AnimalReproductiveStatus.open;
      default:
        return AnimalReproductiveStatus.unknown;
    }
  }

  AnimalLactationStatus _parseLactationFallback(String status, String sex) {
    if (sex.toLowerCase() == 'male') return AnimalLactationStatus.notApplicable;
    switch (status.toLowerCase()) {
      case 'dry':
      case 'pregnant':
        return AnimalLactationStatus.dry;
      case 'active':
        return AnimalLactationStatus.lactating;
      default:
        return AnimalLactationStatus.unknown;
    }
  }

  AnimalHealthStatus _parseHealthFallback(String status) {
    switch (status.toLowerCase()) {
      case 'sick':
        return AnimalHealthStatus.sick;
      default:
        return AnimalHealthStatus.healthy;
    }
  }

  CattleClass _parseClassFallback(String sex) {
    if (sex.toLowerCase() == 'male') return CattleClass.bull;
    return CattleClass.cow;
  }
}
