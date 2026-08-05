import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/seller_listing_repository.dart';
import 'package:waanofi/features/marketplace/domain/seller_listing_model.dart';
import 'package:waanofi/shared/widgets/empty_state_widget.dart';

class SellerListingsPage extends ConsumerWidget {
  const SellerListingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final listingsStream = ref.watch(sellerListingRepositoryProvider).watchListings();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.activeListings, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder<List<SellerListingModel>>(
        stream: listingsStream,
        builder: (context, snapshot) {
          final listings = snapshot.data ?? [];

          if (listings.isEmpty) {
            return const EmptyStateWidget(icon: Icons.storefront_outlined, title: 'No Listings', description: 'No product listings published yet. Ensure your profile and production batches are approved to get started.');
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final item = listings[index];
              Color statusColor = WaanofiColors.primary;
              String statusText = item.status.name.toUpperCase();
              if (item.isPaused) {
                statusColor = Colors.orange;
                statusText = 'PAUSED';
              } else if (item.isOutOfStock) {
                statusColor = Colors.grey;
                statusText = 'OUT OF STOCK';
              } else if (item.status == SellerListingStatus.draft) {
                statusColor = Colors.blue;
                statusText = 'DRAFT';
              }

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 0,
                color: WaanofiColors.surface,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: WaanofiColors.outline)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(item.publicTitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                            child: Text(statusText, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: statusColor)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text('${item.priceFormatted} per ${item.sellingUnit}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: WaanofiColors.primary)),
                      if (item.publicDescription != null && item.publicDescription!.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(item.publicDescription!, style: const TextStyle(fontSize: 13, color: WaanofiColors.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Min Order: ${item.minimumOrderQuantity} ${item.sellingUnit}', style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
                          Text('Prep: ${item.preparationTime}', style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (item.isActive)
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.orange),
                                foregroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.pause_circle_outline, size: 18),
                              label: Text(l10n.pauseListing),
                              onPressed: () => ref.read(sellerListingRepositoryProvider).pauseListing(item.id),
                            )
                          else if (item.isPaused || item.isOutOfStock)
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: WaanofiColors.primary),
                                foregroundColor: WaanofiColors.primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              icon: const Icon(Icons.play_circle_outline, size: 18),
                              label: Text(l10n.resumeListing),
                              onPressed: () async {
                                try {
                                  await ref.read(sellerListingRepositoryProvider).resumeListing(item.id);
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()), backgroundColor: Colors.red));
                                  }
                                }
                              },
                            ),
                          const SizedBox(width: 8),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.grey),
                              foregroundColor: WaanofiColors.textPrimary,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            icon: const Icon(Icons.remove_shopping_cart_outlined, size: 18),
                            label: Text(l10n.markOutOfStock),
                            onPressed: () => ref.read(sellerListingRepositoryProvider).markOutOfStock(item.id),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: WaanofiColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_shopping_cart),
        label: Text(l10n.createListing, style: const TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () => context.push('/seller/listings/create'),
      ),
    );
  }
}
