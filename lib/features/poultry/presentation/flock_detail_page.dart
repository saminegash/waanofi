import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';
import '../data/egg_production_repository.dart';
import '../data/flock_adjustment_repository.dart';
import '../domain/flock_model.dart';
import '../domain/egg_production_record_model.dart';
import '../domain/flock_adjustment_model.dart';

class FlockDetailPage extends ConsumerWidget {
  const FlockDetailPage({super.key, required this.flockId, this.initialFlock});
  final String flockId;
  final FlockModel? initialFlock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final eggsStream = ref.watch(eggProductionRepositoryProvider).watchRecordsByFlock(flockId);
    final adjStream = ref.watch(flockAdjustmentRepositoryProvider).watchAdjustmentsByFlock(flockId);
    final flock = initialFlock;

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(flock?.name ?? l10n.flockDetails),
        backgroundColor: WaanofiColors.surface,
        actions: [
          RoleGuard(
            permission: Permission.manageFlocks,
            fallback: const SizedBox.shrink(),
            child: IconButton(
              icon: const Icon(Icons.content_cut, color: WaanofiColors.secondary),
              tooltip: l10n.recordAdjustment,
              onPressed: () => context.push('/poultry/flocks/$flockId/adjust', extra: flock),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (flock != null) _buildSummaryHeader(flock, l10n),
            const SizedBox(height: 24),
            Text(l10n.recentProduction, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
            const SizedBox(height: 12),
            _buildProductionList(eggsStream, l10n),
            const SizedBox(height: 24),
            Text(l10n.populationAdjustments, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
            const SizedBox(height: 12),
            _buildAdjustmentsList(adjStream, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryHeader(FlockModel flock, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: WaanofiColors.outline),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricItem('${flock.numberOfBirds}', l10n.totalBirds, WaanofiColors.primary),
              _buildMetricItem('${flock.numberOfLayingHens}', l10n.layingHens, WaanofiColors.secondary),
              _buildMetricItem('${flock.layingRatePercentage.toStringAsFixed(1)}%', l10n.layingRate, WaanofiColors.primaryLight),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${l10n.breed}: ${flock.breed}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
              Text('${l10n.flockCode}: ${flock.flockCode}', style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: WaanofiColors.textSecondary)),
      ],
    );
  }

  Widget _buildProductionList(Stream<List<EggProductionRecordModel>> stream, AppLocalizations l10n) {
    return StreamBuilder<List<EggProductionRecordModel>>(
      stream: stream,
      builder: (context, snapshot) {
        final records = snapshot.data ?? [];
        if (records.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
            child: Text(l10n.noEggRecordsFound, style: const TextStyle(color: WaanofiColors.textSecondary)),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: records.length > 5 ? 5 : records.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final r = records[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${r.productionDate.year}-${r.productionDate.month}-${r.productionDate.day}', style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                      Text(r.formattedTrayEquivalent, style: const TextStyle(color: WaanofiColors.primary, fontSize: 13)),
                    ],
                  ),
                  Text('${r.goodEggs} ${l10n.goodEggs}', style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAdjustmentsList(Stream<List<FlockAdjustmentModel>> stream, AppLocalizations l10n) {
    return StreamBuilder<List<FlockAdjustmentModel>>(
      stream: stream,
      builder: (context, snapshot) {
        final adjustments = snapshot.data ?? [];
        if (adjustments.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: WaanofiColors.outline)),
            child: Text(l10n.noAdjustmentsRecorded, style: const TextStyle(color: WaanofiColors.textSecondary)),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: adjustments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final adj = adjustments[index];
            final isPositive = adj.birdsChanged >= 0;
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: WaanofiColors.surface, borderRadius: BorderRadius.circular(12), border: Border.all(color: WaanofiColors.outline)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(adj.adjustmentType.name.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary)),
                      if (adj.reason != null && adj.reason!.isNotEmpty) Text(adj.reason!, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 13)),
                    ],
                  ),
                  Text(
                    '${isPositive ? "+" : ""}${adj.birdsChanged} ${l10n.birds}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: isPositive ? WaanofiColors.primary : WaanofiColors.error),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
