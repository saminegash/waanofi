import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/auth_providers.dart';
import '../domain/production_batch_model.dart';
import '../domain/marketplace_listing_model.dart';

final marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ref) {
  final user = ref.watch(currentUserProvider);
  return MarketplaceRepository(
    client: Supabase.instance.client,
    farmId: user?.farmId,
  );
});

/// Repository for marketplace listings and production batches.
///
/// This is online-only — marketplace operations require connectivity.
/// Production recording (eggs/milk) remains offline-capable via their own repos.
class MarketplaceRepository {
  MarketplaceRepository({
    required SupabaseClient client,
    required String? farmId,
  })  : _client = client,
        _farmId = farmId;

  final SupabaseClient _client;
  final String? _farmId;

  // ───────────────── Production Batches ─────────────────

  /// Create a new production batch (admin only, validated server-side by RLS)
  Future<ProductionBatchModel> createBatch({
    required ProductCategory category,
    required String batchLabel,
    required double quantityTotal,
    required String unit,
    required int unitPriceMinor,
    required DateTime productionDate,
    DateTime? expiryDate,
  }) async {
    final response = await _client.from('production_batches').insert({
      'farm_id': _farmId,
      'category': category == ProductCategory.freshMilk ? 'fresh_milk' : 'eggs',
      'batch_label': batchLabel,
      'quantity_total': quantityTotal,
      'quantity_available': quantityTotal,
      'unit': unit,
      'unit_price_minor': unitPriceMinor,
      'production_date': productionDate.toIso8601String().split('T').first,
      'expiry_date': expiryDate?.toIso8601String().split('T').first,
      'created_by': _client.auth.currentUser!.id,
    }).select().single();

    return ProductionBatchModel.fromJson(response);
  }

  /// Get all batches for the current farm
  Future<List<ProductionBatchModel>> getFarmBatches() async {
    if (_farmId == null) return [];
    final response = await _client
        .from('production_batches')
        .select()
        .eq('farm_id', _farmId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => ProductionBatchModel.fromJson(json))
        .toList();
  }

  /// Approve a batch and optionally create a listing (calls server-side RPC)
  Future<Map<String, dynamic>> approveAndListBatch({
    required String batchId,
    String? title,
    String? description,
  }) async {
    final response = await _client.rpc('approve_and_list_batch', params: {
      'p_batch_id': batchId,
      'p_title': title,
      'p_description': description,
    });
    return Map<String, dynamic>.from(response);
  }

  // ───────────────── Marketplace Listings ─────────────────

  /// Browse all active marketplace listings (cross-farm)
  Future<List<MarketplaceListingModel>> browseListings({
    ProductCategory? category,
    int limit = 50,
    int offset = 0,
  }) async {
    var query = _client
        .from('marketplace_listings')
        .select('*, farms!inner(name)')
        .eq('is_active', true)
        .order('created_at', ascending: false)
        .range(offset, offset + limit - 1);

    if (category != null) {
      final catStr = category == ProductCategory.freshMilk ? 'fresh_milk' : 'eggs';
      query = _client
          .from('marketplace_listings')
          .select('*, farms!inner(name)')
          .eq('is_active', true)
          .eq('category', catStr)
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);
    }

    final response = await query;
    return (response as List)
        .map((json) => MarketplaceListingModel.fromJson(json))
        .toList();
  }

  /// Get a single listing by ID
  Future<MarketplaceListingModel> getListingById(String listingId) async {
    final response = await _client
        .from('marketplace_listings')
        .select('*, farms!inner(name)')
        .eq('id', listingId)
        .single();

    return MarketplaceListingModel.fromJson(response);
  }

  /// Get listings for the current farm (seller view)
  Future<List<MarketplaceListingModel>> getMyListings() async {
    if (_farmId == null) return [];
    final response = await _client
        .from('marketplace_listings')
        .select()
        .eq('farm_id', _farmId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => MarketplaceListingModel.fromJson(json))
        .toList();
  }

  /// Deactivate a listing
  Future<void> deactivateListing(String listingId) async {
    await _client
        .from('marketplace_listings')
        .update({'is_active': false})
        .eq('id', listingId);
  }
}
