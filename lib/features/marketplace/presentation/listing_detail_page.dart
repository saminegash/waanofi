import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../data/marketplace_repository.dart';
import '../domain/production_batch_model.dart';
import '../domain/marketplace_listing_model.dart';

/// Provider for a single listing detail
final listingDetailProvider = FutureProvider.autoDispose.family<MarketplaceListingModel, String>(
  (ref, listingId) async {
    final repo = ref.watch(marketplaceRepositoryProvider);
    return repo.getListingById(listingId);
  },
);

class ListingDetailPage extends ConsumerWidget {
  const ListingDetailPage({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingAsync = ref.watch(listingDetailProvider(listingId));
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.productDetails)),
      body: listingAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('${l10n.error}: $e')),
        data: (listing) {
          final isMilk = listing.category == ProductCategory.freshMilk;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero Image / Placeholder
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isMilk
                          ? [const Color(0xFFE3F2FD), const Color(0xFF90CAF9)]
                          : [const Color(0xFFFFF8E1), const Color(0xFFFFD54F)],
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        listing.title,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Farm Name
                      if (listing.farm != null)
                        Row(
                          children: [
                            const Icon(Icons.agriculture, size: 16, color: WaanofiColors.textSecondary),
                            const SizedBox(width: 4),
                            Text(
                              listing.farm!['name'] ?? '',
                              style: const TextStyle(color: WaanofiColors.textSecondary),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16),

                      // Price Card
                      Card(
                        color: WaanofiColors.primary.withValues(alpha: 0.08),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.pricePerUnit, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${listing.priceFormatted} ETB / ${listing.unit}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: WaanofiColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(l10n.available, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${listing.quantityAvailable.toStringAsFixed(0)} ${listing.unit}',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Description
                      if (listing.description != null && listing.description!.isNotEmpty) ...[
                        Text(l10n.description, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(listing.description!, style: const TextStyle(color: WaanofiColors.textSecondary)),
                        const SizedBox(height: 24),
                      ],

                      // Category Badge
                      Row(
                        children: [
                          Chip(
                            avatar: Icon(isMilk ? Icons.water_drop : Icons.egg, size: 16),
                            label: Text(isMilk ? l10n.freshMilk : l10n.eggs),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Order Button
                      if (listing.quantityAvailable > 0)
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => context.push('/marketplace/checkout', extra: listing),
                            icon: const Icon(Icons.shopping_cart),
                            label: Text(l10n.orderNow),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: WaanofiColors.primary,
                              foregroundColor: WaanofiColors.surface,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        )
                      else
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: WaanofiColors.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            l10n.outOfStock,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: WaanofiColors.error, fontWeight: FontWeight.bold),
                          ),
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
}
