import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/auth_providers.dart';
import '../data/flock_repository.dart';
import '../data/flock_adjustment_repository.dart';
import '../domain/flock_model.dart';
import '../domain/flock_adjustment_model.dart';

class FlockAdjustmentFormPage extends ConsumerStatefulWidget {
  const FlockAdjustmentFormPage({super.key, required this.flockId, this.flock});
  final String flockId;
  final FlockModel? flock;

  @override
  ConsumerState<FlockAdjustmentFormPage> createState() => _FlockAdjustmentFormPageState();
}

class _FlockAdjustmentFormPageState extends ConsumerState<FlockAdjustmentFormPage> {
  final _formKey = GlobalKey<FormState>();
  FlockAdjustmentType _type = FlockAdjustmentType.mortality;
  int _count = 1;
  int _hensCount = 0;
  String _reason = '';
  bool _isLoading = false;

  void _save(AppLocalizations l10n) async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final isReduction = _type == FlockAdjustmentType.mortality || _type == FlockAdjustmentType.sale || _type == FlockAdjustmentType.transfer;
    final birdsChanged = isReduction ? -_count : _count;
    final hensChanged = isReduction ? -_hensCount : _hensCount;

    if (widget.flock != null) {
      if (widget.flock!.numberOfBirds + birdsChanged < 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.adjustmentExceedsCurrentBirds)));
        return;
      }
    }

    setState(() => _isLoading = true);
    try {
      final user = ref.read(currentUserProvider);
      final model = FlockAdjustmentModel(
        id: const Uuid().v4(),
        farmId: user?.farmId ?? '',
        flockId: widget.flockId,
        adjustmentType: _type,
        birdsChanged: birdsChanged,
        hensChanged: hensChanged,
        reason: _reason.isEmpty ? null : _reason,
        recordedAt: DateTime.now(),
        recordedBy: user?.id,
        createdAt: DateTime.now(),
      );

      await ref.read(flockAdjustmentRepositoryProvider).recordAdjustment(model);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.adjustmentRecorded)));
        context.pop();
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.recordAdjustment),
        backgroundColor: WaanofiColors.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<FlockAdjustmentType>(
                value: _type,
                decoration: InputDecoration(labelText: l10n.adjustmentType, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                items: FlockAdjustmentType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name.toUpperCase()))).toList(),
                onChanged: (val) => setState(() => _type = val ?? _type),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: l10n.birdQuantity, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                      validator: (v) => ((int.tryParse(v ?? '') ?? -1) <= 0) ? 'Must be > 0' : null,
                      onSaved: (v) => _count = int.tryParse(v ?? '') ?? 0,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      initialValue: '0',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: l10n.layingHensInvolved, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                      onSaved: (v) => _hensCount = int.tryParse(v ?? '') ?? 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: l10n.reasonOptional, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                onSaved: (v) => _reason = v ?? '',
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : () => _save(l10n),
                  style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  child: _isLoading ? const CircularProgressIndicator(color: WaanofiColors.surface) : Text(l10n.save, style: const TextStyle(color: WaanofiColors.surface, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
