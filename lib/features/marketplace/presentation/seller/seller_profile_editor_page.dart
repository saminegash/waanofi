import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/auth/auth_providers.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/seller_profile_repository.dart';
import 'package:waanofi/features/marketplace/domain/farm_market_profile_model.dart';

class SellerProfileEditorPage extends ConsumerStatefulWidget {
  const SellerProfileEditorPage({super.key});

  @override
  ConsumerState<SellerProfileEditorPage> createState() => _SellerProfileEditorPageState();
}

class _SellerProfileEditorPageState extends ConsumerState<SellerProfileEditorPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _locationController;
  late TextEditingController _descController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  bool _pickup = true;
  bool _delivery = false;
  bool _initialized = false;
  FarmMarketProfileModel? _existingProfile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _descController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _loadExisting(FarmMarketProfileModel? profile) {
    if (_initialized || profile == null) return;
    _existingProfile = profile;
    _nameController.text = profile.publicFarmName;
    _locationController.text = profile.generalLocation;
    _descController.text = profile.publicDescription ?? '';
    _phoneController.text = profile.publicPhone ?? '';
    _emailController.text = profile.publicEmail ?? '';
    _pickup = profile.pickupAvailability;
    _delivery = profile.deliveryAvailability;
    _initialized = true;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final user = ref.read(currentUserProvider);
    final farmId = user?.farmId;
    if (farmId == null) return;

    final profile = FarmMarketProfileModel(
      farmId: farmId,
      publicFarmName: _nameController.text.trim(),
      generalLocation: _locationController.text.trim(),
      publicDescription: _descController.text.trim().isEmpty ? null : _descController.text.trim(),
      publicPhone: _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
      publicEmail: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
      pickupAvailability: _pickup,
      deliveryAvailability: _delivery,
      marketplaceStatus: _existingProfile?.marketplaceStatus ?? MarketProfileStatus.draft,
      createdAt: _existingProfile?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await ref.read(sellerProfileRepositoryProvider).saveProfile(profile);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seller Profile saved successfully!'), backgroundColor: WaanofiColors.primary),
      );
      if (_existingProfile == null) {
        context.go('/seller/verification');
      } else {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final profileStream = ref.watch(sellerProfileRepositoryProvider).watchProfile();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.publicSellerProfile, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.surface,
        elevation: 0,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      body: StreamBuilder(
        stream: profileStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && !_initialized) {
            WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => _loadExisting(snapshot.data)));
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Public Branding & Details',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'This information will be displayed to buyers on your public storefront.',
                      style: TextStyle(fontSize: 13, color: WaanofiColors.textSecondary),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Public Farm Name *', hintText: 'e.g. Waanofi Green Pastures'),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Please provide a farm name' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _locationController,
                      decoration: const InputDecoration(labelText: 'General Location / City *', hintText: 'e.g. Bishoftu, Oromia'),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Please provide general location' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descController,
                      maxLines: 3,
                      decoration: const InputDecoration(labelText: 'Farm Description', hintText: 'Tell buyers about your feeding, pasture, and hygiene standards...'),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Contact & Fulfilment Options',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: 'Public Phone Number', prefixIcon: Icon(Icons.phone_outlined)),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Public Email Address', prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
                      child: Column(
                        children: [
                          SwitchListTile(
                            title: const Text('Farm Gate Pickup Available', style: TextStyle(fontWeight: FontWeight.w600)),
                            subtitle: const Text('Buyers can collect orders directly from your farm gate'),
                            value: _pickup,
                            activeColor: WaanofiColors.primary,
                            onChanged: (val) => setState(() => _pickup = val),
                          ),
                          const Divider(height: 1),
                          SwitchListTile(
                            title: const Text('Local Delivery Available', style: TextStyle(fontWeight: FontWeight.w600)),
                            subtitle: const Text('You offer delivery within designated radius zones'),
                            value: _delivery,
                            activeColor: WaanofiColors.primary,
                            onChanged: (val) => setState(() => _delivery = val),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: WaanofiColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _save,
                        child: const Text('Save Public Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
