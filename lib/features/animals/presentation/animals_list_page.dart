import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/skeleton_loader.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Herd Management'),
        bottom: !isOnline
            ? PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Container(
                  width: double.infinity,
                  color: WaanofiColors.warning,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    'Offline mode - showing cached data',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: WaanofiColors.textPrimary, fontWeight: FontWeight.bold),
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
                  decoration: const InputDecoration(
                    labelText: 'Search tag or name...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: controller.setSearchQuery,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String?>(
                        value: filterState.statusFilter,
                        decoration: const InputDecoration(
                          labelText: 'Status',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        items: const [
                          DropdownMenuItem(value: null, child: Text('All Statuses')),
                          DropdownMenuItem(value: 'active', child: Text('Active')),
                          DropdownMenuItem(value: 'dry', child: Text('Dry')),
                          DropdownMenuItem(value: 'pregnant', child: Text('Pregnant')),
                          DropdownMenuItem(value: 'sick', child: Text('Sick')),
                          DropdownMenuItem(value: 'sold', child: Text('Sold')),
                          DropdownMenuItem(value: 'deceased', child: Text('Deceased')),
                        ],
                        onChanged: controller.setStatusFilter,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String?>(
                        value: filterState.breedFilter,
                        decoration: const InputDecoration(
                          labelText: 'Breed',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        items: [
                          const DropdownMenuItem(value: null, child: Text('All Breeds')),
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
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (animals) {
                if (animals.isEmpty) {
                  return EmptyStateWidget(
                    icon: Icons.pets,
                    title: 'No animals found',
                    description: 'Your herd is currently empty or no animals match your filter.',
                    actionLabel: 'Add Animal',
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
        title: Text('${animal.tagNumber} - ${animal.name ?? 'Unnamed'}'),
        subtitle: Text('${animal.breed ?? 'Unknown breed'} • ${animal.sex}'),
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
