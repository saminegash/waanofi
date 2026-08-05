import 'dart:async';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../domain/inventory_batch_model.dart';

final inventoryBatchRepositoryProvider = Provider<InventoryBatchRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = InventoryBatchRepository(
    client: Supabase.instance.client,
    db: db,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());
  return repo;
});

class InventoryBatchRepository {
  InventoryBatchRepository({
    required SupabaseClient client,
    required AppDatabase db,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
  })  : _client = client,
        _db = db,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final AppDatabase _db;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    _syncCoordinator.registerHandler('inventory_batch', _handleSync);
    _syncCoordinator.start();
    await _syncFromRemote();

    _subscription = _client
        .channel('public:inventory_batches')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'inventory_batches',
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: 'farm_id', value: _farmId!),
            callback: (_) => _syncFromRemote())
        .subscribe();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('inventory_batches').upsert(payload);
    } else if (operation == 'delete') {
      final id = payload['id'] as String;
      await _client.from('inventory_batches').delete().eq('id', id);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final res = await _client.from('inventory_batches').select().eq('farm_id', _farmId);
      final models = (res as List).map((json) => InventoryBatchModel.fromJson(json)).toList();
      for (final m in models) {
        await _saveLocal(m);
      }
    } catch (e) {
      debugPrint('Inventory batch remote sync failed: $e');
    }
  }

  Stream<List<InventoryBatchModel>> watchBatches() {
    if (_farmId == null) return Stream.value([]);
    return (_db.select(_db.inventoryBatchesTable)..where((tbl) => tbl.farmId.equals(_farmId)))
        .watch()
        .map((rows) => rows.map(_fromLocal).toList());
  }

  Future<void> saveBatch(InventoryBatchModel batch) async {
    batch.validate();
    await _saveLocal(batch);
    await _syncCoordinator.enqueue('inventory_batch', 'upsert', batch.toJson(), idempotencyKey: 'batch_${batch.id}');
  }

  Future<void> approveBatch(String batchId, String userId) async {
    final list = await watchBatches().first;
    final b = list.where((x) => x.id == batchId).firstOrNull;
    if (b == null) return;
    final updated = b.copyWith(
      qualityStatus: InventoryQualityStatus.approved,
      approvedQuantity: b.producedQuantity,
      availableQuantity: b.producedQuantity,
      approvedBy: userId,
      updatedAt: DateTime.now(),
    );
    await saveBatch(updated);
  }

  Future<void> rejectBatch(String batchId, String reason) async {
    final list = await watchBatches().first;
    final b = list.where((x) => x.id == batchId).firstOrNull;
    if (b == null) return;
    final updated = b.copyWith(
      qualityStatus: InventoryQualityStatus.rejected,
      rejectedQuantity: b.producedQuantity,
      availableQuantity: 0.0,
      updatedAt: DateTime.now(),
    );
    await saveBatch(updated);
  }

  Future<void> _saveLocal(InventoryBatchModel m) async {
    await _db.into(_db.inventoryBatchesTable).insertOnConflictUpdate(
          InventoryBatchesTableCompanion.insert(
            id: m.id,
            farmId: m.farmId,
            productId: m.productId != null ? drift.Value(m.productId!) : const drift.Value.absent(),
            batchCode: m.batchCode,
            sourceType: m.sourceType,
            producedQuantity: m.producedQuantity,
            approvedQuantity: drift.Value(m.approvedQuantity),
            availableQuantity: drift.Value(m.availableQuantity),
            baseUnit: m.baseUnit,
            producedAt: m.producedAt,
            expiresAt: m.expiresAt != null ? drift.Value(m.expiresAt) : const drift.Value.absent(),
            qualityStatus: drift.Value(m.qualityStatus.name),
            marketplaceStatus: drift.Value(m.marketplaceStatus),
            version: drift.Value(m.version),
          ),
        );
  }

  InventoryBatchModel _fromLocal(LocalInventoryBatch r) {
    return InventoryBatchModel(
      id: r.id,
      farmId: r.farmId,
      productId: r.productId,
      batchCode: r.batchCode,
      sourceType: r.sourceType,
      producedQuantity: r.producedQuantity,
      approvedQuantity: r.approvedQuantity,
      availableQuantity: r.availableQuantity,
      baseUnit: r.baseUnit,
      producedAt: r.producedAt,
      expiresAt: r.expiresAt,
      qualityStatus: InventoryQualityStatus.values.firstWhere((e) => e.name == r.qualityStatus, orElse: () => InventoryQualityStatus.pendingInspection),
      marketplaceStatus: r.marketplaceStatus,
      createdAt: r.producedAt,
      updatedAt: r.producedAt,
      version: r.version,
    );
  }

  void dispose() {
    _subscription?.unsubscribe();
  }
}
