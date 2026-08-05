import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/animals_dao.dart';
import '../domain/animal_model.dart';

final animalsRepositoryProvider = Provider<AnimalsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final dao = AnimalsDao(db);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = AnimalsRepository(
    client: Supabase.instance.client,
    dao: dao,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class AnimalsRepository {
  AnimalsRepository({
    required SupabaseClient client,
    required AnimalsDao dao,
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
  final AnimalsDao _dao;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    // 1. Register sync handler with Centralized Coordinator
    _syncCoordinator.registerHandler('animal', _handleSync);
    _syncCoordinator.start();

    // 2. Initial fetch from remote to populate local cache
    await syncFromRemote();

    // 3. Subscribe to realtime changes
    _subscription = _client
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
            callback: _onRealtimeChange)
        .subscribe();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('animals').upsert(payload);
    } else if (operation == 'delete') {
      await _client.from('animals').delete().eq('id', payload['id']);
    }
  }

  /// Manually sync all animals from remote to local cache.
  Future<void> syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final response =
          await _client.from('animals').select().eq('farm_id', _farmId);

      final animals = (response as List).map((json) => AnimalModel.fromJson(json)).toList();
      final localAnimals = animals.map(_toLocal).toList();

      await _dao.insertOrUpdateAll(localAnimals);
    } catch (e) {
      debugPrint('Sync failed: $e');
    }
  }

  void _onRealtimeChange(PostgresChangePayload payload) {
    if (payload.eventType == PostgresChangeEvent.delete) {
      final id = payload.oldRecord['id'] as String;
      _dao.deleteAnimal(id);
    } else {
      final animal = AnimalModel.fromJson(payload.newRecord);
      _dao.insertOrUpdate(_toLocal(animal));
    }
  }

  /// Watch local animals cache
  Stream<List<AnimalModel>> watchAnimals() {
    if (_farmId == null) return Stream.value([]);
    return _dao.watchAnimalsByFarm(_farmId).map((list) => list.map(_fromLocal).toList());
  }

  /// Create or Update an animal offline-first.
  Future<void> saveAnimal(AnimalModel animal) async {
    // 1. Insert locally
    await _dao.insertOrUpdate(_toLocal(animal));

    // 2. Queue to outbox via Centralized Coordinator
    final json = animal.toJson();
    await _syncCoordinator.enqueue('animal', 'upsert', json);
  }

  Future<void> deleteAnimal(String id) async {
    // 1. Delete locally
    await _dao.deleteAnimal(id);

    // 2. Queue to outbox via Centralized Coordinator
    await _syncCoordinator.enqueue('animal', 'delete', {'id': id});
  }

  void dispose() {
    _subscription?.unsubscribe();
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
      status: model.status,
      photoUrl: model.photoUrl,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
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
      status: local.status,
      photoUrl: local.photoUrl,
      createdAt: local.createdAt,
      updatedAt: local.updatedAt,
    );
  }
}
