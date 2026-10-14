import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/providers/database_provider.dart';
import '../../data/local/app_database.dart';
import '../../data/local/daos/outbox_dao.dart';

typedef EntitySyncHandler = Future<void> Function(String operation, Map<String, dynamic> payload);

final syncCoordinatorProvider = Provider<SyncCoordinator>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final outboxDao = OutboxDao(db);
  final coordinator = SyncCoordinator(outboxDao: outboxDao);

  ref.onDispose(() => coordinator.dispose());
  return coordinator;
});

class SyncCoordinator {
  SyncCoordinator({required OutboxDao outboxDao}) : _outboxDao = outboxDao;

  final OutboxDao _outboxDao;
  final Map<String, EntitySyncHandler> _handlers = {};
  Timer? _timer;
  StreamSubscription<List<ConnectivityResult>>? _connSub;
  bool _isSyncing = false;
  bool _isRunning = false;

  /// Register a synchronization handler for a specific entity type (e.g., 'milk_record').
  void registerHandler(String entityType, EntitySyncHandler handler) {
    _handlers[entityType] = handler;
  }

  /// Start background monitoring, crash recovery, and network listener.
  void start() {
    if (_isRunning) return;
    _isRunning = true;

    // Run crash recovery for any items stuck in 'processing' state from prior terminated session
    recoverStuckItems();

    // Trigger initial sync attempt
    syncAll();

    // Listen to network connectivity changes
    _connSub = Connectivity().onConnectivityChanged.listen((results) {
      if (!results.contains(ConnectivityResult.none) && _isRunning) {
        syncAll();
      }
    });

    // Periodic polling every 45 seconds
    _timer = Timer.periodic(const Duration(seconds: 45), (_) {
      if (_isRunning) {
        syncAll();
      }
    });
  }

  /// Stop background synchronization (invoked upon logout or shutdown).
  void stop() {
    _isRunning = false;
    _timer?.cancel();
    _connSub?.cancel();
  }

  void dispose() {
    stop();
  }

  /// Recover any items stuck in 'processing' state for longer than 5 minutes.
  Future<void> recoverStuckItems() async {
    final cutoff = DateTime.now().subtract(const Duration(minutes: 5));
    final count = await _outboxDao.recoverStuckProcessing(cutoff);
    if (count > 0 && kDebugMode) {
      debugPrint('SyncCoordinator: Recovered $count stalled processing outbox items');
    }
  }

  /// Enqueue a new item and trigger immediate sync if online.
  Future<int> enqueue(String entityType, String operation, Map<String, dynamic> payload, {String? idempotencyKey}) async {
    final jsonStr = jsonEncode(payload);
    final id = await _outboxDao.enqueue(entityType, operation, jsonStr, idempotencyKey: idempotencyKey);
    unawaited(syncAll());
    return id;
  }

  /// Batch enqueue multiple items.
  Future<void> enqueueAll(String entityType, String operation, List<Map<String, dynamic>> payloads, {List<String?>? idempotencyKeys}) async {
    final jsonList = payloads.map((p) => jsonEncode(p)).toList();
    await _outboxDao.enqueueAll(entityType, operation, jsonList, idempotencyKeys: idempotencyKeys);
    unawaited(syncAll());
  }

  /// Synchronize all pending items across all registered entity types.
  /// Enforces explicit dependency sequencing (e.g., flocks prior to egg production records).
  Future<void> syncAll() async {
    if (!_isRunning || _isSyncing) return;

    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) return;

    _isSyncing = true;
    try {
      await recoverStuckItems();
      
      // Define dependency order: parent tables first, followed by child transactional records
      const priorityOrder = [
        'feed_type',
        'animal',
        'animal_state_log',
        'flock',
        'milk_record',
        'egg_record',
        'egg_production_record',
        'feed_record',
        'flock_adjustment',
        'farm_market_profile',
        'inventory_batch',
        'quality_check',
        'market_listing',
      ];

      final sortedEntities = _handlers.keys.toList()
        ..sort((a, b) {
          final idxA = priorityOrder.indexOf(a);
          final idxB = priorityOrder.indexOf(b);
          if (idxA == -1 && idxB == -1) return a.compareTo(b);
          if (idxA == -1) return 1;
          if (idxB == -1) return -1;
          return idxA.compareTo(idxB);
        });

      for (final entityType in sortedEntities) {
        if (!_isRunning) break;
        await syncEntityType(entityType);
      }
    } finally {
      _isSyncing = false;
    }
  }


  /// Process pending records for a single entity type.
  /// Prevents one repository from interfering with another repository's records.
  Future<void> syncEntityType(String entityType) async {
    final handler = _handlers[entityType];
    if (handler == null) {
      debugPrint('SyncCoordinator: No registered handler for entityType "$entityType". Skipping.');
      return; // NEVER mark unsupported record as completed!
    }

    final items = await _outboxDao.getEligibleForSync(entityType);
    if (items.isEmpty) return;

    for (final item in items) {
      try {
        await _outboxDao.markProcessing(item.id);

        final payload = jsonDecode(item.payload) as Map<String, dynamic>;
        
        // Execute repository handler
        await handler(item.operation, payload);

        // On success, mark completed and remove from outbox
        await _outboxDao.markCompleted(item.id);
      } on PostgrestException catch (e) {
        // Handle postgres error codes
        if (e.code == '23505') {
          // Duplicate key / Idempotency hit: treat as successful duplicate resolution
          await _outboxDao.markCompleted(item.id);
        } else if (_isNonRetryablePostgrestError(e)) {
          // RLS violation or invalid schema: permanently fail without infinite loops
          await _outboxDao.markPermanentlyFailed(item.id, e.message, errorCode: e.code);
        } else {
          await _handleRetryableFailure(item, e.message, errorCode: e.code);
        }
      } catch (e) {
        await _handleRetryableFailure(item, e.toString());
      }
    }
  }

  bool _isNonRetryablePostgrestError(PostgrestException e) {
    // 42501 = Insufficient privilege (RLS failure)
    // 23503 = Foreign key constraint violation
    // 23502 = Not null violation
    return e.code == '42501' || e.code == '23503' || e.code == '23502';
  }

  Future<void> _handleRetryableFailure(SyncOutboxItem item, String error, {String? errorCode}) async {
    final nextAttempt = item.attemptCount + 1;
    if (nextAttempt >= 5) {
      // Exceeded max retry count -> mark permanently failed for user visibility and support
      await _outboxDao.markPermanentlyFailed(item.id, 'Max retry attempts exceeded: $error', errorCode: errorCode);
      debugPrint('SyncCoordinator: Item ${item.id} permanently failed after 5 attempts.');
    } else {
      // Calculate exponential backoff with max delay capped at 1 hour (3600 seconds)
      final delaySeconds = math.min<num>(3600, math.pow(2, nextAttempt) * 2).toInt();
      final nextRetry = DateTime.now().add(Duration(seconds: delaySeconds));
      await _outboxDao.markRetrying(item.id, error, nextAttempt, nextRetry, errorCode: errorCode);
      debugPrint('SyncCoordinator: Item ${item.id} retry scheduled in $delaySeconds seconds.');
    }
  }

  // UI status streams and helper calls
  Stream<List<SyncOutboxItem>> watchPending() => _outboxDao.watchPending();
  Stream<List<SyncOutboxItem>> watchFailed() => _outboxDao.watchFailed();
  Future<List<SyncOutboxItem>> getPending() => _outboxDao.getAllPending();
  Future<List<SyncOutboxItem>> getFailed() => _outboxDao.getAllFailed();
  Future<void> retryPermanentlyFailed() async {
    await _outboxDao.retryAllFailed();
    unawaited(syncAll());
  }
}
