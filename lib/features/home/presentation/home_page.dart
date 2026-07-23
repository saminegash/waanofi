import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../analytics/presentation/dashboard_view.dart';
import '../../animals/presentation/animals_list_page.dart';
import '../../reports/presentation/reports_page.dart';
import 'more_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const DashboardView(),
    const AnimalsListPage(),
    const ReportsPage(),
    const MoreView(),
  ];

  void _onRecordAction(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.water_drop, color: WaanofiColors.primary),
              title: Text(l10n.recordMilk),
              onTap: () {
                Navigator.pop(context);
                context.push('/record/milk');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grass, color: WaanofiColors.success),
              title: Text(l10n.recordFeed),
              onTap: () {
                Navigator.pop(context);
                context.push('/record/feed');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 600;
    final l10n = AppLocalizations.of(context)!;

    final body = IndexedStack(
      index: _currentIndex,
      children: _views,
    );

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _currentIndex,
              onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 8.0),
                child: FloatingActionButton(
                  heroTag: null,
                  elevation: 0,
                  onPressed: () => _onRecordAction(context),
                  child: const Icon(Icons.add),
                ),
              ),
              destinations: [
                NavigationRailDestination(icon: const Icon(Icons.dashboard_outlined), selectedIcon: const Icon(Icons.dashboard), label: Text(l10n.dashboard)),
                NavigationRailDestination(icon: const Icon(Icons.pets_outlined), selectedIcon: const Icon(Icons.pets), label: Text(l10n.herd)),
                NavigationRailDestination(icon: const Icon(Icons.bar_chart_outlined), selectedIcon: const Icon(Icons.bar_chart), label: Text(l10n.reports)),
                NavigationRailDestination(icon: const Icon(Icons.menu_outlined), selectedIcon: const Icon(Icons.menu), label: Text(l10n.more)),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: body),
          ],
        ),
      );
    }

    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => _onRecordAction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.dashboard_outlined), selectedIcon: const Icon(Icons.dashboard), label: l10n.dashboard),
          NavigationDestination(icon: const Icon(Icons.pets_outlined), selectedIcon: const Icon(Icons.pets), label: l10n.herd),
          NavigationDestination(icon: const Icon(Icons.bar_chart_outlined), selectedIcon: const Icon(Icons.bar_chart), label: l10n.reports),
          NavigationDestination(icon: const Icon(Icons.menu_outlined), selectedIcon: const Icon(Icons.menu), label: l10n.more),
        ],
      ),
    );
  }
}
