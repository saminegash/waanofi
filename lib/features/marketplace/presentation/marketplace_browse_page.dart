import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../domain/production_batch_model.dart';
import '../domain/marketplace_listing_model.dart';
import 'controllers/marketplace_controller.dart';

class MarketplaceBrowsePage extends ConsumerWidget {
  const MarketplaceBrowsePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(marketplaceControllerProvider);
    final controller = ref.read(marketplaceControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.marketplace),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            tooltip: l10n.myOrders,
            onPressed: () => context.push('/marketplace/orders'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                FilterChip(
                  label: Text(l10n.allCategories),
                  selected: state.selectedCategory == null,
                  onSelected: (_) => controller.filterByCategory(null),
                  selectedColor: WaanofiColors.primaryLight.withValues(alpha: 0.3),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(l10n.freshMilk),
                  avatar: const Icon(Icons.water_drop, size: 16),
                  selected: state.selectedCategory == ProductCategory.freshMilk,
                  onSelected: (_) => controller.filterByCategory(ProductCategory.freshMilk),
                  selectedColor: WaanofiColors.primaryLight.withValues(alpha: 0.3),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: Text(l10n.eggs),
                  avatar: const Icon(Icons.egg, size: 16),
                  selected: state.selectedCategory == ProductCategory.eggs,
                  onSelected: (_) => controller.filterByCategory(ProductCategory.eggs),
                  selectedColor: WaanofiColors.primaryLight.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),

          // Listings Grid
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.error_outline, size: 48, color: WaanofiColors.error),
                            const SizedBox(height: 8),
                            Text(l10n.error, style: const TextStyle(color: WaanofiColors.error)),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: controller.refresh,
                              child: Text(l10n.retry),
                            ),
                          ],
                        ),
                      )
                    : state.listings.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.storefront_outlined, size: 64, color: WaanofiColors.textSecondary.withValues(alpha: 0.5)),
                                const SizedBox(height: 16),
                                Text(l10n.noListings, style: const TextStyle(fontSize: 16, color: WaanofiColors.textSecondary)),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: controller.refresh,
                            child: GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.72,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: state.listings.length,
                              itemBuilder: (context, index) {
                                final listing = state.listings[index];
                                return _ListingCard(listing: listing);
                              },
                            ),
                          ),
          ),
        ],
      ),
    );
  }
}

class _ListingCard extends StatelessWidget {
  const _ListingCard({required this.listing});

  final MarketplaceListingModel listing;

  @override
  Widget build(BuildContext context) {
    final isMilk = listing.category == ProductCategory.freshMilk;

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => context.push('/marketplace/${listing.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Product Image / Placeholder
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isMilk
                      ? [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)]
                      : [const Color(0xFFFFF8E1), const Color(0xFFFFECB3)],
                ),
              ),
              child: Center(
                child: Icon(
                  isMilk ? Icons.water_drop : Icons.egg,
                  size: 48,
                  color: isMilk ? const Color(0xFF1565C0) : const Color(0xFFF57F17),
                ),
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listing.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    if (listing.farm != null)
                      Text(
                        listing.farm!['name'] ?? '',
                        style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
                      ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${listing.priceFormatted} ETB',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: WaanofiColors.primary,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '/${listing.unit}',
                          style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${listing.quantityAvailable.toStringAsFixed(0)} ${listing.unit}',
                      style: const TextStyle(fontSize: 11, color: WaanofiColors.textSecondary),
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
}
