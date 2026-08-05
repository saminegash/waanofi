import 'dart:async';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/providers/database_provider.dart';
import '../../../core/sync/sync_coordinator.dart';
import '../../../data/local/app_database.dart';
import '../domain/seller_listing_model.dart';
import 'seller_profile_repository.dart';
import 'inventory_batch_repository.dart';
import '../domain/farm_market_profile_model.dart';

final sellerListingRepositoryProvider = Provider<SellerListingRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final syncCoordinator = ref.watch(syncCoordinatorProvider);
  final user = ref.watch(currentUserProvider);

  final repo = SellerListingRepository(
    client: Supabase.instance.client,
    db: db,
    syncCoordinator: syncCoordinator,
    farmId: user?.farmId,
    ref: ref,
  );

  ref.onDispose(() => repo.dispose());
  return repo;
});

class SellerListingRepository {
  SellerListingRepository({
    required SupabaseClient client,
    required AppDatabase db,
    required SyncCoordinator syncCoordinator,
    required String? farmId,
    required Ref ref,
  })  : _client = client,
        _db = db,
        _syncCoordinator = syncCoordinator,
        _farmId = farmId,
        _ref = ref {
    if (_farmId != null) {
      _init();
    }
  }

  final SupabaseClient _client;
  final AppDatabase _db;
  final SyncCoordinator _syncCoordinator;
  final String? _farmId;
  final Ref _ref;
  RealtimeChannel? _subscription;

  Future<void> _init() async {
    _syncCoordinator.registerHandler('market_listing', _handleSync);
    _syncCoordinator.start();
    await _syncFromRemote();

    _subscription = _client
        .channel('public:market_listings')
        .onPostgresChanges(
            event: PostgresChangeEvent.all,
            schema: 'public',
            table: 'market_listings',
            filter: PostgresChangeFilter(type: PostgresChangeFilterType.eq, column: 'farm_id', value: _farmId!),
            callback: (_) => _syncFromRemote())
        .subscribe();
  }

  Future<void> _handleSync(String operation, Map<String, dynamic> payload) async {
    if (operation == 'upsert') {
      await _client.from('market_listings').upsert(payload);
    } else if (operation == 'delete') {
      final id = payload['id'] as String;
      await _client.from('market_listings').delete().eq('id', id);
    }
  }

  Future<void> _syncFromRemote() async {
    if (_farmId == null) return;
    try {
      final res = await _client.from('market_listings').select().eq('farm_id', _farmId);
      final models = (res as List).map((json) => SellerListingModel.fromJson(json)).toList();
      for (final m in models) {
        await _saveLocal(m);
      }
    } catch (e) {
      debugPrint('Seller listing remote sync failed: $e');
    }
  }

  Stream<List<SellerListingModel>> watchListings() {
    if (_farmId == null) return Stream.value([]);
    return (_db.select(_db.marketListingsTable)..where((tbl) => tbl.farmId.equals(_farmId)))
        .watch()
        .map((rows) => rows.map(_fromLocal).toList());
  }

  Future<void> saveListing(SellerListingModel listing) async {
    // Check if activating/publishing
    if (listing.status == SellerListingStatus.active) {
      final profile = await _ref.read(sellerProfileRepositoryProvider).watchProfile().first;
      if (profile == null || !profile.isEligibleToPublish) {
        throw StateError('Only approved farm profiles may publish active listings.');
      }
      // Ensure approved inventory batch exists and is not expired or rejected
      final batches = await _ref.read(inventoryBatchRepositoryProvider).watchBatches().first;
      final hasApprovedStock = batches.any((b) => (b.productId == listing.productId || listing.productId == null) && b.canBeListed);
      if (!hasApprovedStock) {
        throw StateError('No approved inventory batches available for this product. Unapproved, rejected, or expired stock cannot supply active listings.');
      }
    }

    await _saveLocal(listing);
    await _syncCoordinator.enqueue('market_listing', 'upsert', listing.toJson(), idempotencyKey: 'listing_${listing.id}');
  }

  Future<void> pauseListing(String listingId) async {
    final all = await watchListings().first;
    final item = all.where((l) => l.id == listingId).firstOrNull;
    if (item != null) {
      await saveListing(item.copyWith(status: SellerListingStatus.paused, updatedAt: DateTime.now()));
    }
  }

  Future<void> resumeListing(String listingId) async {
    final all = await watchListings().first;
    final item = all.where((l) => l.id == listingId).firstOrNull;
    if (item != null) {
      await saveListing(item.copyWith(status: SellerListingStatus.active, updatedAt: DateTime.now()));
    }
  }

  Future<void> markOutOfStock(String listingId) async {
    final all = await watchListings().first;
    final item = all.where((l) => l.id == listingId).firstOrNull;
    if (item != null) {
      await saveListing(item.copyWith(status: SellerListingStatus.outOfStock, updatedAt: DateTime.now()));
    }
  }

  Future<void> _saveLocal(SellerListingModel m) async {
    await _db.into(_db.marketListingsTable).insertOnConflictUpdate(
          MarketListingsTableCompanion.insert(
            id: m.id,
            farmId: m.farmId,
            productId: m.productId != null ? drift.Value(m.productId!) : const drift.Value.absent(),
            publicTitle: m.publicTitle,
            publicDescription: m.publicDescription != null ? drift.Value(m.publicDescription!) : const drift.Value.absent(),
            sellingUnit: m.sellingUnit,
            unitConversion: drift.Value(m.unitConversion),
            priceInMinorUnits: m.priceInMinorUnits,
            currency: drift.Value(m.currency),
            minimumOrderQuantity: drift.Value(m.minimumOrderQuantity),
            status: drift.Value(m.status.name),
            approvalStatus: drift.Value(m.approvalStatus),
          ),
        );
  }

  SellerListingModel _fromLocal(LocalMarketListing r) {
    return SellerListingModel(
      id: r.id,
      farmId: r.farmId,
      productId: r.productId,
      publicTitle: r.publicTitle,
      publicDescription: r.publicDescription,
      sellingUnit: r.sellingUnit,
      unitConversion: r.unitConversion,
      priceInMinorUnits: r.priceInMinorUnits,
      currency: r.currency,
      minimumOrderQuantity: r.minimumOrderQuantity,
      status: SellerListingStatus.values.firstWhere((e) => e.name == r.status, orElse: () => SellerListingStatus.draft),
      approvalStatus: r.approvalStatus,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  void dispose() {
    _subscription?.unsubscribe();
  }
}
