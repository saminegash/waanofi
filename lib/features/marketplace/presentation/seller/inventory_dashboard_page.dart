import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';
import 'package:waanofi/shared/widgets/empty_state_widget.dart';

class InventoryDashboardPage extends ConsumerWidget {
  const InventoryDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final batchesStream = ref.watch(inventoryBatchRepositoryProvider).watchBatches();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.inventoryBatches, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder<List<InventoryBatchModel>>(
        stream: batchesStream,
        builder: (context, snapshot) {
          final batches = snapshot.data ?? [];

          final availableMilk = batches
              .where((b) => b.sourceType == 'milk_production' && b.canBeListed)
              .fold<double>(0.0, (sum, item) => sum + item.availableQuantity);

          final availableEggs = batches
              .where((b) => b.sourceType == 'egg_production' && b.canBeListed)
              .fold<double>(0.0, (sum, item) => sum + item.availableQuantity);
          final eggTrays = availableEggs ~/ 30;

          final nearingExpiry = batches.where((b) => b.isNearingExpiry).length;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildSummaryCard(
                          title: l10n.availableMilk,
                          value: '${availableMilk.toStringAsFixed(1)} L',
                          icon: Icons.water_drop_outlined,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildSummaryCard(
                          title: l10n.availableEggTrays,
                          value: '$eggTrays Trays',
                          icon: Icons.egg_outlined,
                          color: Colors.amber.shade800,
                        ),
                      ),
                    ],
                  ),
                  if (nearingExpiry > 0) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.red.withValues(alpha: 0.4))),
                      child: Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text('$nearingExpiry batches nearing expiration within 24 hours. Ensure timely sale or dispatch.', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 13)),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Production Batches', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                      TextButton.icon(
                        icon: const Icon(Icons.list_alt, size: 18),
                        label: const Text('View All'),
                        onPressed: () => context.push('/seller/batches/list'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (batches.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: EmptyStateWidget(icon: Icons.inbox_outlined, title: 'No Batches', description: 'No inventory batches recorded yet. Choose a production source below to get started.'),
                    )
                  else
                    ...batches.take(5).map((b) => _buildBatchTile(context, b)),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.water_drop, size: 20),
                  label: Text(l10n.createMilkBatch, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  onPressed: () => context.push('/seller/batches/create-milk'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade800,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.egg, size: 20),
                  label: Text(l10n.createEggBatch, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  onPressed: () => context.push('/seller/batches/create-egg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard({required String title, required String value, required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildBatchTile(BuildContext context, InventoryBatchModel b) {
    Color badgeColor = Colors.grey;
    String badgeText = b.qualityStatus.name.toUpperCase();
    if (b.qualityStatus == InventoryQualityStatus.approved) {
      badgeColor = WaanofiColors.primary;
    } else if (b.qualityStatus == InventoryQualityStatus.rejected || b.isExpired) {
      badgeColor = Colors.red;
      if (b.isExpired) badgeText = 'EXPIRED';
    } else if (b.qualityStatus == InventoryQualityStatus.pendingInspection) {
      badgeColor = Colors.amber.shade800;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: WaanofiColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: WaanofiColors.outline)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: b.sourceType == 'milk_production' ? Colors.blue.withValues(alpha: 0.1) : Colors.amber.withValues(alpha: 0.1),
          child: Icon(b.sourceType == 'milk_production' ? Icons.water_drop : Icons.egg, color: b.sourceType == 'milk_production' ? Colors.blue.shade700 : Colors.amber.shade800),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(b.batchCode, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(6)),
              child: Text(badgeText, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: badgeColor)),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              b.baseUnit == 'eggs' ? b.formattedEggInventory : '${b.availableQuantity.toStringAsFixed(1)} ${b.baseUnit} Available',
              style: const TextStyle(fontWeight: FontWeight.w600, color: WaanofiColors.textSecondary),
            ),
            if (b.expiresAt != null)
              Text('Expires: ${b.expiresAt!.toLocal().toString().split('.').first}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
        onTap: () => context.push('/seller/batches/check/${b.id}'),
      ),
    );
  }
}
