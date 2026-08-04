import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/auth/auth_providers.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../domain/marketplace_listing_model.dart';
import '../domain/order_model.dart';
import 'controllers/order_controller.dart';

class CheckoutPage extends ConsumerStatefulWidget {
  const CheckoutPage({super.key, required this.listing});

  final MarketplaceListingModel listing;

  @override
  ConsumerState<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends ConsumerState<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController(text: '1');
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  PaymentMethod _paymentMethod = PaymentMethod.cashOnDelivery;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _quantityController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  double get _quantity => double.tryParse(_quantityController.text) ?? 0;
  int get _lineTotalMinor => (widget.listing.unitPriceMinor * _quantity).round();
  String get _lineTotalFormatted => (_lineTotalMinor / 100.0).toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.checkout)),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Order Summary Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.orderSummary, style: Theme.of(context).textTheme.titleMedium),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(widget.listing.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                          Text('${widget.listing.priceFormatted} ETB/${widget.listing.unit}'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${l10n.available}: ${widget.listing.quantityAvailable.toStringAsFixed(0)} ${widget.listing.unit}',
                        style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Quantity
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: '${l10n.quantity} (${widget.listing.unit})',
                  prefixIcon: const Icon(Icons.production_quantity_limits),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (val) {
                  final qty = double.tryParse(val ?? '');
                  if (qty == null || qty <= 0) return l10n.required;
                  if (qty > widget.listing.quantityAvailable) {
                    return '${l10n.maxAvailable}: ${widget.listing.quantityAvailable}';
                  }
                  return null;
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: l10n.phoneNumber,
                  prefixIcon: const Icon(Icons.phone),
                  hintText: '+251...',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // Delivery Address
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: l10n.deliveryAddress,
                  prefixIcon: const Icon(Icons.location_on),
                ),
                maxLines: 2,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return l10n.required;
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Delivery Notes
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  labelText: l10n.deliveryNotesOptional,
                  prefixIcon: const Icon(Icons.notes),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),

              // Payment Method
              Text(l10n.paymentMethod, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              ...PaymentMethod.values.map((method) {
                return RadioListTile<PaymentMethod>(
                  value: method,
                  groupValue: _paymentMethod,
                  title: Text(_paymentMethodLabel(method, l10n)),
                  subtitle: Text(_paymentMethodDesc(method, l10n), style: const TextStyle(fontSize: 12)),
                  secondary: Icon(_paymentMethodIcon(method)),
                  onChanged: (val) => setState(() => _paymentMethod = val!),
                );
              }),
              const SizedBox(height: 16),

              // Total
              Card(
                color: WaanofiColors.primary.withValues(alpha: 0.08),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.totalAmount, style: const TextStyle(fontSize: 16)),
                      Text(
                        '$_lineTotalFormatted ETB',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: WaanofiColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Place Order Button
              SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _placeOrder,
                  icon: _isSubmitting
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.check_circle),
                  label: Text(_isSubmitting ? l10n.processing : l10n.placeOrder),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WaanofiColors.primary,
                    foregroundColor: WaanofiColors.surface,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;

    // Check connectivity — checkout MUST be online
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.checkoutRequiresInternet),
            backgroundColor: WaanofiColors.error,
          ),
        );
      }
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final user = ref.read(currentUserProvider);
      final controller = ref.read(orderControllerProvider.notifier);

      final result = await controller.placeOrder(
        listingId: widget.listing.id,
        quantity: _quantity,
        paymentMethod: _paymentMethod,
        buyerName: user?.fullName ?? '',
        buyerPhone: _phoneController.text.isEmpty ? null : _phoneController.text,
        deliveryAddress: _addressController.text,
        deliveryNotes: _notesController.text.isEmpty ? null : _notesController.text,
      );

      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            icon: const Icon(Icons.check_circle, color: WaanofiColors.success, size: 48),
            title: Text(l10n.orderPlaced),
            content: Text('${l10n.orderNumber}: ${result['order_number']}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context.go('/marketplace');
                },
                child: Text(l10n.continueShopping),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  context.go('/marketplace/orders');
                },
                child: Text(l10n.viewOrders),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), backgroundColor: WaanofiColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  String _paymentMethodLabel(PaymentMethod method, AppLocalizations l10n) {
    switch (method) {
      case PaymentMethod.cashOnDelivery:
        return l10n.cashOnDelivery;
      case PaymentMethod.telebirr:
        return 'Telebirr';
      case PaymentMethod.cbe:
        return 'CBE';
      case PaymentMethod.bankTransfer:
        return l10n.bankTransfer;
    }
  }

  String _paymentMethodDesc(PaymentMethod method, AppLocalizations l10n) {
    switch (method) {
      case PaymentMethod.cashOnDelivery:
        return l10n.payOnDeliveryDesc;
      case PaymentMethod.telebirr:
        return l10n.comingSoon;
      case PaymentMethod.cbe:
        return l10n.comingSoon;
      case PaymentMethod.bankTransfer:
        return l10n.bankTransferDesc;
    }
  }

  IconData _paymentMethodIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.cashOnDelivery:
        return Icons.money;
      case PaymentMethod.telebirr:
        return Icons.phone_android;
      case PaymentMethod.cbe:
        return Icons.account_balance;
      case PaymentMethod.bankTransfer:
        return Icons.account_balance_wallet;
    }
  }
}
