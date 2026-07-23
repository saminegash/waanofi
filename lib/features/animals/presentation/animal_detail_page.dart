import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';
import '../domain/animal_model.dart';
import 'controllers/animals_controller.dart';

class AnimalDetailPage extends ConsumerWidget {
  const AnimalDetailPage({super.key, required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsControllerProvider);
    
    // Find the animal in the cached list
    final animal = animalsAsync.valueOrNull?.where((a) => a.id == animalId).firstOrNull;

    if (animalsAsync.isLoading && animal == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (animal == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(child: Text('Animal not found.')),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(animal.tagNumber),
          actions: [
            RoleGuard(
              permission: Permission.manageAnimals,
              fallback: const SizedBox.shrink(),
              child: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => context.go('/animals/$animalId/edit'),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Milk'),
              Tab(text: 'Feed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Info
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _InfoTile('Tag Number', animal.tagNumber),
                _InfoTile('Name', animal.name ?? '-'),
                _InfoTile('Breed', animal.breed ?? '-'),
                _InfoTile('Sex', animal.sex),
                _InfoTile('Status', animal.status),
                if (animal.dob != null)
                  _InfoTile('Date of Birth', animal.dob.toString().split(' ')[0]),
              ],
            ),
            // Tab 2: Milk History (Placeholder)
            const Center(child: Text('Milk history coming soon')),
            // Tab 3: Feed History (Placeholder)
            const Center(child: Text('Feed history coming soon')),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
