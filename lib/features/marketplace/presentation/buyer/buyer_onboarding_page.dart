import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../data/buyer_repository.dart';
import '../../domain/buyer_account_model.dart';

class BuyerOnboardingPage extends ConsumerStatefulWidget {
  const BuyerOnboardingPage({super.key});

  @override
  ConsumerState<BuyerOnboardingPage> createState() => _BuyerOnboardingPageState();
}

class _BuyerOnboardingPageState extends ConsumerState<BuyerOnboardingPage> {
  final _formKey = GlobalKey<FormState>();
  BuyerType _selectedType = BuyerType.household;
  final _contactNameCtrl = TextEditingController();
  final _orgNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _taxCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final account = await ref.read(buyerRepositoryProvider).getCurrentBuyerAccount();
    if (account != null && mounted) {
      setState(() {
        _selectedType = account.buyerType;
        _contactNameCtrl.text = account.contactName;
        _orgNameCtrl.text = account.organizationName ?? '';
        _phoneCtrl.text = account.phone;
        _emailCtrl.text = account.email;
        _taxCtrl.text = account.taxNumber ?? '';
      });
    }
  }

  @override
  void dispose() {
    _contactNameCtrl.dispose();
    _orgNameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _taxCtrl.dispose();
    super.dispose();
  }

  String _getBuyerTypeLabel(BuyerType type, AppLocalizations l10n) {
    switch (type) {
      case BuyerType.household:
        return l10n.household;
      case BuyerType.retailShop:
        return l10n.retailShop;
      case BuyerType.cafe:
        return l10n.cafe;
      case BuyerType.restaurant:
        return l10n.restaurant;
      case BuyerType.hotel:
        return l10n.hotel;
      case BuyerType.bakery:
        return l10n.bakery;
      case BuyerType.school:
        return l10n.school;
      case BuyerType.institution:
        return l10n.institution;
      case BuyerType.otherBusiness:
        return l10n.otherBusiness;
    }
  }

  Future<void> _submit(AppLocalizations l10n) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    try {
      await ref.read(buyerRepositoryProvider).saveBuyerAccount(
        buyerType: _selectedType,
        organizationName: _orgNameCtrl.text.trim().isEmpty ? null : _orgNameCtrl.text.trim(),
        contactName: _contactNameCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        taxNumber: _taxCtrl.text.trim().isEmpty ? null : _taxCtrl.text.trim(),
      );
      if (mounted) {
        ref.invalidate(currentBuyerAccountProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Buyer account profile updated successfully!')),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isOrg = _selectedType != BuyerType.household;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.buyerAccount, style: const TextStyle(fontWeight: FontWeight.bold)),
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
              Text(
                l10n.buyerType,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.primaryDark),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<BuyerType>(
                initialValue: _selectedType,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: BuyerType.values.map((type) {
                  return DropdownMenuItem(value: type, child: Text(_getBuyerTypeLabel(type, l10n)));
                }).toList(),
                onChanged: (val) => setState(() => _selectedType = val!),
              ),
              const SizedBox(height: 20),
              if (isOrg) ...[
                CustomTextField(
                  label: l10n.organizationName,
                  controller: _orgNameCtrl,
                  validator: (val) => val == null || val.trim().isEmpty ? 'Please enter organization name' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: l10n.taxNumberOptional,
                  controller: _taxCtrl,
                ),
                const SizedBox(height: 16),
              ],
              CustomTextField(
                label: isOrg ? '${l10n.recipientName} (Contact Person)' : l10n.recipientName,
                controller: _contactNameCtrl,
                validator: (val) => val == null || val.trim().isEmpty ? 'Please enter contact name' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: l10n.phoneNumber,
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: (val) => val == null || val.trim().isEmpty ? 'Please enter phone number' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email Address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val == null || !val.contains('@') ? 'Please enter a valid email' : null,
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
                  onPressed: _isLoading ? null : () => _submit(l10n),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save Buyer Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
