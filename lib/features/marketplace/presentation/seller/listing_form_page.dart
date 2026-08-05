import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import 'package:waanofi/core/auth/auth_providers.dart';
import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:waanofi/features/marketplace/data/catalog_repository.dart';
import 'package:waanofi/features/marketplace/data/seller_listing_repository.dart';
import 'package:waanofi/features/marketplace/domain/seller_listing_model.dart';

class ListingFormPage extends ConsumerStatefulWidget {
  const ListingFormPage({super.key});

  @override
  ConsumerState<ListingFormPage> createState() => _ListingFormPageState();
}

class _ListingFormPageState extends ConsumerState<ListingFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late TextEditingController _priceEtbController;
  late TextEditingController _minQtyController;
  late TextEditingController _prepTimeController;
  String _sellingUnit = 'litres';
  String? _selectedProductId;
  bool _publishImmediately = true;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _priceEtbController = TextEditingController();
    _minQtyController = TextEditingController(text: '1');
    _prepTimeController = TextEditingController(text: '2 hours');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _priceEtbController.dispose();
    _minQtyController.dispose();
    _prepTimeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final etbVal = double.tryParse(_priceEtbController.text.trim()) ?? 0;
    if (etbVal <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter valid positive ETB pricing.')));
      return;
    }
    // Exact minor unit calculation in santim (1/100 ETB)
    final priceMinorUnits = (etbVal * 100).round();

    final minQty = int.tryParse(_minQtyController.text.trim()) ?? 1;
    final user = ref.read(currentUserProvider);
    final farmId = user?.farmId;
    if (farmId == null) return;

    final now = DateTime.now();
    final listing = SellerListingModel(
      id: '${DateTime.now().millisecondsSinceEpoch}',
      farmId: farmId,
      productId: _selectedProductId,
      publicTitle: _titleController.text.trim(),
      publicDescription: _descController.text.trim().isEmpty ? null : _descController.text.trim(),
      sellingUnit: _sellingUnit,
      unitConversion: _sellingUnit == 'tray_30' ? 30 : 1,
      priceInMinorUnits: priceMinorUnits,
      currency: 'ETB',
      minimumOrderQuantity: minQty,
      preparationTime: _prepTimeController.text.trim().isEmpty ? '2 hours' : _prepTimeController.text.trim(),
      status: _publishImmediately ? SellerListingStatus.active : SellerListingStatus.draft,
      publishedAt: _publishImmediately ? now : null,
      createdBy: user?.id,
      createdAt: now,
      updatedAt: now,
    );

    try {
      await ref.read(sellerListingRepositoryProvider).saveListing(listing);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_publishImmediately ? 'Listing published active to marketplace!' : 'Draft listing saved successfully.'), backgroundColor: WaanofiColors.primary),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cannot publish: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final catalogStream = ref.watch(catalogRepositoryProvider).watchProducts();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.createListing, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                const Text('Select Catalog Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                const SizedBox(height: 12),
                StreamBuilder(
                  stream: catalogStream,
                  builder: (context, snapshot) {
                    final products = snapshot.data ?? [];
                    if (products.isEmpty) {
                      return const Text('Loading platform catalog...', style: TextStyle(color: WaanofiColors.textSecondary));
                    }
                    return DropdownButtonFormField<String>(
                      value: _selectedProductId,
                      decoration: const InputDecoration(labelText: 'Product Catalog Type *', prefixIcon: Icon(Icons.category_outlined)),
                      items: products.map((p) => DropdownMenuItem(value: p.id, child: Text(p.nameEn))).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedProductId = val;
                          final match = products.where((x) => x.id == val).firstOrNull;
                          if (match != null) {
                            _titleController.text = match.nameEn;
                            _sellingUnit = match.baseInventoryUnit == 'eggs' ? 'tray_30' : 'litres';
                          }
                        });
                      },
                      validator: (v) => v == null ? 'Select catalog product type' : null,
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Public Listing Title *', hintText: 'e.g. Chilled Fresh Cow Milk'),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Enter public listing title' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Public Description', hintText: 'Explain quality features, feed purity, or freshness...'),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _priceEtbController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(labelText: 'Price per Unit (ETB) *', prefixIcon: Icon(Icons.payments_outlined), hintText: 'e.g. 85.00'),
                        validator: (v) => v == null || double.tryParse(v) == null ? 'Enter valid price' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        value: _sellingUnit,
                        decoration: const InputDecoration(labelText: 'Unit'),
                        items: ['litres', 'tray_30', 'jerrican_5l', 'can_20l', 'piece'].map((u) => DropdownMenuItem(value: u, child: Text(u))).toList(),
                        onChanged: (val) => setState(() => _sellingUnit = val!),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _minQtyController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Min Order Qty *'),
                        validator: (v) => v == null || int.tryParse(v) == null ? 'Invalid integer' : null,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _prepTimeController,
                        decoration: const InputDecoration(labelText: 'Preparation Time', hintText: 'e.g. 2 hours'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
                  child: SwitchListTile(
                    title: const Text('Publish Immediately', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: const Text('Requires approved profile and verified inventory batches'),
                    value: _publishImmediately,
                    activeColor: WaanofiColors.primary,
                    onChanged: (val) => setState(() => _publishImmediately = val),
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
                    onPressed: _submit,
                    child: Text(_publishImmediately ? 'Publish Active Listing' : 'Save as Draft Listing', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
