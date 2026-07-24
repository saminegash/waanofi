import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import '../../../shared/widgets/skeleton_loader.dart';
import 'package:waanofi/l10n/app_localizations.dart';
import 'controllers/dashboard_controller.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dashboard),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(dashboardControllerProvider.notifier).refresh(),
          ),
        ],
      ),
      body: state.when(
        data: (stats) => RefreshIndicator(
          onRefresh: () => ref.read(dashboardControllerProvider.notifier).refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KPI Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildKpiCard(
                        l10n.todaysMilk,
                        '${stats.todayMilkLitres.toStringAsFixed(1)} L',
                        Icons.water_drop,
                        WaanofiColors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: RoleGuard(
                        permission: Permission.viewFinance,
                        fallback: _buildKpiCard(
                          l10n.thirtyDayTrend,
                          '${stats.trend.fold(0.0, (sum, t) => sum + t.litres).toStringAsFixed(0)} L',
                          Icons.trending_up,
                          WaanofiColors.primary,
                        ),
                        child: _buildKpiCard(
                          l10n.thirtyDayProfit,
                          '\$${(stats.milkRevenue30d - stats.feedCost30d).toStringAsFixed(2)}',
                          Icons.attach_money,
                          (stats.milkRevenue30d - stats.feedCost30d) >= 0 ? WaanofiColors.success : WaanofiColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Chart: 30 Day Milk Trend
                Text(l10n.thirtyDayMilkTrend, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  child: stats.trend.isEmpty
                      ? Center(child: Text(l10n.noDataThirtyDays))
                      : LineChart(
                          LineChartData(
                            gridData: const FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    if (value.toInt() < 0 || value.toInt() >= stats.trend.length) {
                                      return const SizedBox();
                                    }
                                    if (value.toInt() % 7 != 0) return const SizedBox();
                                    final date = stats.trend[value.toInt()].date;
                                    return Text(DateFormat('MM/dd').format(date), style: const TextStyle(fontSize: 10));
                                  },
                                ),
                              ),
                              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: stats.trend.asMap().entries.map((e) {
                                  return FlSpot(e.key.toDouble(), e.value.litres);
                                }).toList(),
                                isCurved: true,
                                color: WaanofiColors.primary,
                                barWidth: 3,
                                isStrokeCapRound: true,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: WaanofiColors.primary.withOpacity(0.2),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                const SizedBox(height: 32),

                // Finance (Admin Only)
                RoleGuard(
                  permission: Permission.viewFinance,
                  fallback: const SizedBox.shrink(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.financialOverview, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: WaanofiColors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: WaanofiColors.outline),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(l10n.revenue, style: const TextStyle(color: WaanofiColors.textSecondary)),
                                Text('\$${stats.milkRevenue30d.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: WaanofiColors.success, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Container(width: 1, height: 40, color: WaanofiColors.outlineDark),
                            Column(
                              children: [
                                Text(l10n.feedCost, style: const TextStyle(color: WaanofiColors.textSecondary)),
                                Text('\$${stats.feedCost30d.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: WaanofiColors.error, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),

                // Status Counts
                Text(l10n.herdStatus, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: stats.statusCounts.map((s) {
                    return Chip(
                      label: Text('${s.count} ${s.status}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: s.status == 'active' ? WaanofiColors.success.withOpacity(0.1) : WaanofiColors.outline,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),

                // Top Producers
                Text(l10n.topProducers, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (stats.topProducers.isEmpty)
                  Text(l10n.noRecords)
                else
                  ...stats.topProducers.map((p) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const CircleAvatar(child: Icon(Icons.star, color: Colors.amber)),
                    title: Text('${p.tagNumber} ${p.name ?? ""}'),
                    trailing: Text('${p.totalLitres.toStringAsFixed(1)} L', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  )),
              ],
            ),
          ),
        ),
        loading: () => _buildDashboardSkeleton(),
        error: (e, _) => Center(child: Text('${l10n.failedToLoadDashboard}: $e')),
      ),
    );
  }

  Widget _buildDashboardSkeleton() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(child: SkeletonLoader(height: 120, borderRadius: 16)),
              SizedBox(width: 16),
              Expanded(child: SkeletonLoader(height: 120, borderRadius: 16)),
            ],
          ),
          const SizedBox(height: 24),
          const SkeletonLoader(width: 200, height: 24),
          const SizedBox(height: 16),
          const SkeletonLoader(height: 250, borderRadius: 16),
          const SizedBox(height: 32),
          const SkeletonLoader(width: 200, height: 24),
          const SizedBox(height: 16),
          const SkeletonLoader(height: 80, borderRadius: 12),
        ],
      ),
    );
  }

  Widget _buildKpiCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 12),
          Text(title, style: TextStyle(color: WaanofiColors.textSecondary, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
