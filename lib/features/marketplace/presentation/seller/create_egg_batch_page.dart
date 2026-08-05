import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/auth/auth_providers.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';

class CreateEggBatchPage extends ConsumerStatefulWidget {
  const CreateEggBatchPage({super.key});

  @override
  ConsumerState<CreateEggBatchPage> createState() => _CreateEggBatchPageState();
}

class _CreateEggBatchPageState extends ConsumerState<CreateEggBatchPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _batchCodeController;
  late TextEditingController _goodEggsController;
  late TextEditingController _crackedController;
  String _grade = 'Large Grade A';
  int _calculatedTrays = 0;
  int _looseEggs = 0;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _batchCodeController = TextEditingController(text: 'EGG-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.hour}${now.minute}');
    _goodEggsController = TextEditingController();
    _crackedController = TextEditingController(text: '0');

    _goodEggsController.addListener(_updateTrayCalc);
  }

  void _updateTrayCalc() {
    final good = int.tryParse(_goodEggsController.text.trim()) ?? 0;
    setState(() {
      _calculatedTrays = good ~/ 30;
      _looseEggs = good % 30;
    });
  }

  @override
  void dispose() {
    _batchCodeController.dispose();
    _goodEggsController.dispose();
    _crackedController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final good = int.tryParse(_goodEggsController.text.trim()) ?? 0;
    final cracked = int.tryParse(_crackedController.text.trim()) ?? 0;
    if (good <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter at least 1 good table egg.')));
      return;
    }

    final user = ref.read(currentUserProvider);
    final farmId = user?.farmId;
    if (farmId == null) return;

    final now = DateTime.now();
    final batch = InventoryBatchModel(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      farmId: farmId,
      batchCode: _batchCodeController.text.trim(),
      sourceType: 'egg_production',
      producedQuantity: good.toDouble(),
      approvedQuantity: 0.0,
      availableQuantity: 0.0,
      rejectedQuantity: cracked.toDouble(),
      baseUnit: 'eggs',
      producedAt: now,
      packedAt: now,
      expiresAt: now.add(const Duration(days: 30)),
      qualityStatus: InventoryQualityStatus.pendingInspection,
      qualityMetadata: {
        'grade': _grade,
        'cracked_excluded': cracked,
        'trays_count': _calculatedTrays,
        'storage_guidance': '30 days stored dry in cool room',
      },
      createdBy: user?.id,
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(inventoryBatchRepositoryProvider).saveBatch(batch);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Egg batch logged! Sent for quality inspection.'), backgroundColor: WaanofiColors.primary),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.createEggBatch, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.amber.shade700.withValues(alpha: 0.4))),
                  child: Row(
                    children: [
                      Icon(Icons.egg_alt, color: Colors.amber.shade800, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Table eggs are stored with exact integer count (never decimals!). Automatically organized into 30-egg Trays with a 30-day shelf life.', style: TextStyle(color: Colors.amber.shade900, fontWeight: FontWeight.w600, fontSize: 13, height: 1.3)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _batchCodeController,
                  decoration: const InputDecoration(labelText: 'Batch Identifier / Code *', prefixIcon: Icon(Icons.qr_code)),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required field' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _goodEggsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Good Table Eggs (Count) *', prefixIcon: Icon(Icons.egg_outlined), hintText: 'e.g. 150'),
                  validator: (v) => v == null || int.tryParse(v) == null ? 'Enter integer egg count' : null,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Automated Tray Conversion:', style: TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary)),
                      Text('$_calculatedTrays Trays + $_looseEggs Loose', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.primary)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _crackedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cracked or Rejected Eggs (Excluded)', prefixIcon: Icon(Icons.block_outlined)),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _grade,
                  decoration: const InputDecoration(labelText: 'Egg Grade / Size', prefixIcon: Icon(Icons.grade_outlined)),
                  items: ['Large Grade A', 'Medium Grade A', 'Mixed Pasture Grade'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                  onChanged: (val) => setState(() => _grade = val!),
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade800,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _submit,
                    child: const Text('Log Egg Batch & Send to Inspection', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
