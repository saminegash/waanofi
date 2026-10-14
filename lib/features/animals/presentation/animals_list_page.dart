import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../../../shared/widgets/empty_state_widget.dart';
import '../../../shared/widgets/skeleton_loader.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../domain/animal_enums.dart';
import '../domain/animal_model.dart';
import 'controllers/animals_controller.dart';

class AnimalsListPage extends ConsumerWidget {
  const AnimalsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsControllerProvider);
    final isOnline = ref.watch(networkStatusProvider).valueOrNull ?? true;
    final filterState = ref.watch(animalsStateProvider);
    final controller = ref.watch(animalsControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    final hasActiveFilters = filterState.lifecycleFilter != null ||
        filterState.reproductiveFilter != null ||
        filterState.lactationFilter != null ||
        filterState.healthFilter != null ||
        filterState.cattleClassFilter != null ||
        filterState.breedFilter != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.herdManagement),
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: hasActiveFilters,
              child: const Icon(Icons.filter_list),
            ),
            tooltip: l10n.filterHerd,
            onPressed: () => _showFilterSheet(context, ref),
          ),
        ],
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
          // Search Box & Active Filter Chips
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                labelText: l10n.searchTagOrName,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: filterState.searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => controller.setSearchQuery(''),
                      )
                    : null,
              ),
              onChanged: controller.setSearchQuery,
            ),
          ),

          // Active Filters Row
          if (hasActiveFilters)
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.clear_all, size: 16),
                    label: Text(l10n.resetFilters),
                    onPressed: controller.resetFilters,
                  ),
                  const SizedBox(width: 8),
                  if (filterState.lifecycleFilter != null)
                    Chip(
                      label: Text(filterState.lifecycleFilter!.name),
                      onDeleted: () => controller.setLifecycleFilter(null),
                    ),
                  if (filterState.reproductiveFilter != null)
                    Chip(
                      label: Text(filterState.reproductiveFilter!.name),
                      onDeleted: () => controller.setReproductiveFilter(null),
                    ),
                  if (filterState.lactationFilter != null)
                    Chip(
                      label: Text(filterState.lactationFilter!.name),
                      onDeleted: () => controller.setLactationFilter(null),
                    ),
                  if (filterState.healthFilter != null)
                    Chip(
                      label: Text(filterState.healthFilter!.name),
                      onDeleted: () => controller.setHealthFilter(null),
                    ),
                  if (filterState.cattleClassFilter != null)
                    Chip(
                      label: Text(filterState.cattleClassFilter!.name),
                      onDeleted: () => controller.setCattleClassFilter(null),
                    ),
                  if (filterState.breedFilter != null)
                    Chip(
                      label: Text(filterState.breedFilter!),
                      onDeleted: () => controller.setBreedFilter(null),
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
        fallback: const SizedBox.shrink(),
        child: FloatingActionButton(
          heroTag: null,
          onPressed: () => context.go('/animals/new'),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => const _FilterBottomSheet(),
    );
  }
}

class _AnimalListItem extends StatelessWidget {
  const _AnimalListItem({required this.animal});

  final AnimalModel animal;

  Color _getLifecycleColor() {
    switch (animal.lifecycleStatus) {
      case AnimalLifecycleStatus.active:
        return WaanofiColors.success;
      case AnimalLifecycleStatus.sold:
      case AnimalLifecycleStatus.transferredOut:
        return WaanofiColors.primaryDark;
      case AnimalLifecycleStatus.deceased:
      case AnimalLifecycleStatus.culled:
        return WaanofiColors.error;
      default:
        return WaanofiColors.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMale = animal.sex.toLowerCase() == 'male';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.go('/animals/${animal.id}'),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: WaanofiColors.primaryLight,
                    child: Text(
                      animal.tagNumber.substring(0, animal.tagNumber.length > 2 ? 2 : animal.tagNumber.length),
                      style: const TextStyle(color: WaanofiColors.primaryDark, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${animal.tagNumber} ${animal.name != null ? "• ${animal.name}" : ""}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '${animal.cattleClass.name.toUpperCase()} • ${animal.breed ?? l10n.unknownBreed} • ${animal.sex.toUpperCase()}',
                          style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(
                      animal.lifecycleStatus.name.toUpperCase(),
                      style: const TextStyle(fontSize: 10, color: WaanofiColors.surface, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: _getLifecycleColor(),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  if (!isMale) ...[
                    _StatusBadge(label: animal.reproductiveStatus.name, color: Colors.purple),
                    _StatusBadge(label: animal.lactationStatus.name, color: Colors.teal),
                  ],
                  _StatusBadge(
                    label: animal.healthStatus.name,
                    color: animal.healthStatus == AnimalHealthStatus.healthy
                        ? WaanofiColors.success
                        : WaanofiColors.error,
                  ),
                  if (animal.location != null && animal.location!.isNotEmpty)
                    _StatusBadge(label: animal.location!, color: Colors.blueGrey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}

class _FilterBottomSheet extends ConsumerWidget {
  const _FilterBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(animalsStateProvider);
    final controller = ref.watch(animalsControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: const BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.filterHerd,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: WaanofiColors.primary),
                ),
                TextButton(
                  onPressed: () {
                    controller.resetFilters();
                    Navigator.pop(context);
                  },
                  child: Text(l10n.resetFilters),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 8),

            // Lifecycle
            DropdownButtonFormField<AnimalLifecycleStatus?>(
              value: filterState.lifecycleFilter,
              decoration: InputDecoration(labelText: l10n.lifecycleStatus),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allLifecycles)),
                ...AnimalLifecycleStatus.values.map(
                  (s) => DropdownMenuItem(value: s, child: Text(s.name)),
                ),
              ],
              onChanged: (v) => controller.setLifecycleFilter(v),
            ),
            const SizedBox(height: 12),

            // Reproductive
            DropdownButtonFormField<AnimalReproductiveStatus?>(
              value: filterState.reproductiveFilter,
              decoration: InputDecoration(labelText: l10n.reproductiveStatus),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allReproductive)),
                ...AnimalReproductiveStatus.values.map(
                  (s) => DropdownMenuItem(value: s, child: Text(s.name)),
                ),
              ],
              onChanged: (v) => controller.setReproductiveFilter(v),
            ),
            const SizedBox(height: 12),

            // Lactation
            DropdownButtonFormField<AnimalLactationStatus?>(
              value: filterState.lactationFilter,
              decoration: InputDecoration(labelText: l10n.lactationStatus),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allLactation)),
                ...AnimalLactationStatus.values.map(
                  (s) => DropdownMenuItem(value: s, child: Text(s.name)),
                ),
              ],
              onChanged: (v) => controller.setLactationFilter(v),
            ),
            const SizedBox(height: 12),

            // Health
            DropdownButtonFormField<AnimalHealthStatus?>(
              value: filterState.healthFilter,
              decoration: InputDecoration(labelText: l10n.healthStatus),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allHealth)),
                ...AnimalHealthStatus.values.map(
                  (s) => DropdownMenuItem(value: s, child: Text(s.name)),
                ),
              ],
              onChanged: (v) => controller.setHealthFilter(v),
            ),
            const SizedBox(height: 12),

            // Cattle Class
            DropdownButtonFormField<CattleClass?>(
              value: filterState.cattleClassFilter,
              decoration: InputDecoration(labelText: l10n.cattleClass),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allClasses)),
                ...CattleClass.values.map(
                  (s) => DropdownMenuItem(value: s, child: Text(s.name)),
                ),
              ],
              onChanged: (v) => controller.setCattleClassFilter(v),
            ),
            const SizedBox(height: 12),

            // Breed
            DropdownButtonFormField<String?>(
              value: filterState.breedFilter,
              decoration: InputDecoration(labelText: l10n.breed),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.allBreeds)),
                ...controller.getAvailableBreeds().map(
                      (b) => DropdownMenuItem(value: b, child: Text(b)),
                    ),
              ],
              onChanged: (v) => controller.setBreedFilter(v),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
