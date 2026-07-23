import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

class ResponsiveScaffold extends ConsumerStatefulWidget {
  final Widget child;
  const ResponsiveScaffold({super.key, required this.child});

  @override
  ConsumerState<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends ConsumerState<ResponsiveScaffold> {
  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/animals')) return 1;
    if (location.startsWith('/reports')) return 2;
    if (location.startsWith('/admin') || location == '/more') return 3;
    return 0; // dashboard
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/animals');
        break;
      case 2:
        context.go('/reports');
        break;
      case 3:
        context.go('/admin/users'); // Or a generic more page
        break;
    }
  }

  void _onRecordAction(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.water_drop, color: Colors.blue),
              title: Text(l10n.recordMilk),
              onTap: () {
                Navigator.pop(context);
                context.push('/record/milk');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grass, color: Colors.green),
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
    final selectedIndex = _getSelectedIndex(context);
    final l10n = AppLocalizations.of(context)!;

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (idx) => _onItemTapped(idx, context),
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
                NavigationRailDestination(
                  icon: const Icon(Icons.dashboard_outlined),
                  selectedIcon: const Icon(Icons.dashboard),
                  label: Text(l10n.dashboard),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.pets_outlined),
                  selectedIcon: const Icon(Icons.pets),
                  label: Text(l10n.herd),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.bar_chart_outlined),
                  selectedIcon: const Icon(Icons.bar_chart),
                  label: Text(l10n.reports),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.menu_outlined),
                  selectedIcon: const Icon(Icons.menu),
                  label: Text(l10n.more),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: widget.child),
          ],
        ),
      );
    }

    // Mobile
    return Scaffold(
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => _onRecordAction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (idx) => _onItemTapped(idx, context),
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
