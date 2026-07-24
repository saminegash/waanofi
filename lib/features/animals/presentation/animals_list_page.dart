import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/skeleton_loader.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../domain/animal_model.dart';
import 'controllers/animals_controller.dart';

class AnimalsListPage extends ConsumerWidget {
  const AnimalsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final animalsAsync = ref.watch(animalsControllerProvider);
    final isOnline = ref.watch(networkStatusProvider).valueOrNull ?? true;
    final filterState = ref.watch(animalsStateProvider);
    final controller = ref.watch(animalsControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.herdManagement),
        bottom: !isOnline
            ? PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Container(
                  width: double.infinity,
                  color: WaanofiColors.warning,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    l10n.offlineMode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: WaanofiColors.textPrimary, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : null,
      ),
      body: Column(
        children: [
          // Search and Filters
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: l10n.searchTagOrName,
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: controller.setSearchQuery,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String?>(
                        value: filterState.statusFilter,
                        decoration: InputDecoration(
                          labelText: l10n.status,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        items: [
                          DropdownMenuItem(value: null, child: Text(l10n.allStatuses)),
                          DropdownMenuItem(value: 'active', child: Text(l10n.active)),
                          DropdownMenuItem(value: 'dry', child: Text(l10n.dry)),
                          DropdownMenuItem(value: 'pregnant', child: Text(l10n.pregnant)),
                          DropdownMenuItem(value: 'sick', child: Text(l10n.sick)),
                          DropdownMenuItem(value: 'sold', child: Text(l10n.sold)),
                          DropdownMenuItem(value: 'deceased', child: Text(l10n.deceased)),
                        ],
                        onChanged: controller.setStatusFilter,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String?>(
                        value: filterState.breedFilter,
                        decoration: InputDecoration(
                          labelText: l10n.breed,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        items: [
                          DropdownMenuItem(value: null, child: Text(l10n.allBreeds)),
                          ...controller.getAvailableBreeds().map(
                                (b) => DropdownMenuItem(value: b, child: Text(b)),
                              ),
                        ],
                        onChanged: controller.setBreedFilter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Animal List
          Expanded(
            child: animalsAsync.when(
              loading: () => const ListSkeleton(itemCount: 8),
              error: (err, stack) => Center(child: Text('${l10n.error}: $err')),
              data: (animals) {
                if (animals.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.pets,
                    title: l10n.noAnimalsFound,
                    description: l10n.emptyHerdDesc,
                    actionLabel: l10n.addAnimal,
                    onActionPressed: () => context.go('/animals/new'),
                  );
                }
                return ListView.builder(
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    final animal = animals[index];
                    return _AnimalListItem(animal: animal);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: RoleGuard(
        permission: Permission.manageAnimals,
        fallback: const SizedBox.shrink(), // hide FAB if not admin
        child: FloatingActionButton(
          heroTag: null,
          onPressed: () => context.go('/animals/new'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _AnimalListItem extends StatelessWidget {
  const _AnimalListItem({required this.animal});

  final AnimalModel animal;

  Color _getStatusColor() {
    switch (animal.status) {
      case 'active':
        return WaanofiColors.success;
      case 'sick':
        return WaanofiColors.error;
      case 'pregnant':
      case 'dry':
        return WaanofiColors.warning;
      default:
        return WaanofiColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: WaanofiColors.primaryLight,
          child: Text(
            animal.tagNumber.substring(0, animal.tagNumber.length > 2 ? 2 : animal.tagNumber.length),
            style: const TextStyle(color: WaanofiColors.primaryDark),
          ),
        ),
        title: Text('${animal.tagNumber} - ${animal.name ?? l10n.unnamed}'),
        subtitle: Text('${animal.breed ?? l10n.unknownBreed} • ${animal.sex}'),
        trailing: Chip(
          label: Text(
            animal.status.toUpperCase(),
            style: const TextStyle(fontSize: 10, color: WaanofiColors.surface, fontWeight: FontWeight.bold),
          ),
          backgroundColor: _getStatusColor(),
          padding: EdgeInsets.zero,
        ),
        onTap: () => context.go('/animals/${animal.id}'),
      ),
    );
  }
}
