import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../core/sync/connectivity_provider.dart';
import '../../domain/cart_model.dart';
import '../../domain/cart_item_model.dart';
import '../../domain/delivery_address_model.dart';
import '../../data/address_repository.dart';
import '../controllers/cart_controller.dart';

class OrderSummaryPage extends ConsumerStatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  ConsumerState<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends ConsumerState<OrderSummaryPage> {
  String _fulfilment = 'pickup';
  String _timeSlot = 'morning';
  final _notesCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cart = ref.read(cartControllerProvider);
    _fulfilment = cart.selectedFulfilmentMethod ?? 'pickup';
    _timeSlot = cart.selectedTimeSlot ?? 'morning';
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  void _onProceed(AppLocalizations l10n, bool isOffline) {
    final res = ref.read(cartControllerProvider.notifier).validateForCheckout(isOffline: isOffline);
    if (!res.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.message ?? l10n.checkoutRequiresInternet),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show Phase 4 completion confirmation modal!
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 28),
            const SizedBox(width: 8),
            const Text('Order Ready for Phase 5'),
          ],
        ),
        content: const Text(
          'Your farm order has been fully prepared and validated online!\n\nAs per Phase 4 requirements, inventory is currently an estimate and is not marked as reserved until final payment initiation in Phase 5.',
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: WaanofiColors.primary, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.of(ctx).pop();
              context.go('/marketplace');
            },
            child: const Text('Return to Marketplace'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cart = ref.watch(cartControllerProvider);
    final isOffline = ref.watch(isOfflineProvider);
    final addressesAsync = ref.watch(buyerAddressesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.orderSummary, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isOffline)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.red)),
                child: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.red),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(l10n.checkoutRequiresInternet, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            Text('Farm Seller', style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary)),
            const SizedBox(height: 4),
            Text(cart.farmName ?? 'Unknown Farm', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),
            Text(l10n.fulfilmentMethod, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(l10n.pickupAtFarm, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    value: 'pickup',
                    groupValue: _fulfilment,
                    activeColor: WaanofiColors.primary,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() => _fulfilment = val!);
                      ref.read(cartControllerProvider.notifier).setFulfilmentMethod(val!);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(l10n.deliveryToAddress, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    value: 'delivery',
                    groupValue: _fulfilment,
                    activeColor: WaanofiColors.primary,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() => _fulfilment = val!);
                      ref.read(cartControllerProvider.notifier).setFulfilmentMethod(val!);
                    },
                  ),
                ),
              ],
            ),
            if (_fulfilment == 'delivery') ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.deliveryAddress, style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextButton.icon(
                    onPressed: () => context.push('/buyer/addresses'),
                    icon: const Icon(Icons.edit_location_alt, size: 18),
                    label: const Text('Manage Addresses'),
                  ),
                ],
              ),
              addressesAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, stack) => Text('Error: $e'),
                data: (addresses) {
                  if (addresses.isEmpty) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.amber.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                      child: const Text('No delivery addresses found. Please add a delivery address above.'),
                    );
                  }
                  final selectedId = cart.selectedDeliveryAddressId ?? addresses.firstWhere((a) => a.isDefault, orElse: () => addresses.first).id;
                  if (cart.selectedDeliveryAddressId == null) {
                    Future.microtask(() => ref.read(cartControllerProvider.notifier).setDeliveryAddress(selectedId));
                  }
                  final selectedAddr = addresses.firstWhere((a) => a.id == selectedId, orElse: () => addresses.first);

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: const BorderSide(color: WaanofiColors.primary)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: WaanofiColors.primary, size: 20),
                              const SizedBox(width: 8),
                              Text(selectedAddr.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('${selectedAddr.recipientName} (${selectedAddr.phone})', style: const TextStyle(fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Text(selectedAddr.fullAddressDisplay, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
            const SizedBox(height: 20),
            Text(l10n.deliverySlot, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _timeSlot,
              decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              items: [
                DropdownMenuItem(value: 'morning', child: Text(l10n.morningSlot)),
                DropdownMenuItem(value: 'afternoon', child: Text(l10n.afternoonSlot)),
              ],
              onChanged: (val) {
                setState(() => _timeSlot = val!);
                ref.read(cartControllerProvider.notifier).setTimeSlot(val!);
              },
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),
            Text(l10n.orderSummary, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
            const SizedBox(height: 12),
            ...cart.items.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.quantity}x ${item.title}', style: const TextStyle(fontSize: 15)),
                  Text('${item.totalCostEtb.toStringAsFixed(2)} ETB', style: const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            )),
            const SizedBox(height: 12),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Items Subtotal', style: TextStyle(color: WaanofiColors.textSecondary)),
                Text('${cart.itemsTotalEtb.toStringAsFixed(2)} ETB', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            if (_fulfilment == 'delivery')
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Estimated Delivery Fee', style: TextStyle(color: WaanofiColors.textSecondary)),
                    Text('${cart.estimatedDeliveryFeeEtb.toStringAsFixed(2)} ETB', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: WaanofiColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.totalAmount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
                  Text('${cart.grandTotalEtb.toStringAsFixed(2)} ETB', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: WaanofiColors.primary)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: WaanofiColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: isOffline ? null : () => _onProceed(l10n, isOffline),
                child: Text(isOffline ? 'Offline (Checkout Blocked)' : 'Confirm Order Preparation', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
