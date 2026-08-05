import 'dart:convert';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';


import 'package:waanofi/core/sync/sync_coordinator.dart';
import 'package:waanofi/data/local/app_database.dart';
import 'package:waanofi/data/local/daos/outbox_dao.dart';

void main() {
  late AppDatabase db;
  late OutboxDao outboxDao;
  late SyncCoordinator coordinator;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    outboxDao = OutboxDao(db);
    coordinator = SyncCoordinator(outboxDao: outboxDao);
  });


  tearDown(() async {
    coordinator.dispose();
    await db.close();
  });

  group('SyncCoordinator Architecture & Resilience', () {
    test('Routing: Enqueued items are routed to the registered entity handler and removed upon success', () async {
      bool handlerCalled = false;
      String? receivedOp;
      Map<String, dynamic>? receivedPayload;

      coordinator.registerHandler('milk_record', (op, payload) async {
        handlerCalled = true;
        receivedOp = op;
        receivedPayload = payload;
      });

      // Enqueue record (we test direct syncEntityType without triggering online sync loop in test)
      final id = await outboxDao.enqueue(
        'milk_record',
        'upsert',
        jsonEncode({'animal_id': 'a1', 'quantity': 15.5}),
        idempotencyKey: 'idem_milk_1',
      );

      final pendingBefore = await outboxDao.getAllPending();
      expect(pendingBefore.length, 1);
      expect(pendingBefore.first.id, id);
      expect(pendingBefore.first.idempotencyKey, 'idem_milk_1');

      // Process queue for milk_record
      await coordinator.syncEntityType('milk_record');

      expect(handlerCalled, isTrue);
      expect(receivedOp, 'upsert');
      expect(receivedPayload?['animal_id'], 'a1');

      final pendingAfter = await outboxDao.getAllPending();
      expect(pendingAfter.isEmpty, isTrue, reason: 'Successfully processed record should be removed from outbox');
    });

    test('Isolation & Safety: Unsupported records without a handler are NEVER marked completed or removed', () async {
      await outboxDao.enqueue('unknown_entity', 'upsert', jsonEncode({'foo': 'bar'}));

      // Try to sync unknown_entity
      await coordinator.syncEntityType('unknown_entity');

      final pending = await outboxDao.getAllPending();
      expect(pending.length, 1);
      expect(pending.first.entityType, 'unknown_entity', reason: 'Record must remain in outbox if unsupported');
    });

    test('Exponential Backoff & Retry Limit: Failures increment attempts and permanently fail after max threshold', () async {
      int failureCount = 0;
      coordinator.registerHandler('egg_record', (op, payload) async {
        failureCount++;
        throw Exception('Simulated temporary network/server error #$failureCount');
      });

      await outboxDao.enqueue('egg_record', 'upsert', jsonEncode({'quantity': 30}));

      // Attempt 1: fails -> retrying status, attempt count 1
      await coordinator.syncEntityType('egg_record');
      var items = await outboxDao.getAllPending();
      expect(items.first.status, 'retrying');
      expect(items.first.attemptCount, 1);
      expect(items.first.nextRetryAt, isNotNull);

      // Simulate subsequent failing attempts directly to reach max threshold (5 attempts)
      for (int i = 2; i < 4; i++) {
        await outboxDao.markRetrying(items.first.id, 'Retry $i error', i, DateTime.now().subtract(const Duration(minutes: 1)));
        await coordinator.syncEntityType('egg_record');
        items = await outboxDao.getAllPending();
      }

      // At attempt 4, trigger 5th failing attempt
      await outboxDao.markRetrying(items.first.id, 'Retry 4 error', 4, DateTime.now().subtract(const Duration(minutes: 1)));
      await coordinator.syncEntityType('egg_record');


      // After 5 attempts, item should transition out of pending/retrying into permanently_failed
      final remainingPending = await outboxDao.getAllPending();
      expect(remainingPending.isEmpty, isTrue);

      final failedItems = await outboxDao.getAllFailed();
      expect(failedItems.length, 1);
      expect(failedItems.first.status, 'permanently_failed');
      expect(failedItems.first.errorMessage, contains('Max retry attempts exceeded'));
    });

    test('Crash Recovery: Records stuck in processing state for over 5 minutes are recovered back to pending', () async {
      final oldId = await outboxDao.enqueue('feed_record', 'upsert', jsonEncode({'cost': 500}));
      final recentId = await outboxDao.enqueue('feed_record', 'upsert', jsonEncode({'cost': 100}));

      // Set both to processing
      await outboxDao.markProcessing(oldId);
      await outboxDao.markProcessing(recentId);

      // Force update oldId createdAt to 10 minutes ago
      await (db.update(db.syncOutboxTable)..where((t) => t.id.equals(oldId))).write(
        SyncOutboxTableCompanion(
          createdAt: Value(DateTime.now().subtract(const Duration(minutes: 10))),
        ),
      );

      await coordinator.recoverStuckItems();

      final allItems = await outboxDao.getAllPending();
      final recovered = allItems.firstWhere((i) => i.id == oldId);
      final untouched = allItems.firstWhere((i) => i.id == recentId);

      expect(recovered.status, 'pending');
      expect(untouched.status, 'processing');
    });

    test('Manual Retry: User action resets permanently failed items to pending queue', () async {
      final id = await outboxDao.enqueue('milk_record', 'upsert', jsonEncode({'quantity': 20}));
      await outboxDao.markPermanentlyFailed(id, 'Fatal error');

      expect((await outboxDao.getAllFailed()).length, 1);
      expect((await outboxDao.getAllPending()).isEmpty, isTrue);

      await outboxDao.retryAllFailed();

      expect((await outboxDao.getAllFailed()).isEmpty, isTrue);
      expect((await outboxDao.getAllPending()).length, 1);
      expect((await outboxDao.getAllPending()).first.status, 'pending');
    });
  });
}
