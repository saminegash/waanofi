import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';
import '../data/flock_repository.dart';
import '../data/egg_production_repository.dart';
import '../domain/flock_model.dart';
import '../domain/egg_production_record_model.dart';

class PoultryDashboardPage extends ConsumerWidget {
  const PoultryDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final flocksStream = ref.watch(flockRepositoryProvider).watchFlocks();
    final eggsStream = ref.watch(eggProductionRepositoryProvider).watchRecords();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.poultryManagement),
        backgroundColor: WaanofiColors.surface,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart, color: WaanofiColors.primary),
            tooltip: l10n.poultryReports,
            onPressed: () => context.push('/poultry/reports'),
          ),
        ],
      ),
      body: StreamBuilder<List<FlockModel>>(
        stream: flocksStream,
        builder: (context, flockSnap) {
          final flocks = flockSnap.data ?? [];
          final activeFlocks = flocks.where((f) => f.isActive).toList();
          final totalBirds = activeFlocks.fold<int>(0, (sum, f) => sum + f.numberOfBirds);
          final totalHens = activeFlocks.fold<int>(0, (sum, f) => sum + f.numberOfLayingHens);

          return StreamBuilder<List<EggProductionRecordModel>>(
            stream: eggsStream,
            builder: (context, eggSnap) {
              final eggRecords = eggSnap.data ?? [];
              final now = DateTime.now();
              final todayRecords = eggRecords.where((r) =>
                r.productionDate.year == now.year &&
                r.productionDate.month == now.month &&
                r.productionDate.day == now.day
              ).toList();

              final todayGood = todayRecords.fold<int>(0, (sum, r) => sum + r.goodEggs);
              final todayAvailable = todayRecords.fold<int>(0, (sum, r) => sum + r.availableEggs);
              final todayTrays = todayAvailable ~/ 30;
              final todayLoose = todayAvailable % 30;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildKpiSection(l10n, activeFlocks.length, totalBirds, totalHens, todayGood, todayTrays, todayLoose),
                    const SizedBox(height: 24),
                    _buildQuickActionButtons(context, l10n),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.activeFlocks,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: WaanofiColors.textPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.push('/poultry/flocks'),
                          child: Text(l10n.viewAll, style: const TextStyle(color: WaanofiColors.primary)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildFlocksList(context, l10n, activeFlocks),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildKpiSection(AppLocalizations l10n, int flockCount, int birds, int hens, int todayEggs, int trays, int loose) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: [
        _buildKpiCard(l10n.activeFlocks, '$flockCount', Icons.groups, WaanofiColors.primary),
        _buildKpiCard(l10n.layingHens, '$hens / $birds', Icons.pets, WaanofiColors.secondary),
        _buildKpiCard(l10n.todayGoodEggs, '$todayEggs', Icons.egg_outlined, WaanofiColors.success),
        _buildKpiCard(l10n.availableForSale, '$trays ${l10n.trays} + $loose', Icons.layers, WaanofiColors.primaryLight),
      ],
    );
  }

  Widget _buildKpiCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: WaanofiColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary), overflow: TextOverflow.ellipsis)),
              Icon(icon, color: color, size: 20),
            ],
          ),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildQuickActionButtons(BuildContext context, AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: RoleGuard(
            permission: Permission.recordEggProduction,
            fallback: const SizedBox.shrink(),
            child: ElevatedButton.icon(
              onPressed: () => context.push('/poultry/record_egg'),
              icon: const Icon(Icons.add_circle_outline, color: WaanofiColors.surface),
              label: Text(l10n.recordDailyEggs, style: const TextStyle(color: WaanofiColors.surface, fontSize: 13, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: WaanofiColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RoleGuard(
            permission: Permission.manageFlocks,
            fallback: const SizedBox.shrink(),
            child: ElevatedButton.icon(
              onPressed: () => context.push('/poultry/flocks/add'),
              icon: const Icon(Icons.add, color: WaanofiColors.surface),
              label: Text(l10n.addFlock, style: const TextStyle(color: WaanofiColors.surface, fontSize: 13, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: WaanofiColors.primaryDark,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlocksList(BuildContext context, AppLocalizations l10n, List<FlockModel> flocks) {
    if (flocks.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
        child: Text(l10n.noFlocksRecorded, style: const TextStyle(color: WaanofiColors.textSecondary)),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: flocks.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final f = flocks[index];
        return InkWell(
          onTap: () => context.push('/poultry/flocks/detail/${f.id}', extra: f),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(color: WaanofiColors.background, borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.egg_outlined, color: WaanofiColors.primary),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(f.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
                      const SizedBox(height: 4),
                      Text('${f.flockCode} • ${f.breed}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${f.numberOfBirds} ${l10n.birds}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: WaanofiColors.primary)),
                    const SizedBox(height: 4),
                    Text('${f.layingRatePercentage.toStringAsFixed(1)}% ${l10n.layingRate}', style: const TextStyle(color: WaanofiColors.secondary, fontSize: 12, fontWeight: FontWeight.w600)),
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
  }
}
