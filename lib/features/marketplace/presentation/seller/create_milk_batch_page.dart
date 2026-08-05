import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/auth/auth_providers.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/inventory_batch_repository.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';

class CreateMilkBatchPage extends ConsumerStatefulWidget {
  const CreateMilkBatchPage({super.key});

  @override
  ConsumerState<CreateMilkBatchPage> createState() => _CreateMilkBatchPageState();
}

class _CreateMilkBatchPageState extends ConsumerState<CreateMilkBatchPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _batchCodeController;
  late TextEditingController _quantityController;
  late TextEditingController _tempController;
  String _session = 'Morning';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _batchCodeController = TextEditingController(text: 'MILK-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.hour}${now.minute}');
    _quantityController = TextEditingController();
    _tempController = TextEditingController(text: '3.8'); // Optimal chilled temperature
  }

  @override
  void dispose() {
    _batchCodeController.dispose();
    _quantityController.dispose();
    _tempController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final qty = double.tryParse(_quantityController.text.trim()) ?? 0;
    if (qty <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid positive quantity in litres.')));
      return;
    }

    final temp = double.tryParse(_tempController.text.trim()) ?? 0;
    final user = ref.read(currentUserProvider);
    final farmId = user?.farmId;
    if (farmId == null) return;

    final now = DateTime.now();
    final batch = InventoryBatchModel(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      farmId: farmId,
      batchCode: _batchCodeController.text.trim(),
      sourceType: 'milk_production',
      producedQuantity: qty,
      approvedQuantity: 0.0,
      availableQuantity: 0.0,
      baseUnit: 'litres',
      producedAt: now,
      packedAt: now,
      expiresAt: now.add(const Duration(hours: 48)),
      qualityStatus: InventoryQualityStatus.pendingInspection,
      qualityMetadata: {
        'session': _session,
        'temperature_celsius': temp,
        'storage_guidance': '48 hours chilled (< 4°C)',
      },
      createdBy: user?.id,
      createdAt: now,
      updatedAt: now,
    );

    await ref.read(inventoryBatchRepositoryProvider).saveBatch(batch);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Milk batch logged successfully! Pending quality inspection.'), backgroundColor: WaanofiColors.primary),
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
        title: Text(l10n.createMilkBatch, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                  decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.blue.withValues(alpha: 0.3))),
                  child: const Row(
                    children: [
                      Icon(Icons.ac_unit_rounded, color: Colors.blue, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Fresh dairy milk requires chilled storage (< 4°C) with an automated shelf-life expiration set to 48 hours.', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 13, height: 1.3)),
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
                  controller: _quantityController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Volume Produced (Litres) *', prefixIcon: Icon(Icons.water_drop_outlined), hintText: 'e.g. 45.5'),
                  validator: (v) => v == null || double.tryParse(v) == null ? 'Enter valid decimal volume' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _session,
                  decoration: const InputDecoration(labelText: 'Milking Session', prefixIcon: Icon(Icons.wb_sunny_outlined)),
                  items: ['Morning', 'Evening'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                  onChanged: (val) => setState(() => _session = val!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _tempController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Refrigerated Temperature (°C) *', prefixIcon: Icon(Icons.thermostat_outlined)),
                  validator: (v) => v == null || double.tryParse(v) == null ? 'Enter valid numeric temperature' : null,
                ),
                const SizedBox(height: 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: _submit,
                    child: const Text('Log Milk Batch & Send to Inspection', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
