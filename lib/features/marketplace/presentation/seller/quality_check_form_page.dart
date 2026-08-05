import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/auth/auth_providers.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/data/quality_check_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';
import 'package:waanofi/features/marketplace/domain/quality_check_model.dart';

class QualityCheckFormPage extends ConsumerStatefulWidget {
  const QualityCheckFormPage({super.key, required this.batchId});
  final String batchId;

  @override
  ConsumerState<QualityCheckFormPage> createState() => _QualityCheckFormPageState();
}

class _QualityCheckFormPageState extends ConsumerState<QualityCheckFormPage> {
  final _notesController = TextEditingController();
  bool _passedSmellCleanliness = true;
  bool _passedTempStorage = true;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _processDecision(bool isApproved, InventoryBatchModel batch) async {
    final user = ref.read(currentUserProvider);
    if (user == null || user.id == null) return;

    final check = QualityCheckModel(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      batchId: widget.batchId,
      checkType: batch.sourceType == 'milk_production' ? 'Milk Refrigeration & Smell Check' : 'Table Egg Cleanliness & Grading',
      result: isApproved ? 'pass' : 'fail',
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      checkedBy: user.id,
      checkedAt: DateTime.now(),
      measurements: {
        'smell_or_cleanliness_passed': _passedSmellCleanliness,
        'temperature_or_storage_passed': _passedTempStorage,
      },
    );

    await ref.read(qualityCheckRepositoryProvider).recordCheck(check);

    if (isApproved) {
      await ref.read(inventoryBatchRepositoryProvider).approveBatch(widget.batchId, user.id!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Batch inspected & APPROVED! Ready to supply active listings.'), backgroundColor: WaanofiColors.primary),
        );
      }
    } else {
      await ref.read(inventoryBatchRepositoryProvider).rejectBatch(widget.batchId, _notesController.text.trim());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Batch REJECTED. Removed from marketplace available inventory.'), backgroundColor: Colors.red),
        );
      }
    }

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final batchesStream = ref.watch(inventoryBatchRepositoryProvider).watchBatches();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.qualityCheck, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder<List<InventoryBatchModel>>(
        stream: batchesStream,
        builder: (context, snapshot) {
          final batches = snapshot.data ?? [];
          final batch = batches.where((b) => b.id == widget.batchId).firstOrNull;

          if (batch == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final isMilk = batch.sourceType == 'milk_production';

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(batch.batchCode, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                            Chip(
                              label: Text(batch.qualityStatus.name.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                              backgroundColor: batch.qualityStatus == InventoryQualityStatus.approved ? WaanofiColors.primary.withValues(alpha: 0.15) : Colors.amber.withValues(alpha: 0.2),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          batch.baseUnit == 'eggs' ? batch.formattedEggInventory : '${batch.producedQuantity.toStringAsFixed(1)} ${batch.baseUnit}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                        ),
                        if (batch.expiresAt != null)
                          Text('Expiration Guidance: ${batch.expiresAt!.toLocal().toString().split('.').first}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Mandatory Inspection Checkpoints', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          title: Text(isMilk ? 'Sensory & Smell Check' : 'Shell Cleanliness & Intact Check', style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(isMilk ? 'Milk smells clean, fresh, and free from sour/off odors' : 'All egg shells are clean, dry, and cracked items removed'),
                          value: _passedSmellCleanliness,
                          activeColor: WaanofiColors.primary,
                          onChanged: (val) => setState(() => _passedSmellCleanliness = val ?? false),
                        ),
                        const Divider(height: 1),
                        CheckboxListTile(
                          title: Text(isMilk ? 'Chilled Temperature Validation (< 4°C)' : 'Cool Dry Storage Verification', style: const TextStyle(fontWeight: FontWeight.w600)),
                          subtitle: Text(isMilk ? 'Confirmed stored in sanitized refrigeration tanks or cans' : 'Trays arranged away from direct heat or moisture'),
                          value: _passedTempStorage,
                          activeColor: WaanofiColors.primary,
                          onChanged: (val) => setState(() => _passedTempStorage = val ?? false),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Inspection Notes or Rejection Reason',
                      hintText: 'Add remarks regarding quality tests, acidity, or grading...',
                    ),
                  ),
                  const SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.thumb_down_alt_outlined),
                          label: const Text('Reject Batch', style: TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: () => _processDecision(false, batch),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: WaanofiColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.verified_outlined),
                          label: const Text('Approve Batch', style: TextStyle(fontWeight: FontWeight.bold)),
                          onPressed: (_passedSmellCleanliness && _passedTempStorage) ? () => _processDecision(true, batch) : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
