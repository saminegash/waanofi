import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/buyer_marketplace_repository.dart';
import '../../domain/public_listing_model.dart';
import '../controllers/cart_controller.dart';

final sellerPublicListingsProvider = FutureProvider.family<List<PublicListingModel>, String>((ref, farmId) async {
  final repo = ref.watch(buyerMarketplaceRepositoryProvider);
  return repo.getSellerPublicListings(farmId);
});

class PublicSellerProfilePage extends ConsumerWidget {
  const PublicSellerProfilePage({super.key, required this.farmId, required this.farmName});
  final String farmId;
  final String farmName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final listingsAsync = ref.watch(sellerPublicListingsProvider(farmId));

    return Scaffold(
      appBar: AppBar(
        title: Text(farmName, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => context.push('/marketplace/cart'),
          ),
        ],
      ),
      body: listingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: WaanofiColors.primary)),
        error: (err, stack) => Center(
          child: EmptyStateWidget(
            icon: Icons.error_outline,
            title: 'Failed to Load Seller',
            description: err.toString(),
          ),
        ),
        data: (listings) {
          final first = listings.isNotEmpty ? listings.first : null;
          final location = first?.generalLocation ?? 'Ethiopia';
          const hours = 'Mon-Sat 6:00 AM - 6:00 PM';
          final pickup = first?.pickupAvailability ?? true;
          final delivery = first?.deliveryAvailability ?? false;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: WaanofiColors.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: WaanofiColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: WaanofiColors.primary, width: 2),
                            ),
                            child: const Icon(Icons.agriculture, color: WaanofiColors.primary, size: 32),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      farmName,
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(Icons.verified, color: Colors.blue, size: 20),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16, color: WaanofiColors.textSecondary),
                                    const SizedBox(width: 4),
                                    Text(location, style: const TextStyle(color: WaanofiColors.textSecondary)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 18, color: WaanofiColors.primary),
                          const SizedBox(width: 8),
                          Text('Hours: $hours', style: const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          if (pickup)
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(l10n.pickupAtFarm, style: const TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          if (delivery)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(l10n.deliveryToAddress, style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l10n.sellerProducts,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark),
                  ),
                ),
              ),
              if (listings.isEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: EmptyStateWidget(
                      icon: Icons.store_outlined,
                      title: l10n.outOfStock,
                      description: 'This farm currently has no active listings.',
                    ),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = listings[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: WaanofiColors.outline),
                        ),
                        child: InkWell(
                          onTap: () => context.push('/marketplace/listing/${item.listingId}'),
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: item.category == 'eggs' ? Colors.orange.withValues(alpha: 0.1) : Colors.blue.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    item.category == 'eggs' ? Icons.egg : Icons.water_drop,
                                    color: item.category == 'eggs' ? Colors.orange : Colors.blue,
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.publicTitle,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.formattedPriceEtb,
                                        style: const TextStyle(color: WaanofiColors.primary, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${l10n.minimumOrderQuantity}: ${item.minimumOrderQuantity} ${item.sellingUnit}',
                                        style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_shopping_cart, color: WaanofiColors.primary),
                                  onPressed: item.canBeOrdered
                                      ? () => _addToCart(context, ref, item, l10n)
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: listings.length,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, WidgetRef ref, PublicListingModel item, AppLocalizations l10n) {
    final res = ref.read(cartControllerProvider.notifier).addItem(item, quantity: item.minimumOrderQuantity);
    if (res.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${l10n.itemAddedToCart}: ${item.publicTitle}')));
    } else if (res.isFarmConflict) {
      _showCartConflictDialog(context, ref, res, l10n);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.message ?? 'Validation Error'), backgroundColor: Colors.red));
    }
  }

  void _showCartConflictDialog(BuildContext context, WidgetRef ref, CartActionResult res, AppLocalizations l10n) {
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
              if (res.pendingListing != null && res.pendingQuantity != null) {
                ref.read(cartControllerProvider.notifier).clearAndAddItem(res.pendingListing!, quantity: res.pendingQuantity!);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.itemAddedToCart)));
              }
            },
            child: Text(l10n.clearAndAdd),
          ),
        ],
      ),
    );
  }
}
