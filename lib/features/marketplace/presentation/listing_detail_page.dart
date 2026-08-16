import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../data/buyer_marketplace_repository.dart';
import '../domain/public_listing_model.dart';
import 'controllers/cart_controller.dart';

final publicListingDetailProvider = FutureProvider.autoDispose.family<PublicListingModel?, String>((ref, id) async {
  final repo = ref.watch(buyerMarketplaceRepositoryProvider);
  final res = await repo.browsePublicListings();
  return res.listings.firstWhere((l) => l.listingId == id, orElse: () => res.listings.first);
});

class ListingDetailPage extends ConsumerStatefulWidget {
  const ListingDetailPage({super.key, required this.listingId, this.initialListing});
  final String listingId;
  final PublicListingModel? initialListing;

  @override
  ConsumerState<ListingDetailPage> createState() => _ListingDetailPageState();
}

class _ListingDetailPageState extends ConsumerState<ListingDetailPage> {
  int _quantity = 1;
  bool _initialized = false;

  void _initQty(PublicListingModel listing) {
    if (!_initialized) {
      _quantity = listing.minimumOrderQuantity;
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final listingAsync = widget.initialListing != null
        ? AsyncValue.data(widget.initialListing!)
        : ref.watch(publicListingDetailProvider(widget.listingId));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.productDetails, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => context.push('/marketplace/cart'),
          ),
        ],
      ),
      body: listingAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: WaanofiColors.primary)),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (listing) {
          if (listing == null) return const Center(child: Text('Listing not found'));
          _initQty(listing);

          final isMilk = listing.category == 'fresh_milk';

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isMilk ? [const Color(0xFFE3F2FD), const Color(0xFF90CAF9)] : [const Color(0xFFFFF8E1), const Color(0xFFFFD54F)],
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      isMilk ? Icons.water_drop : Icons.egg,
                      size: 80,
                      color: isMilk ? const Color(0xFF1565C0) : const Color(0xFFF57F17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(listing.publicTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
                          Chip(
                            label: Text(isMilk ? l10n.freshMilk : 'Pasture Eggs', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            backgroundColor: isMilk ? Colors.blue.withValues(alpha: 0.15) : Colors.orange.withValues(alpha: 0.15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => context.push('/marketplace/seller/${listing.farmId}', extra: listing.publicFarmName),
                        child: Row(
                          children: [
                            const Icon(Icons.agriculture, size: 18, color: WaanofiColors.primary),
                            const SizedBox(width: 6),
                            Text(listing.publicFarmName, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primary, fontSize: 16, decoration: TextDecoration.underline)),
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: Colors.blue, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 16, color: WaanofiColors.textSecondary),
                          const SizedBox(width: 4),
                          Text(listing.generalLocation, style: const TextStyle(color: WaanofiColors.textSecondary)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: WaanofiColors.primary.withValues(alpha: 0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.primary.withValues(alpha: 0.2))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.pricePerUnit, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text(listing.formattedPriceEtb, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Est. Stock', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                                const SizedBox(height: 4),
                                Text('${listing.approximateAvailableQuantity.toInt()} ${listing.sellingUnit}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(l10n.description, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
                      const SizedBox(height: 8),
                      Text(listing.publicDescription, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 15, height: 1.4)),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.info_outline, size: 20, color: WaanofiColors.textSecondary),
                          const SizedBox(width: 8),
                          Text('${l10n.minimumOrderQuantity}: ${listing.minimumOrderQuantity} ${listing.sellingUnit}', style: const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      if (listing.maximumOrderQuantity != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline, size: 20, color: WaanofiColors.textSecondary),
                              const SizedBox(width: 8),
                              Text('${l10n.maximumOrderQuantity}: ${listing.maximumOrderQuantity} ${listing.sellingUnit}', style: const TextStyle(fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      const SizedBox(height: 28),
                      if (listing.canBeOrdered) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _quantity > listing.minimumOrderQuantity ? () => setState(() => _quantity--) : null,
                              icon: const Icon(Icons.remove_circle_outline, size: 32, color: WaanofiColors.primary),
                            ),
                            const SizedBox(width: 16),
                            Text('$_quantity ${listing.sellingUnit}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: (listing.maximumOrderQuantity != null && _quantity >= listing.maximumOrderQuantity!)
                                  ? null
                                  : () => setState(() => _quantity++),
                              icon: const Icon(Icons.add_circle_outline, size: 32, color: WaanofiColors.primary),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => _addToCart(context, ref, listing, l10n),
                            icon: const Icon(Icons.add_shopping_cart),
                            label: Text('${l10n.addToCart} — ${((listing.priceInMinorUnits * _quantity)/100.0).toStringAsFixed(2)} ETB'),
                            style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.primary, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      ] else
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: WaanofiColors.error.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                          child: Text(l10n.outOfStock, textAlign: TextAlign.center, style: const TextStyle(color: WaanofiColors.error, fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, WidgetRef ref, PublicListingModel item, AppLocalizations l10n) {
    final res = ref.read(cartControllerProvider.notifier).addItem(item, quantity: _quantity);
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
                ref.read(cartControllerProvider.notifier).clearAndAddItem(item, quantity: _quantity);
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
