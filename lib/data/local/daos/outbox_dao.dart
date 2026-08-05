import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'outbox_dao.g.dart';

@DriftAccessor(tables: [SyncOutboxTable])
class OutboxDao extends DatabaseAccessor<AppDatabase> with _$OutboxDaoMixin {
  OutboxDao(super.db);

  /// Queue a new item to the outbox
  Future<int> enqueue(String entityType, String operation, String payload, {String? idempotencyKey}) async {
    return into(syncOutboxTable).insert(
      SyncOutboxTableCompanion.insert(
        entityType: entityType,
        operation: operation,
        payload: payload,
        idempotencyKey: Value(idempotencyKey),
      ),
    );
  }

  /// Batch queue items
  Future<void> enqueueAll(String entityType, String operation, List<String> payloads, {List<String?>? idempotencyKeys}) async {
    await batch((batch) {
      batch.insertAll(
        syncOutboxTable,
        List.generate(payloads.length, (index) => SyncOutboxTableCompanion.insert(
          entityType: entityType,
          operation: operation,
          payload: payloads[index],
          idempotencyKey: Value(idempotencyKeys?[index]),
        )),
      );
    });
  }

  /// Get all items currently pending or eligible for retry for a specific entity type
  Future<List<SyncOutboxItem>> getEligibleForSync(String entityType) async {
    final now = DateTime.now();
    return (select(syncOutboxTable)
          ..where((t) => t.entityType.equals(entityType) & 
              (t.status.equals('pending') | 
               (t.status.equals('retrying') & (t.nextRetryAt.isNull() | t.nextRetryAt.isSmallerOrEqualValue(now)))))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc)]))
        .get();
  }

  /// Get all pending or retrying items across all entity types (for UI summary)
  Future<List<SyncOutboxItem>> getAllPending() {
    return (select(syncOutboxTable)
          ..where((t) => t.status.equals('pending') | t.status.equals('retrying') | t.status.equals('processing'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc)]))
        .get();
  }

  /// Get all permanently failed items (never automatically discarded)
  Future<List<SyncOutboxItem>> getAllFailed() {
    return (select(syncOutboxTable)
          ..where((t) => t.status.equals('permanently_failed'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .get();
  }

  /// Watch pending and retrying items count
  Stream<List<SyncOutboxItem>> watchPending() {
    return (select(syncOutboxTable)..where((t) => t.status.equals('pending') | t.status.equals('retrying') | t.status.equals('processing'))).watch();
  }

  /// Watch permanently failed items
  Stream<List<SyncOutboxItem>> watchFailed() {
    return (select(syncOutboxTable)..where((t) => t.status.equals('permanently_failed'))).watch();
  }

  /// Mark an item as processing
  Future<void> markProcessing(int id) async {
    await (update(syncOutboxTable)..where((t) => t.id.equals(id))).write(
      const SyncOutboxTableCompanion(
        status: Value('processing'),
      ),
    );
  }

  /// Mark an item as completed and remove from outbox
  Future<void> markCompleted(int id) async {
    await (delete(syncOutboxTable)..where((t) => t.id.equals(id))).go();
  }

  /// Backward compatibility alias for markCompleted
  Future<void> markProcessed(int id) async => markCompleted(id);

  /// Mark an item as retrying with exponential backoff calculation
  Future<void> markRetrying(int id, String error, int attempt, DateTime nextRetry, {String? errorCode}) async {
    await (update(syncOutboxTable)..where((t) => t.id.equals(id))).write(
      SyncOutboxTableCompanion(
        status: const Value('retrying'),
        errorMessage: Value(error),
        attemptCount: Value(attempt),
        nextRetryAt: Value(nextRetry),
        lastErrorCode: Value(errorCode),
      ),
    );
  }

  /// Mark an item as permanently failed after max attempts or non-retryable error
  Future<void> markPermanentlyFailed(int id, String error, {String? errorCode}) async {
    await (update(syncOutboxTable)..where((t) => t.id.equals(id))).write(
      SyncOutboxTableCompanion(
        status: const Value('permanently_failed'),
        errorMessage: Value(error),
        lastErrorCode: Value(errorCode),
      ),
    );
  }

  /// Recover items stuck in 'processing' state (crash recovery)
  Future<int> recoverStuckProcessing(DateTime cutoff) async {
    return (update(syncOutboxTable)..where((t) => t.status.equals('processing') & t.createdAt.isSmallerOrEqualValue(cutoff))).write(
      const SyncOutboxTableCompanion(
        status: Value('pending'),
        errorMessage: Value('Recovered from stalled processing state'),
      ),
    );
  }

  /// Manually retry all permanently failed items from the UI
  Future<void> retryAllFailed() async {
    await (update(syncOutboxTable)..where((t) => t.status.equals('permanently_failed'))).write(
      const SyncOutboxTableCompanion(
        status: Value('pending'),
        attemptCount: Value(0),
        nextRetryAt: Value(null),
        errorMessage: Value(null),
      ),
    );
  }
}

