import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/auth/permission.dart';
import '../../../core/theme/waanofi_colors.dart';
import '../../../shared/widgets/role_guard.dart';
import 'controllers/dashboard_controller.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
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
                        'Today\'s Milk',
                        '${stats.todayMilkLitres.toStringAsFixed(1)} L',
                        Icons.water_drop,
                        Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: RoleGuard(
                        permission: Permission.manageFinance,
                        fallback: _buildKpiCard(
                          '30D Trend',
                          '${stats.trend.fold(0.0, (sum, t) => sum + t.litres).toStringAsFixed(0)} L',
                          Icons.trending_up,
                          WaanofiColors.primary,
                        ),
                        child: _buildKpiCard(
                          '30D Profit',
                          '\$${(stats.milkRevenue30d - stats.feedCost30d).toStringAsFixed(2)}',
                          Icons.attach_money,
                          (stats.milkRevenue30d - stats.feedCost30d) >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Chart: 30 Day Milk Trend
                const Text('30 Day Milk Trend', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 250,
                  child: stats.trend.isEmpty
                      ? const Center(child: Text('No data for the last 30 days'))
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
                  permission: Permission.manageFinance,
                  fallback: const SizedBox.shrink(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Financial Overview (30 Days)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Text('Revenue', style: TextStyle(color: Colors.grey)),
                                Text('\$${stats.milkRevenue30d.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Container(width: 1, height: 40, color: Colors.grey.shade300),
                            Column(
                              children: [
                                const Text('Feed Cost', style: TextStyle(color: Colors.grey)),
                                Text('\$${stats.feedCost30d.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold)),
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
                const Text('Herd Status', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: stats.statusCounts.map((s) {
                    return Chip(
                      label: Text('${s.count} ${s.status}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: s.status == 'active' ? Colors.green.shade100 : Colors.grey.shade200,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 32),

                // Top Producers
                const Text('Top Producers (30 Days)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                if (stats.topProducers.isEmpty)
                  const Text('No records')
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Failed to load dashboard: $e')),
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
          Text(title, style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
