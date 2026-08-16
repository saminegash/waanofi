import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/public_listing_model.dart';

final buyerMarketplaceRepositoryProvider = Provider<BuyerMarketplaceRepository>((ref) {
  return BuyerMarketplaceRepository(client: Supabase.instance.client);
});

class CachedListingsResult {
  final List<PublicListingModel> listings;
  final DateTime? lastRefreshed;
  final bool isOffline;

  CachedListingsResult({
    required this.listings,
    this.lastRefreshed,
    this.isOffline = false,
  });
}

class BuyerMarketplaceRepository {
  BuyerMarketplaceRepository({required SupabaseClient client}) : _client = client;
  final SupabaseClient _client;

  static const _cacheKey = 'waanofi_cached_public_listings';
  static const _timestampKey = 'waanofi_cached_public_listings_time';

  /// Browse approved listings with automatic offline caching and filtering
  Future<CachedListingsResult> browsePublicListings({
    String? category, // 'fresh_milk', 'eggs', or null for All
    String? searchQuery,
    String? locationFilter,
    String? fulfilmentFilter, // 'pickup' or 'delivery'
    bool forceOffline = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    
    if (!forceOffline) {
      try {
        var query = _client
            .from('public_marketplace_listings')
            .select()
            .order('listing_id', ascending: false);

        if (category != null && category.isNotEmpty && category != 'all') {
          query = _client
              .from('public_marketplace_listings')
              .select()
              .eq('category', category)
              .order('listing_id', ascending: false);
        }

        final response = await query;
        final listings = (response as List)
            .map((json) => PublicListingModel.fromJson(json))
            .toList();

        // Save to offline cache with current timestamp
        final now = DateTime.now();
        await prefs.setString(_cacheKey, jsonEncode(response));
        await prefs.setString(_timestampKey, now.toIso8601String());

        return CachedListingsResult(
          listings: _applyLocalFilters(listings, searchQuery, locationFilter, fulfilmentFilter),
          lastRefreshed: now,
          isOffline: false,
        );
      } catch (e) {
        // Fallback to offline cache below if network error
      }
    }

    // Retrieve from offline cache
    final cachedJson = prefs.getString(_cacheKey);
    final timestampStr = prefs.getString(_timestampKey);
    final lastRefreshed = timestampStr != null ? DateTime.tryParse(timestampStr) : null;

    if (cachedJson == null) {
      return CachedListingsResult(listings: [], lastRefreshed: null, isOffline: true);
    }

    try {
      final decoded = jsonDecode(cachedJson) as List;
      var listings = decoded.map((json) => PublicListingModel.fromJson(json)).toList();
      if (category != null && category.isNotEmpty && category != 'all') {
        listings = listings.where((l) => l.category == category).toList();
      }
      return CachedListingsResult(
        listings: _applyLocalFilters(listings, searchQuery, locationFilter, fulfilmentFilter),
        lastRefreshed: lastRefreshed,
        isOffline: true,
      );
    } catch (e) {
      return CachedListingsResult(listings: [], lastRefreshed: null, isOffline: true);
    }
  }

  List<PublicListingModel> _applyLocalFilters(
    List<PublicListingModel> input,
    String? searchQuery,
    String? location,
    String? fulfilment,
  ) {
    return input.where((item) {
      if (searchQuery != null && searchQuery.trim().isNotEmpty) {
        final q = searchQuery.trim().toLowerCase();
        final matchTitle = item.publicTitle.toLowerCase().contains(q) ||
            item.publicFarmName.toLowerCase().contains(q) ||
            (item.productNameAm?.contains(q) ?? false) ||
            (item.productNameOm?.contains(q) ?? false);
        if (!matchTitle) return false;
      }
      if (location != null && location.trim().isNotEmpty) {
        if (!item.generalLocation.toLowerCase().contains(location.trim().toLowerCase())) {
          return false;
        }
      }
      if (fulfilment == 'pickup' && !item.supportsPickup) return false;
      if (fulfilment == 'delivery' && !item.supportsDelivery) return false;
      return true;
    }).toList();
  }

  /// Fetch public listings for a specific seller
  Future<List<PublicListingModel>> getSellerPublicListings(String farmId) async {
    final response = await _client
        .from('public_marketplace_listings')
        .select()
        .eq('farm_id', farmId)
        .order('listing_id', ascending: false);

    return (response as List).map((json) => PublicListingModel.fromJson(json)).toList();
  }
}
