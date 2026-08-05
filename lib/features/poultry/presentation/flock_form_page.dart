import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/auth_providers.dart';
import '../data/flock_repository.dart';
import '../domain/flock_model.dart';

class FlockFormPage extends ConsumerStatefulWidget {
  const FlockFormPage({super.key, this.flock});
  final FlockModel? flock;

  @override
  ConsumerState<FlockFormPage> createState() => _FlockFormPageState();
}

class _FlockFormPageState extends ConsumerState<FlockFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _codeController;
  late TextEditingController _breedController;
  late TextEditingController _birdsController;
  late TextEditingController _hensController;
  late TextEditingController _notesController;
  FlockPurpose _purpose = FlockPurpose.layers;
  DateTime _arrivalDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final f = widget.flock;
    _nameController = TextEditingController(text: f?.name ?? '');
    _codeController = TextEditingController(text: f?.flockCode ?? '');
    _breedController = TextEditingController(text: f?.breed ?? '');
    _birdsController = TextEditingController(text: '${f?.numberOfBirds ?? 0}');
    _hensController = TextEditingController(text: '${f?.numberOfLayingHens ?? 0}');
    _notesController = TextEditingController(text: f?.notes ?? '');
    if (f != null) {
      _purpose = f.purpose;
      _arrivalDate = f.arrivalDate;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _breedController.dispose();
    _birdsController.dispose();
    _hensController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _save(AppLocalizations l10n) async {
    if (!_formKey.currentState!.validate()) return;
    final birds = int.tryParse(_birdsController.text) ?? 0;
    final hens = int.tryParse(_hensController.text) ?? 0;
    if (hens > birds) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.hensCannotExceedBirds)));
      return;
    }

    setState(() => _isLoading = true);
    try {
      final user = ref.read(currentUserProvider);
      final model = FlockModel(
        id: widget.flock?.id ?? const Uuid().v4(),
        farmId: user?.farmId ?? '',
        flockCode: _codeController.text.trim(),
        name: _nameController.text.trim(),
        breed: _breedController.text.trim(),
        purpose: _purpose,
        numberOfBirds: birds,
        numberOfLayingHens: hens,
        arrivalDate: _arrivalDate,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        createdBy: user?.id,
        createdAt: widget.flock?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await ref.read(flockRepositoryProvider).saveFlock(model);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.flockSaved)));
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
        title: Text(widget.flock == null ? l10n.addFlock : l10n.editFlock),
        backgroundColor: WaanofiColors.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: l10n.flockName, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                validator: (v) => (v == null || v.isEmpty) ? l10n.fieldRequired : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: l10n.flockCode, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                validator: (v) => (v == null || v.isEmpty) ? l10n.fieldRequired : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(labelText: l10n.breed, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                validator: (v) => (v == null || v.isEmpty) ? l10n.fieldRequired : null,
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<FlockPurpose>(
                value: _purpose,
                decoration: InputDecoration(labelText: l10n.flockPurpose, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                items: FlockPurpose.values.map((p) => DropdownMenuItem(value: p, child: Text(p.name.toUpperCase()))).toList(),
                onChanged: (val) => setState(() => _purpose = val ?? _purpose),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _birdsController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: l10n.totalBirds, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                      validator: (v) => (int.tryParse(v ?? '') ?? -1) < 0 ? 'Invalid' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _hensController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: l10n.layingHens, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                      validator: (v) => (int.tryParse(v ?? '') ?? -1) < 0 ? 'Invalid' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(labelText: l10n.notesOptional, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), filled: true, fillColor: WaanofiColors.surface),
                maxLines: 2,
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
