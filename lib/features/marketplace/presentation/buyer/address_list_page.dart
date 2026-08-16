import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../../core/theme/waanofi_colors.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/address_repository.dart';
import '../../domain/delivery_address_model.dart';
import '../controllers/cart_controller.dart';

class AddressListPage extends ConsumerWidget {
  const AddressListPage({super.key, this.isSelectingForCart = false});
  final bool isSelectingForCart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final addressesAsync = ref.watch(buyerAddressesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.deliveryAddresses, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: WaanofiColors.background,
        elevation: 0.5,
      ),
      body: addressesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: WaanofiColors.primary)),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (addresses) {
          if (addresses.isEmpty) {
            return Center(
              child: EmptyStateWidget(
                icon: Icons.location_off_outlined,
                title: l10n.deliveryAddresses,
                description: 'You have no saved delivery addresses yet. Add one for smooth delivery dispatch.',
                actionLabel: l10n.addAddress,
                onActionPressed: () => context.push('/buyer/addresses/new'),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final addr = addresses[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: addr.isDefault ? WaanofiColors.primary : WaanofiColors.outline, width: addr.isDefault ? 2 : 1),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  onTap: isSelectingForCart
                      ? () {
                          ref.read(cartControllerProvider.notifier).setDeliveryAddress(addr.id);
                          Navigator.of(context).pop();
                        }
                      : null,
                  leading: CircleAvatar(
                    backgroundColor: WaanofiColors.primary.withValues(alpha: 0.1),
                    child: Icon(
                      addr.label.toLowerCase().contains('home') ? Icons.home : Icons.store,
                      color: WaanofiColors.primary,
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(addr.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      if (addr.isDefault) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: WaanofiColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                          child: const Text('Default', style: TextStyle(fontSize: 11, color: WaanofiColors.primary, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text('${addr.recipientName} (${addr.phone})', style: const TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 2),
                      Text(addr.fullAddressDisplay, style: const TextStyle(color: WaanofiColors.textSecondary)),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (action) async {
                      if (action == 'default') {
                        await ref.read(addressRepositoryProvider).setDefaultAddress(addr.id);
                      } else if (action == 'delete') {
                        await ref.read(addressRepositoryProvider).deleteAddress(addr.id);
                      }
                    },
                    itemBuilder: (ctx) => [
                      if (!addr.isDefault)
                        PopupMenuItem(value: 'default', child: Text(l10n.setDefaultAddress)),
                      const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: WaanofiColors.primary,
        foregroundColor: Colors.white,
        onPressed: () => context.push('/buyer/addresses/new'),
        icon: const Icon(Icons.add_location_alt),
        label: Text(l10n.addAddress),
      ),
    );
  }
}
