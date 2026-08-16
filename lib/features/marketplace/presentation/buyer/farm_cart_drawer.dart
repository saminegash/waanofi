import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../domain/cart_model.dart';
import '../../domain/cart_item_model.dart';
import '../controllers/cart_controller.dart';

class FarmCartPage extends ConsumerWidget {
  const FarmCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final cart = ref.watch(cartControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.farmCart, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
        actions: [
          if (!cart.isEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () => _confirmClear(context, ref, l10n),
            ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: EmptyStateWidget(
                icon: Icons.shopping_cart_outlined,
                title: l10n.farmCart,
                description: 'Your farm cart is currently empty. Browse approved farm product listings and add items from your selected farmer.',
                actionLabel: l10n.continueShopping,
                onActionPressed: () => context.go('/marketplace'),
              ),
            )
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: WaanofiColors.primary.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      const Icon(Icons.agriculture, color: WaanofiColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Ordering from: ${cart.farmName ?? "Selected Farm"}',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: WaanofiColors.outline),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  IconButton(
                                    icon: const Icon(Icons.close, color: Colors.grey, size: 20),
                                    onPressed: () => ref.read(cartControllerProvider.notifier).removeItem(item.listingId),
                                  ),
                                ],
                              ),
                              Text(
                                '${item.unitPriceEtb.toStringAsFixed(2)} ETB / ${item.sellingUnit}',
                                style: const TextStyle(color: WaanofiColors.textSecondary),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline, color: WaanofiColors.primary),
                                        onPressed: () => _changeQty(context, ref, item, item.quantity - 1),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(border: Border.all(color: WaanofiColors.outline), borderRadius: BorderRadius.circular(6)),
                                        child: Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_circle_outline, color: WaanofiColors.primary),
                                        onPressed: () => _changeQty(context, ref, item, item.quantity + 1),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${item.totalCostEtb.toStringAsFixed(2)} ETB',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark, fontSize: 16),
                                  ),
                                ],
                              ),
                              if (!item.isValidQuantity)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    'Warning: MOQ is ${item.minimumOrderQuantity} ${item.sellingUnit} (Max: ${item.maximumOrderQuantity ?? item.approximateStock.toInt()})',
                                    style: const TextStyle(color: Colors.red, fontSize: 12),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: WaanofiColors.surface,
                    border: const Border(top: BorderSide(color: WaanofiColors.outline)),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.totalAmount, style: const TextStyle(fontSize: 16, color: WaanofiColors.textSecondary)),
                          Text('${cart.itemsTotalEtb.toStringAsFixed(2)} ETB', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: WaanofiColors.primaryDark)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: WaanofiColors.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () => context.push('/marketplace/summary'),
                          child: Text(l10n.proceedToReview, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  void _changeQty(BuildContext context, WidgetRef ref, CartItemModel item, int newQty) {
    final res = ref.read(cartControllerProvider.notifier).updateQuantity(item.listingId, newQty);
    if (!res.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.message ?? 'Invalid quantity'), backgroundColor: Colors.red));
    }
  }

  void _confirmClear(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear Cart?'),
        content: const Text('Are you sure you want to empty your farm cart?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: Text(l10n.no)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () {
              ref.read(cartControllerProvider.notifier).clearCart();
              Navigator.of(ctx).pop();
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
