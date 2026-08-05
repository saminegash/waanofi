import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:waanofi/l10n/app_localizations.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../data/admin_repository.dart';

class FarmSettingsPage extends ConsumerStatefulWidget {
  const FarmSettingsPage({super.key});

  @override
  ConsumerState<FarmSettingsPage> createState() => _FarmSettingsPageState();
}

class _FarmSettingsPageState extends ConsumerState<FarmSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _priceController = TextEditingController();
  String _farmType = 'dairy';
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadMilkPrice();
  }

  Future<void> _loadMilkPrice() async {
    try {
      final repo = ref.read(adminRepositoryProvider);
      final price = await repo.getMilkPrice();
      final type = await repo.getFarmType();
      if (mounted) {
        setState(() {
          _priceController.text = price.toString();
          _farmType = type;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load farm settings: $e')),
        );
      }
    }
  }

  Future<void> _saveMilkPrice() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final repo = ref.read(adminRepositoryProvider);
      await repo.updateMilkPrice(double.parse(_priceController.text));
      await repo.updateFarmType(_farmType);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.farmSettings),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _farmType,
                      decoration: InputDecoration(
                        labelText: l10n.farmType,
                        prefixIcon: const Icon(Icons.category),
                        border: const OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(value: 'dairy', child: Text(l10n.dairyFarm)),
                        DropdownMenuItem(value: 'poultry', child: Text(l10n.poultryFarm)),
                        DropdownMenuItem(value: 'mixed', child: Text(l10n.mixedFarm)),
                      ],
                      onChanged: (val) => setState(() => _farmType = val ?? 'dairy'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: l10n.milkPricePerLitre,
                        prefixIcon: const Icon(Icons.attach_money),
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n.required;
                        }
                        if (double.tryParse(value) == null) {
                          return l10n.mustBeNumber;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _isSaving ? null : _saveMilkPrice,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: WaanofiColors.primary,
                      ),
                      child: _isSaving
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(l10n.save, style: const TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

