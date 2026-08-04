import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/marketplace_repository.dart';
import '../../domain/production_batch_model.dart';
import '../../domain/marketplace_listing_model.dart';

/// State for the marketplace browse screen
class MarketplaceBrowseState {
  const MarketplaceBrowseState({
    this.listings = const [],
    this.isLoading = true,
    this.error,
    this.selectedCategory,
  });

  final List<MarketplaceListingModel> listings;
  final bool isLoading;
  final String? error;
  final ProductCategory? selectedCategory;

  MarketplaceBrowseState copyWith({
    List<MarketplaceListingModel>? listings,
    bool? isLoading,
    String? error,
    ProductCategory? selectedCategory,
    bool clearCategory = false,
  }) {
    return MarketplaceBrowseState(
      listings: listings ?? this.listings,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedCategory: clearCategory ? null : (selectedCategory ?? this.selectedCategory),
    );
  }
}

final marketplaceControllerProvider =
    StateNotifierProvider.autoDispose<MarketplaceController, MarketplaceBrowseState>(
        (ref) {
  return MarketplaceController(ref);
});

class MarketplaceController extends StateNotifier<MarketplaceBrowseState> {
  MarketplaceController(this._ref) : super(const MarketplaceBrowseState()) {
    loadListings();
  }

  final Ref _ref;

  Future<void> loadListings() async {
    state = state.copyWith(isLoading: true);
    try {
      final repo = _ref.read(marketplaceRepositoryProvider);
      final listings = await repo.browseListings(
        category: state.selectedCategory,
      );
      state = state.copyWith(listings: listings, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void filterByCategory(ProductCategory? category) {
    if (category == null) {
      state = state.copyWith(clearCategory: true);
    } else {
      state = state.copyWith(selectedCategory: category);
    }
    loadListings();
  }

  Future<void> refresh() => loadListings();
}
