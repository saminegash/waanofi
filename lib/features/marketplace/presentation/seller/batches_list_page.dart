import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';
import 'package:waanofi/shared/widgets/empty_state_widget.dart';

class BatchesListPage extends ConsumerStatefulWidget {
  const BatchesListPage({super.key});

  @override
  ConsumerState<BatchesListPage> createState() => _BatchesListPageState();
}

class _BatchesListPageState extends ConsumerState<BatchesListPage> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
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
          final allBatches = snapshot.data ?? [];
          final filtered = allBatches.where((b) {
            if (_selectedFilter == 'Approved') return b.qualityStatus == InventoryQualityStatus.approved && !b.isExpired;
            if (_selectedFilter == 'Pending') return b.qualityStatus == InventoryQualityStatus.pendingInspection;
            if (_selectedFilter == 'Rejected / Expired') return b.qualityStatus == InventoryQualityStatus.rejected || b.isExpired;
            return true;
          }).toList();

          return Column(
            children: [
              Container(
                color: WaanofiColors.surface,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['All', 'Approved', 'Pending', 'Rejected / Expired'].map((tab) {
                      final isSelected = _selectedFilter == tab;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(tab, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.w500, color: isSelected ? Colors.white : WaanofiColors.textPrimary)),
                          selected: isSelected,
                          selectedColor: WaanofiColors.primary,
                          backgroundColor: WaanofiColors.background,
                          onSelected: (selected) => setState(() => _selectedFilter = tab),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: filtered.isEmpty
                    ? const EmptyStateWidget(icon: Icons.inventory_2_outlined, title: 'No Batches', description: 'No production batches match the selected category.')
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final b = filtered[index];
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
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: WaanofiColors.outline)),
                            elevation: 0,
                            color: WaanofiColors.surface,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(b.sourceType == 'milk_production' ? Icons.water_drop : Icons.egg, color: b.sourceType == 'milk_production' ? Colors.blue : Colors.amber),
                                          const SizedBox(width: 8),
                                          Text(b.batchCode, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(color: badgeColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                                        child: Text(badgeText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: badgeColor)),
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Initial Quantity', style: TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
                                          Text('${b.producedQuantity.toStringAsFixed(1)} ${b.baseUnit}', style: const TextStyle(fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text('Currently Available', style: TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
                                          Text(
                                            b.baseUnit == 'eggs' ? b.formattedEggInventory : '${b.availableQuantity.toStringAsFixed(1)} ${b.baseUnit}',
                                            style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton.icon(
                                        icon: const Icon(Icons.assignment_turned_in_outlined, size: 18),
                                        label: Text(b.qualityStatus == InventoryQualityStatus.pendingInspection ? 'Inspect & Approve' : 'Inspection Details'),
                                        onPressed: () => context.push('/seller/batches/check/${b.id}'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
