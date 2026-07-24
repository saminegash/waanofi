import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import '../domain/animal_model.dart';
import 'controllers/animals_controller.dart';

class AnimalDetailPage extends ConsumerWidget {
  const AnimalDetailPage({super.key, required this.animalId});

  final String animalId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsControllerProvider);
    final l10n = AppLocalizations.of(context)!;
    
    // Find the animal in the cached list
    final animal = animalsAsync.valueOrNull?.where((a) => a.id == animalId).firstOrNull;

    if (animalsAsync.isLoading && animal == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (animal == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.notFound)),
        body: Center(child: Text(l10n.animalNotFound)),
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
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.info),
              Tab(text: l10n.milk),
              Tab(text: l10n.feed),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Info
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _InfoTile(l10n.tagNumber.replaceAll(' *', ''), animal.tagNumber),
                _InfoTile(l10n.nameOptional.replaceAll(' (Optional)', '').replaceAll(' (Dirqama miti)', '').replaceAll(' (አማራጭ)', ''), animal.name ?? '-'),
                _InfoTile(l10n.breed, animal.breed ?? '-'),
                _InfoTile(l10n.sex, animal.sex),
                _InfoTile(l10n.status, animal.status),
                if (animal.dob != null)
                  _InfoTile(l10n.dateOfBirth, animal.dob.toString().split(' ')[0]),
              ],
            ),
            // Tab 2: Milk History (Placeholder)
            Center(child: Text(l10n.milkHistoryComingSoon)),
            // Tab 3: Feed History (Placeholder)
            Center(child: Text(l10n.feedHistoryComingSoon)),
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
