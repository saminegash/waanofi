import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';
import '../data/flock_repository.dart';
import '../data/egg_production_repository.dart';
import '../domain/flock_model.dart';
import '../domain/egg_production_record_model.dart';

class PoultryReportsPage extends ConsumerWidget {
  const PoultryReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final flocksStream = ref.watch(flockRepositoryProvider).watchFlocks();
    final eggsStream = ref.watch(eggProductionRepositoryProvider).watchRecords();

    return Scaffold(
      backgroundColor: WaanofiColors.background,
      appBar: AppBar(
        title: Text(l10n.poultryReports),
        backgroundColor: WaanofiColors.surface,
      ),
      body: StreamBuilder<List<FlockModel>>(
        stream: flocksStream,
        builder: (context, flockSnap) {
          final flocks = flockSnap.data ?? [];
          final totalHens = flocks.fold<int>(0, (sum, f) => sum + f.numberOfLayingHens);

          return StreamBuilder<List<EggProductionRecordModel>>(
            stream: eggsStream,
            builder: (context, eggSnap) {
              final allRecords = eggSnap.data ?? [];
              final now = DateTime.now();
              final cutoff7d = now.subtract(const Duration(days: 7));
              final cutoff30d = now.subtract(const Duration(days: 30));

              final records7d = allRecords.where((r) => r.productionDate.isAfter(cutoff7d)).toList();
              final records30d = allRecords.where((r) => r.productionDate.isAfter(cutoff30d)).toList();

              final total7dGood = records7d.fold<int>(0, (sum, r) => sum + r.goodEggs);
              final total30dGood = records30d.fold<int>(0, (sum, r) => sum + r.goodEggs);
              final total30dRejected = records30d.fold<int>(0, (sum, r) => sum + (r.crackedEggs + r.rejectedEggs));
              final total30dAvailable = records30d.fold<int>(0, (sum, r) => sum + r.availableEggs);
              
              final trays30d = total30dAvailable ~/ 30;
              final loose30d = total30dAvailable % 30;

              double ratePerHen30d = 0;
              if (totalHens > 0) {
                ratePerHen30d = (total30dGood / (totalHens * 30)) * 100;
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.productionSummary, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: WaanofiColors.textPrimary)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildReportCard(l10n.sevenDayOutput, '$total7dGood', l10n.goodEggs, Icons.trending_up, WaanofiColors.primary)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildReportCard(l10n.thirtyDayOutput, '$total30dGood', '$trays30d ${l10n.trays} ($loose30d ${l10n.loose})', Icons.calendar_today, WaanofiColors.secondary)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _buildReportCard(l10n.productionPerHen, '${ratePerHen30d.toStringAsFixed(1)}%', l10n.thirtyDayAverage, Icons.pets, WaanofiColors.primaryLight)),
                        const SizedBox(width: 12),
                        Expanded(child: _buildReportCard(l10n.rejectedOrCracked, '$total30dRejected', l10n.lastThirtyDays, Icons.warning_amber, WaanofiColors.warning)),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildReportCard(String title, String value, String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WaanofiColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: WaanofiColors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary, fontSize: 13)),
          Text(subtitle, style: const TextStyle(color: WaanofiColors.textSecondary, fontSize: 12)),
        ],
      ),
    );
  }
}
