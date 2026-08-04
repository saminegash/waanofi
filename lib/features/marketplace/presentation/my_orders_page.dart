import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../domain/order_model.dart';
import 'controllers/order_controller.dart';

class MyOrdersPage extends ConsumerStatefulWidget {
  const MyOrdersPage({super.key});

  @override
  ConsumerState<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends ConsumerState<MyOrdersPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(orderControllerProvider.notifier).loadMyOrders());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myOrders)),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.buyerOrders.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.receipt_long_outlined, size: 64, color: WaanofiColors.textSecondary.withValues(alpha: 0.5)),
                      const SizedBox(height: 16),
                      Text(l10n.noOrders, style: const TextStyle(fontSize: 16, color: WaanofiColors.textSecondary)),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () => ref.read(orderControllerProvider.notifier).loadMyOrders(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.buyerOrders.length,
                    itemBuilder: (context, index) {
                      final order = state.buyerOrders[index];
                      return _OrderCard(order: order);
                    },
                  ),
                ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _statusColor(order.status);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Number + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.orderNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
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

            // Items
            if (order.items != null)
              ...order.items!.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(item.productName, style: const TextStyle(color: WaanofiColors.textSecondary))),
                        Text('${item.quantity.toStringAsFixed(0)} ${item.unit}'),
                      ],
                    ),
                  )),

            const Divider(),

            // Total + Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.createdAt.toString().split(' ')[0],
                  style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12),
                ),
                Text(
                  '${order.totalFormatted} ETB',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.primary),
                ),
              ],
            ),

            // Delivery Status
            if (order.deliveryInfo != null && order.deliveryInfo!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.local_shipping, size: 16, color: WaanofiColors.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    _deliveryLabel(order.deliveryInfo!.first.status, l10n),
                    style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
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

  String _deliveryLabel(DeliveryTrackingStatus status, AppLocalizations l10n) {
    switch (status) {
      case DeliveryTrackingStatus.pending:
        return l10n.deliveryPending;
      case DeliveryTrackingStatus.assigned:
        return l10n.deliveryAssigned;
      case DeliveryTrackingStatus.pickedUp:
        return l10n.deliveryPickedUp;
      case DeliveryTrackingStatus.inTransit:
        return l10n.deliveryInTransit;
      case DeliveryTrackingStatus.delivered:
        return l10n.deliveryDelivered;
      case DeliveryTrackingStatus.failed:
        return l10n.deliveryFailed;
    }
  }
}
