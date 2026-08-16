import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import 'package:waanofi/core/sync/connectivity_provider.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../data/buyer_marketplace_repository.dart';
import '../domain/public_listing_model.dart';
import '../domain/cart_model.dart';
import 'controllers/cart_controller.dart';

final publicListingsBrowseProvider = FutureProvider.autoDispose.family<CachedListingsResult, Map<String, String?>>((ref, filters) async {
  final repo = ref.watch(buyerMarketplaceRepositoryProvider);
  final isOffline = ref.watch(isOfflineProvider);
  return repo.browsePublicListings(
    category: filters['category'],
    searchQuery: filters['search'],
    locationFilter: filters['location'],
    fulfilmentFilter: filters['fulfilment'],
    forceOffline: isOffline,
  );
});

class MarketplaceBrowsePage extends ConsumerStatefulWidget {
  const MarketplaceBrowsePage({super.key});

  @override
  ConsumerState<MarketplaceBrowsePage> createState() => _MarketplaceBrowsePageState();
}

class _MarketplaceBrowsePageState extends ConsumerState<MarketplaceBrowsePage> {
  String? _selectedCategory = 'all';
  String _searchQuery = '';
  String? _selectedFulfilment;
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _refresh() {
    ref.invalidate(publicListingsBrowseProvider);
  }

  String _formatTimeAgo(DateTime? time) {
    if (time == null) return 'recently';
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} mins ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cart = ref.watch(cartControllerProvider);
    final isOffline = ref.watch(isOfflineProvider);

    final filters = {
      'category': _selectedCategory == 'all' ? null : _selectedCategory,
      'search': _searchQuery.isEmpty ? null : _searchQuery,
      'fulfilment': _selectedFulfilment,
    };

    final listingsAsync = ref.watch(publicListingsBrowseProvider(filters));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.marketplace, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: l10n.buyerAccount,
            onPressed: () => context.push('/buyer/onboarding'),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                tooltip: l10n.farmCart,
                onPressed: () => context.push('/marketplace/cart'),
              ),
              if (!cart.isEmpty)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      '${cart.itemCount}',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            tooltip: l10n.viewOrders,
            onPressed: () => context.push('/marketplace/orders'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Offline Indicator Banner
          if (isOffline)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.amber.withValues(alpha: 0.2),
              child: Row(
                children: [
                  const Icon(Icons.cloud_off, size: 18, color: Colors.amber),
                  const SizedBox(width: 8),
                  Expanded(
                    child: listingsAsync.when(
                      data: (res) => Text('${l10n.lastRefreshed} ${_formatTimeAgo(res.lastRefreshed)}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      loading: () => Text(l10n.lastRefreshed, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      error: (_, __) => Text(l10n.lastRefreshed, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),

          // Search and Filter Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Search fresh dairy, eggs, or farmer name...',
                prefixIcon: const Icon(Icons.search, color: WaanofiColors.textSecondary),
                suffixIcon: _searchQuery.isNotEmpty ? IconButton(icon: const Icon(Icons.clear), onPressed: () { _searchCtrl.clear(); setState(() => _searchQuery = ''); }) : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: WaanofiColors.outline)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              onChanged: (val) => setState(() => _searchQuery = val),
            ),
          ),

          // Category Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('All Products'),
                  selected: _selectedCategory == 'all',
                  onSelected: (_) => setState(() => _selectedCategory = 'all'),
                  selectedColor: WaanofiColors.primary.withValues(alpha: 0.2),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  avatar: const Icon(Icons.water_drop, color: Colors.blue, size: 16),
                  label: Text(l10n.freshMilk),
                  selected: _selectedCategory == 'fresh_milk',
                  onSelected: (_) => setState(() => _selectedCategory = _selectedCategory == 'fresh_milk' ? 'all' : 'fresh_milk'),
                  selectedColor: Colors.blue.withValues(alpha: 0.2),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  avatar: const Icon(Icons.egg, color: Colors.orange, size: 16),
                  label: const Text('Pasture Eggs'),
                  selected: _selectedCategory == 'eggs',
                  onSelected: (_) => setState(() => _selectedCategory = _selectedCategory == 'eggs' ? 'all' : 'eggs'),
                  selectedColor: Colors.orange.withValues(alpha: 0.2),
                ),
                const SizedBox(width: 12),
                const VerticalDivider(width: 1),
                const SizedBox(width: 12),
                FilterChip(
                  label: Text(l10n.pickupAtFarm),
                  selected: _selectedFulfilment == 'pickup',
                  onSelected: (_) => setState(() => _selectedFulfilment = _selectedFulfilment == 'pickup' ? null : 'pickup'),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(l10n.deliveryToAddress),
                  selected: _selectedFulfilment == 'delivery',
                  onSelected: (_) => setState(() => _selectedFulfilment = _selectedFulfilment == 'delivery' ? null : 'delivery'),
                ),
              ],
            ),
          ),

          // Catalog Grid
          Expanded(
            child: listingsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator(color: WaanofiColors.primary)),
              error: (e, stack) => Center(
                child: EmptyStateWidget(
                  icon: Icons.error_outline,
                  title: 'Failed to Fetch Listings',
                  description: e.toString(),
                  actionLabel: 'Retry',
                  onActionPressed: _refresh,
                ),
              ),
              data: (result) {
                final listings = result.listings;
                if (listings.isEmpty) {
                  return Center(
                    child: EmptyStateWidget(
                      icon: Icons.storefront_outlined,
                      title: l10n.noOrders,
                      description: 'No active farm products match your filter criteria.',
                      actionLabel: 'Reset Filters',
                      onActionPressed: () => setState(() { _selectedCategory = 'all'; _searchQuery = ''; _selectedFulfilment = null; _searchCtrl.clear(); }),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => _refresh(),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: listings.length,
                    itemBuilder: (context, index) {
                      final item = listings[index];
                      return _PublicListingCard(item: item);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PublicListingCard extends ConsumerWidget {
  const _PublicListingCard({required this.item});
  final PublicListingModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isMilk = item.category == 'fresh_milk';

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: WaanofiColors.outline, width: 0.5)),
      child: InkWell(
        onTap: () => context.push('/marketplace/listing/${item.listingId}', extra: item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 95,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isMilk ? [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)] : [const Color(0xFFFFF8E1), const Color(0xFFFFECB3)],
                ),
              ),
              child: Center(
                child: Icon(
                  isMilk ? Icons.water_drop : Icons.egg,
                  size: 44,
                  color: isMilk ? const Color(0xFF1565C0) : const Color(0xFFF57F17),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.publicTitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 2),
                    InkWell(
                      onTap: () => context.push('/marketplace/seller/${item.farmId}', extra: item.publicFarmName),
                      child: Row(
                        children: [
                          Expanded(child: Text(item.publicFarmName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary, decoration: TextDecoration.underline))),
                          const SizedBox(width: 2),
                          const Icon(Icons.verified, color: Colors.blue, size: 13),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(item.formattedPriceEtb, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primary, fontSize: 13)),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: item.canBeOrdered ? WaanofiColors.primary : Colors.grey,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: item.canBeOrdered ? () => _addToCart(context, ref, item, l10n) : null,
                        child: Text(item.canBeOrdered ? l10n.addToCart : l10n.outOfStock, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, WidgetRef ref, PublicListingModel item, AppLocalizations l10n) {
    final res = ref.read(cartControllerProvider.notifier).addItem(item, quantity: item.minimumOrderQuantity);
    if (res.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${l10n.itemAddedToCart}: ${item.publicTitle}')));
    } else if (res.isFarmConflict) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.farmCart),
          content: Text(l10n.cartClearPrompt),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(l10n.no)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.primary, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(ctx).pop();
                ref.read(cartControllerProvider.notifier).clearAndAddItem(item, quantity: item.minimumOrderQuantity);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.itemAddedToCart)));
              },
              child: Text(l10n.clearAndAdd),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.message ?? 'Error adding item'), backgroundColor: Colors.red));
    }
  }
}
