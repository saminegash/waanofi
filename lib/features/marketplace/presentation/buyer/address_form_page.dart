import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../data/address_repository.dart';

class AddressFormPage extends ConsumerStatefulWidget {
  const AddressFormPage({super.key});

  @override
  ConsumerState<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends ConsumerState<AddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _labelCtrl = TextEditingController(text: 'Home');
  final _recipientCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _regionCtrl = TextEditingController(text: 'Addis Ababa');
  final _cityCtrl = TextEditingController(text: 'Addis Ababa');
  final _subCityCtrl = TextEditingController();
  final _neighborhoodCtrl = TextEditingController();
  final _landmarkCtrl = TextEditingController();
  final _instructionsCtrl = TextEditingController();
  bool _isDefault = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _labelCtrl.dispose();
    _recipientCtrl.dispose();
    _phoneCtrl.dispose();
    _regionCtrl.dispose();
    _cityCtrl.dispose();
    _subCityCtrl.dispose();
    _neighborhoodCtrl.dispose();
    _landmarkCtrl.dispose();
    _instructionsCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(addressRepositoryProvider).saveAddress(
        label: _labelCtrl.text.trim(),
        recipientName: _recipientCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        region: _regionCtrl.text.trim(),
        city: _cityCtrl.text.trim(),
        subCity: _subCityCtrl.text.trim(),
        neighborhood: _neighborhoodCtrl.text.trim(),
        landmark: _landmarkCtrl.text.trim(),
        deliveryInstructions: _instructionsCtrl.text.trim().isEmpty ? null : _instructionsCtrl.text.trim(),
        isDefault: _isDefault,
      );
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Delivery address saved!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving address: $e'), backgroundColor: Colors.red));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addAddress, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                label: l10n.addressLabel,
                controller: _labelCtrl,
                validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: l10n.recipientName,
                controller: _recipientCtrl,
                validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: l10n.phoneNumber,
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              const Text('Location Details (Ethiopian Hierarchy)', style: TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: l10n.region,
                      controller: _regionCtrl,
                      validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      label: l10n.city,
                      controller: _cityCtrl,
                      validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: l10n.subCity,
                      controller: _subCityCtrl,
                      validator: (val) => val == null || val.trim().isEmpty ? 'Required (e.g. Bole, Kirkos)' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(
                      label: l10n.neighborhood,
                      controller: _neighborhoodCtrl,
                      validator: (val) => val == null || val.trim().isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: l10n.landmark,
                controller: _landmarkCtrl,
                validator: (val) => val == null || val.trim().isEmpty ? 'Required (e.g. Near Friendship Hotel)' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: l10n.deliveryNotesOptional,
                controller: _instructionsCtrl,
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: Text(l10n.setDefaultAddress, style: const TextStyle(fontWeight: FontWeight.w600)),
                value: _isDefault,
                activeColor: WaanofiColors.primary,
                onChanged: (val) => setState(() => _isDefault = val),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WaanofiColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isLoading ? null : _save,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(l10n.addAddress, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
