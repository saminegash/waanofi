import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';
import '../data/flock_repository.dart';
import '../domain/flock_model.dart';

class FlocksListPage extends ConsumerWidget {
  const FlocksListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final flocksStream = ref.watch(flockRepositoryProvider).watchFlocks();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.flocks),
        backgroundColor: WaanofiColors.surface,
      ),
      floatingActionButton: RoleGuard(
        permission: Permission.manageFlocks,
        fallback: const SizedBox.shrink(),
        child: FloatingActionButton(
          backgroundColor: WaanofiColors.primary,
          onPressed: () => context.push('/poultry/flocks/add'),
          child: const Icon(Icons.add, color: WaanofiColors.surface),
        ),
      ),
      body: StreamBuilder<List<FlockModel>>(
        stream: flocksStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: WaanofiColors.primary));
          }
          final flocks = snapshot.data ?? [];
          if (flocks.isEmpty) {
            return Center(
              child: Text(l10n.noFlocksRecorded, style: const TextStyle(color: WaanofiColors.textSecondary)),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: flocks.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final f = flocks[index];
              return InkWell(
                onTap: () => context.push('/poultry/flocks/detail/${f.id}', extra: f),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: WaanofiColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: WaanofiColors.outline),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(color: WaanofiColors.background, borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.pets, color: WaanofiColors.primary),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
                            const SizedBox(height: 4),
                            Text('${f.flockCode} • ${f.breed} • ${f.purpose.name}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${f.numberOfBirds} ${l10n.birds}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: WaanofiColors.primary)),
                          const SizedBox(height: 4),
                          Text('${f.numberOfLayingHens} ${l10n.layingHens}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right, color: WaanofiColors.textSecondary),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
