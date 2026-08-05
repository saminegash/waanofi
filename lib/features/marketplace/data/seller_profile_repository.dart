import 'dart:async';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../domain/farm_market_profile_model.dart';

final sellerProfileRepositoryProvider = Provider<SellerProfileRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = SellerProfileRepository(
    client: Supabase.instance.client,
    db: db,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
  );

  ref.onDispose(() => repo.dispose());
  return repo;
});

class SellerProfileRepository {
  SellerProfileRepository({
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
    _syncCoordinator.registerHandler('farm_market_profile', _handleSync);
    _syncCoordinator.start();
    await _syncFromRemote();

    _subscription = _client
        .channel('public:farm_market_profiles')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'farm_market_profiles',
            filter: PostgresChangeFilter(
              type: PostgresChangeFilterType.eq,
              column: 'farm_id',
              value: _farmId!,
            ),
            callback: (payload) => _syncFromRemote())
        .subscribe();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('farm_market_profiles').upsert(payload);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final res = await _client
          .from('farm_market_profiles')
          .select()
          .eq('farm_id', _farmId)
          .maybeSingle();
      if (res != null) {
        final model = FarmMarketProfileModel.fromJson(res);
        await _saveLocal(model);
      }
    } catch (e) {
      debugPrint('Seller profile remote sync failed: $e');
    }
  }

  Stream<FarmMarketProfileModel?> watchProfile() {
    if (_farmId == null) return Stream.value(null);
    return _db.select(_db.farmMarketProfilesTable).watch().map((rows) {
      final match = rows.where((r) => r.farmId == _farmId).firstOrNull;
      if (match == null) return null;
      return FarmMarketProfileModel(
        farmId: match.farmId,
        publicFarmName: match.publicFarmName,
        publicDescription: match.publicDescription,
        publicPhone: match.publicPhone,
        publicEmail: match.publicEmail,
        generalLocation: match.generalLocation,
        marketplaceStatus: MarketProfileStatus.values.firstWhere(
            (e) => e.name == match.marketplaceStatus,
            orElse: () => MarketProfileStatus.draft),
        createdAt: match.createdAt,
        updatedAt: match.updatedAt,
      );
    });
  }

  Future<void> saveProfile(FarmMarketProfileModel profile) async {
    await _saveLocal(profile);
    await _syncCoordinator.enqueue('farm_market_profile', 'upsert', profile.toJson(), idempotencyKey: 'profile_${profile.farmId}');
  }

  Future<void> submitForVerification() async {
    if (_farmId == null) return;
    final current = await watchProfile().first;
    if (current == null) return;
    final updated = current.copyWith(
      verificationStatus: 'pending_review',
      marketplaceStatus: MarketProfileStatus.pendingReview,
      updatedAt: DateTime.now(),
    );
    await saveProfile(updated);
  }

  Future<void> _saveLocal(FarmMarketProfileModel profile) async {
    await _db.into(_db.farmMarketProfilesTable).insertOnConflictUpdate(
          FarmMarketProfilesTableCompanion.insert(
            farmId: profile.farmId,
            publicFarmName: profile.publicFarmName,
            generalLocation: profile.generalLocation,
            publicDescription: profile.publicDescription != null ? driftValue(profile.publicDescription!) : const drift.Value.absent(),
            publicPhone: profile.publicPhone != null ? driftValue(profile.publicPhone!) : const drift.Value.absent(),
            publicEmail: profile.publicEmail != null ? driftValue(profile.publicEmail!) : const drift.Value.absent(),
          ),
        );
  }

  drift.Value<String> driftValue(String val) => drift.Value(val);

  void dispose() {
    _subscription?.unsubscribe();
  }
}
