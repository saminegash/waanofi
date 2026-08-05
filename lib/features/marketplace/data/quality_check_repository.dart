import 'dart:async';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../domain/quality_check_model.dart';

final qualityCheckRepositoryProvider = Provider<QualityCheckRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  return QualityCheckRepository(client: Supabase.instance.client, db: db, syncCoordinator: syncCoordinator);
});

class QualityCheckRepository {
  QualityCheckRepository({
    required SupabaseClient client,
    required AppDatabase db,
    required SyncCoordinator syncCoordinator,
  })  : _client = client,
        _db = db,
        _syncCoordinator = syncCoordinator {
    _init();
  }

  final SupabaseClient _client;
  final AppDatabase _db;
  final SyncCoordinator _syncCoordinator;

  void _init() {
    _syncCoordinator.registerHandler('quality_check', _handleSync);
    _syncCoordinator.start();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('quality_checks').upsert(payload);
    }
  }

  Stream<List<QualityCheckModel>> watchChecksForBatch(String batchId) {
    return (_db.select(_db.qualityChecksTable)..where((tbl) => tbl.batchId.equals(batchId)))
        .watch()
        .map((rows) => rows.map((r) => QualityCheckModel(
              id: r.id,
              batchId: r.batchId,
              checkType: r.checkType,
              result: r.result,
              notes: r.notes,
              checkedBy: r.checkedBy,
              checkedAt: r.checkedAt,
              approvalStatus: r.approvalStatus,
            )).toList());
  }

  Future<void> recordCheck(QualityCheckModel check) async {
    await _db.into(_db.qualityChecksTable).insertOnConflictUpdate(
          QualityChecksTableCompanion.insert(
            id: check.id,
            batchId: check.batchId,
            checkType: check.checkType,
            result: check.result,
            notes: check.notes != null ? drift.Value(check.notes!) : const drift.Value.absent(),
            checkedBy: check.checkedBy != null ? drift.Value(check.checkedBy!) : const drift.Value.absent(),
            checkedAt: drift.Value(check.checkedAt),
            approvalStatus: drift.Value(check.approvalStatus),
          ),
        );
    await _syncCoordinator.enqueue('quality_check', 'upsert', check.toJson(), idempotencyKey: 'check_${check.id}');
  }
}
