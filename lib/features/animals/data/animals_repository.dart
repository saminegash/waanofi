import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/daos/animals_dao.dart';
import '../../../data/local/daos/outbox_dao.dart';
import '../domain/animal_model.dart';

final animalsRepositoryProvider = Provider<AnimalsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final dao = AnimalsDao(db);
  final outboxDao = db.outboxDao;
  final user = ref.watch(currentUserProvider);

  final repo = AnimalsRepository(
    client: Supabase.instance.client,
    dao: dao,
    outboxDao: outboxDao,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());

  return repo;
});

class AnimalsRepository {
  AnimalsRepository({
    required SupabaseClient client,
    required AnimalsDao dao,
    required OutboxDao outboxDao,
    required String? farmId,
  })  : _client = client,
        _dao = dao,
        _outboxDao = outboxDao,
        _farmId = farmId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final AnimalsDao _dao;
  final OutboxDao _outboxDao;
  final String? _farmId;
  RealtimeChannel? _subscription;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isSyncing = false;

  Future<void> _init() async {
    // 1. Initial fetch from remote to populate local cache
    await syncFromRemote();

    // 2. Subscribe to realtime changes
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

    syncOutbox();

    _connSub = Connectivity().onConnectivityChanged.listen((results) {
      if (!results.contains(ConnectivityResult.none)) {
        syncOutbox();
      }
    });
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
      // Offline or network error; fail silently and rely on local cache
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

    // 2. Queue to outbox
    final json = animal.toJson();
    await _outboxDao.enqueueAll('animal', 'upsert', [jsonEncode(json)]);

    // 3. Trigger sync
    syncOutbox();
  }
  
  Future<void> deleteAnimal(String id) async {
    // 1. Delete locally
    await _dao.deleteAnimal(id);

    // 2. Queue to outbox
    await _outboxDao.enqueueAll('animal', 'delete', [jsonEncode({'id': id})]);

    // 3. Trigger sync
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
          final payload = jsonDecode(item.payload) as Map<String, dynamic>;
          
          if (item.entityType == 'animal') {
            if (item.operation == 'upsert') {
              await _client.from('animals').upsert(payload);
            } else if (item.operation == 'delete') {
              await _client.from('animals').delete().eq('id', payload['id']);
            }
          }
          await _outboxDao.markProcessed(item.id);
        } catch (e) {
          debugPrint('Failed to sync animal outbox item ${item.id}: $e');
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
