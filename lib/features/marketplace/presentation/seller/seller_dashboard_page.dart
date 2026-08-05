import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/data/seller_listing_repository.dart';
import 'package:waanofi/features/marketplace/data/seller_profile_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';
import 'package:waanofi/features/marketplace/domain/seller_listing_model.dart';
import 'package:waanofi/features/marketplace/domain/farm_market_profile_model.dart';

class SellerDashboardPage extends ConsumerWidget {
  const SellerDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final batchesStream = ref.watch(inventoryBatchRepositoryProvider).watchBatches();
    final listingsStream = ref.watch(sellerListingRepositoryProvider).watchListings();
    final profileStream = ref.watch(sellerProfileRepositoryProvider).watchProfile();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.sellerHub, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.badge_outlined),
            tooltip: l10n.publicSellerProfile,
            onPressed: () => context.push('/seller/profile/edit'),
          ),
          IconButton(
            icon: const Icon(Icons.verified_user_outlined),
            tooltip: l10n.verificationSubmission,
            onPressed: () => context.push('/seller/verification'),
          ),
        ],
      ),
      body: StreamBuilder<List<InventoryBatchModel>>(
        stream: batchesStream,
        builder: (context, batchSnap) {
          final batches = batchSnap.data ?? [];
          return StreamBuilder<List<SellerListingModel>>(
            stream: listingsStream,
            builder: (context, listSnap) {
              final listings = listSnap.data ?? [];

              // KPI Calculations
              final activeListings = listings.where((l) => l.isActive).length;
              final pendingListings = listings.where((l) => l.status == SellerListingStatus.pendingApproval || l.approvalStatus == 'pending').length;
              final availableMilk = batches.where((b) => b.sourceType == 'milk_production' && b.canBeListed).fold<double>(0.0, (s, b) => s + b.availableQuantity);
              final availableEggs = batches.where((b) => b.sourceType == 'egg_production' && b.canBeListed).fold<double>(0.0, (s, b) => s + b.availableQuantity);
              final eggTrays = availableEggs ~/ 30;
              final nearingExpiry = batches.where((b) => b.isNearingExpiry).length;
              final rejectedBatches = batches.where((b) => b.qualityStatus == InventoryQualityStatus.rejected).length;

              return SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StreamBuilder<FarmMarketProfileModel?>(
                        stream: profileStream,
                        builder: (context, profSnap) {
                          final profile = profSnap.data;
                          if (profile == null || !profile.isEligibleToPublish) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.amber.shade700.withValues(alpha: 0.4))),
                              child: Row(
                                children: [
                                  Icon(Icons.warning_amber_rounded, color: Colors.amber.shade800, size: 32),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Profile Verification Required', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade900, fontSize: 15)),
                                        const SizedBox(height: 4),
                                        Text('Complete your profile and gain verified status before publishing public product listings.', style: TextStyle(color: Colors.amber.shade900, fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => context.push('/seller/verification'),
                                    child: const Text('Review', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      const Text('Seller Performance KPIs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                      const SizedBox(height: 14),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.35,
                        children: [
                          _buildKpiCard(title: l10n.activeListings, value: '$activeListings', icon: Icons.campaign, color: WaanofiColors.primary),
                          _buildKpiCard(title: l10n.availableMilk, value: '${availableMilk.toStringAsFixed(1)} L', icon: Icons.water_drop, color: Colors.blue.shade700),
                          _buildKpiCard(title: l10n.availableEggTrays, value: '$eggTrays Trays', icon: Icons.egg, color: Colors.amber.shade800),
                          _buildKpiCard(title: l10n.pendingApprovals, value: '$pendingListings', icon: Icons.pending_actions, color: Colors.purple.shade700),
                          _buildKpiCard(title: l10n.batchesNearingExpiry, value: '$nearingExpiry', icon: Icons.timer_outlined, color: nearingExpiry > 0 ? Colors.red : Colors.grey),
                          _buildKpiCard(title: l10n.rejectedBatches, value: '$rejectedBatches', icon: Icons.block_outlined, color: rejectedBatches > 0 ? Colors.red.shade800 : Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 28),
                      const Text('Marketplace Operations', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                      const SizedBox(height: 14),
                      _buildMenuCard(
                        title: 'Product Catalog & Listings',
                        subtitle: 'Create, pause, or update pricing for fresh milk and eggs',
                        icon: Icons.storefront_rounded,
                        color: WaanofiColors.primary,
                        onTap: () => context.push('/seller/listings'),
                      ),
                      const SizedBox(height: 12),
                      _buildMenuCard(
                        title: 'Quality-Controlled Inventory',
                        subtitle: 'Log production output, inspect quality batches, monitor shelf life',
                        icon: Icons.inventory_2_outlined,
                        color: Colors.teal.shade700,
                        onTap: () => context.push('/seller/inventory'),
                      ),
                      const SizedBox(height: 12),
                      _buildMenuCard(
                        title: 'Seller Profile & Verification',
                        subtitle: 'Update public branding, pickup rules, and compliance status',
                        icon: Icons.badge_outlined,
                        color: Colors.blue.shade700,
                        onTap: () => context.push('/seller/profile/edit'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildKpiCard({required String title, required String value, required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: WaanofiColors.textSecondary), maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildMenuCard({required String title, required String subtitle, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: WaanofiColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: WaanofiColors.outline)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(radius: 26, backgroundColor: color.withValues(alpha: 0.1), child: Icon(icon, color: color, size: 28)),
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
        subtitle: Padding(padding: const EdgeInsets.only(top: 4.0), child: Text(subtitle, style: const TextStyle(fontSize: 13, color: WaanofiColors.textSecondary))),
        trailing: const Icon(Icons.chevron_right, color: WaanofiColors.textSecondary),
        onTap: onTap,
      ),
    );
  }
}
