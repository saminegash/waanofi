import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../domain/order_model.dart';
import 'controllers/order_controller.dart';

class SellerOrdersPage extends ConsumerStatefulWidget {
  const SellerOrdersPage({super.key});

  @override
  ConsumerState<SellerOrdersPage> createState() => _SellerOrdersPageState();
}

class _SellerOrdersPageState extends ConsumerState<SellerOrdersPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(orderControllerProvider.notifier).loadSellerOrders());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.incomingOrders)),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.sellerOrders.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.inbox_outlined, size: 64, color: WaanofiColors.textSecondary.withValues(alpha: 0.5)),
                      const SizedBox(height: 16),
                      Text(l10n.noIncomingOrders, style: const TextStyle(fontSize: 16, color: WaanofiColors.textSecondary)),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => ref.read(orderControllerProvider.notifier).loadSellerOrders(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.sellerOrders.length,
                    itemBuilder: (context, index) {
                      final order = state.sellerOrders[index];
                      return _SellerOrderCard(order: order);
                    },
                  ),
                ),
    );
  }
}

class _SellerOrderCard extends ConsumerWidget {
  const _SellerOrderCard({required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _statusColor(order.status);
    final controller = ref.read(orderControllerProvider.notifier);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.orderNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _statusLabel(order.status, l10n),
                    style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Buyer Info
            Row(
              children: [
                const Icon(Icons.person, size: 16, color: WaanofiColors.textSecondary),
                const SizedBox(width: 4),
                Text(order.buyerName, style: const TextStyle(color: WaanofiColors.textSecondary)),
                if (order.buyerPhone != null) ...[
                  const SizedBox(width: 12),
                  const Icon(Icons.phone, size: 16, color: WaanofiColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(order.buyerPhone!, style: const TextStyle(color: WaanofiColors.textSecondary)),
                ],
              ],
            ),
            const SizedBox(height: 4),

            // Delivery Address
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: WaanofiColors.textSecondary),
                const SizedBox(width: 4),
                Expanded(child: Text(order.deliveryAddress, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12))),
              ],
            ),
            const SizedBox(height: 8),

            // Items
            if (order.items != null)
              ...order.items!.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(item.productName)),
                        Text('${item.quantity.toStringAsFixed(0)} ${item.unit}'),
                      ],
                    ),
                  )),

            const Divider(),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.createdAt.toString().split(' ')[0], style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                Text('${order.totalFormatted} ETB', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.primary)),
              ],
            ),

            // Action Buttons
            if (_canProgress(order.status)) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (order.status != MarketplaceOrderStatus.cancelled)
                    TextButton(
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(l10n.cancelOrder),
                            content: Text(l10n.cancelOrderConfirm),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.no)),
                              TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.yes)),
                            ],
                          ),
                        );
                        if (confirm == true) {
                          await controller.updateOrderStatus(
                            orderId: order.id,
                            newStatus: MarketplaceOrderStatus.cancelled,
                          );
                        }
                      },
                      child: Text(l10n.cancel, style: const TextStyle(color: WaanofiColors.error)),
                    ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final nextStatus = _nextStatus(order.status);
                      if (nextStatus != null) {
                        await controller.updateOrderStatus(
                          orderId: order.id,
                          newStatus: nextStatus,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: WaanofiColors.primary,
                      foregroundColor: WaanofiColors.surface,
                    ),
                    child: Text(_nextActionLabel(order.status, l10n)),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  bool _canProgress(MarketplaceOrderStatus status) {
    return status != MarketplaceOrderStatus.completed &&
        status != MarketplaceOrderStatus.cancelled &&
        status != MarketplaceOrderStatus.delivered;
  }

  MarketplaceOrderStatus? _nextStatus(MarketplaceOrderStatus current) {
    switch (current) {
      case MarketplaceOrderStatus.pending:
        return MarketplaceOrderStatus.confirmed;
      case MarketplaceOrderStatus.confirmed:
        return MarketplaceOrderStatus.processing;
      case MarketplaceOrderStatus.processing:
        return MarketplaceOrderStatus.readyForDelivery;
      case MarketplaceOrderStatus.readyForDelivery:
        return MarketplaceOrderStatus.outForDelivery;
      case MarketplaceOrderStatus.outForDelivery:
        return MarketplaceOrderStatus.delivered;
      default:
        return null;
    }
  }

  String _nextActionLabel(MarketplaceOrderStatus status, AppLocalizations l10n) {
    switch (status) {
      case MarketplaceOrderStatus.pending:
        return l10n.confirmOrder;
      case MarketplaceOrderStatus.confirmed:
        return l10n.startProcessing;
      case MarketplaceOrderStatus.processing:
        return l10n.markReady;
      case MarketplaceOrderStatus.readyForDelivery:
        return l10n.sendForDelivery;
      case MarketplaceOrderStatus.outForDelivery:
        return l10n.markDelivered;
      default:
        return '';
    }
  }

  Color _statusColor(MarketplaceOrderStatus status) {
    switch (status) {
      case MarketplaceOrderStatus.pending:
        return WaanofiColors.warning;
      case MarketplaceOrderStatus.confirmed:
      case MarketplaceOrderStatus.processing:
        return WaanofiColors.primaryLight;
      case MarketplaceOrderStatus.readyForDelivery:
      case MarketplaceOrderStatus.outForDelivery:
        return const Color(0xFF1565C0);
      case MarketplaceOrderStatus.delivered:
      case MarketplaceOrderStatus.completed:
        return WaanofiColors.success;
      case MarketplaceOrderStatus.cancelled:
        return WaanofiColors.error;
    }
  }

  String _statusLabel(MarketplaceOrderStatus status, AppLocalizations l10n) {
    switch (status) {
      case MarketplaceOrderStatus.pending:
        return l10n.statusPending;
      case MarketplaceOrderStatus.confirmed:
        return l10n.statusConfirmed;
      case MarketplaceOrderStatus.processing:
        return l10n.statusProcessing;
      case MarketplaceOrderStatus.readyForDelivery:
        return l10n.statusReady;
      case MarketplaceOrderStatus.outForDelivery:
        return l10n.statusOutForDelivery;
      case MarketplaceOrderStatus.delivered:
        return l10n.statusDelivered;
      case MarketplaceOrderStatus.completed:
        return l10n.statusCompleted;
      case MarketplaceOrderStatus.cancelled:
        return l10n.statusCancelled;
    }
  }
}
