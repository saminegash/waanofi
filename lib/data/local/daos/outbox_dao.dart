import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'outbox_dao.g.dart';

@DriftAccessor(tables: [SyncOutboxTable])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(super.db);

  /// Queue a new item to the outbox
  Future<void> enqueue(String entityType, String operation, String payload) async {
    await into(syncOutboxTable).insert(
      SyncOutboxTableCompanion.insert(
        entityType: entityType,
        operation: operation,
        payload: payload,
      ),
    );
  }
  
  /// Batch queue items
  Future<void> enqueueAll(String entityType, String operation, List<String> payloads) async {
    await batch((batch) {
      batch.insertAll(
        syncOutboxTable,
        payloads.map((p) => SyncOutboxTableCompanion.insert(
          entityType: entityType,
          operation: operation,
          payload: p,
        )).toList(),
      );
    });
  }

  /// Get all pending items
  Future<List<SyncOutboxItem>> getPending() {
    return (select(syncOutboxTable)
          ..where((t) => t.status.equals('pending'))
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc)
          ]))
        .get();
  }

  /// Mark an item as processed (delete it)
  Future<void> markProcessed(int id) async {
    await (delete(syncOutboxTable)..where((t) => t.id.equals(id))).go();
  }

  /// Mark an item as failed
  Future<void> markFailed(int id, String error) async {
    await (update(syncOutboxTable)..where((t) => t.id.equals(id))).write(
      SyncOutboxTableCompanion(
        status: const Value('failed'),
        errorMessage: Value(error),
      ),
    );
  }
}
