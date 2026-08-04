import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/theme/waanofi_colors.dart';

/// Persistent shell that wraps the tabbed content and provides
/// a NavigationBar (mobile) or NavigationRail (tablet/web).
class MainShell extends ConsumerWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onRecordAction(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.water_drop, color: WaanofiColors.primary),
              title: Text(l10n.recordMilk),
              onTap: () {
                Navigator.pop(ctx);
                context.push('/record/milk');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grass, color: WaanofiColors.success),
              title: Text(l10n.recordFeed),
              onTap: () {
                Navigator.pop(ctx);
                context.push('/record/feed');
              },
            ),
            ListTile(
              leading: const Icon(Icons.egg, color: WaanofiColors.secondary),
              title: Text(l10n.recordEggs),
              onTap: () {
                Navigator.pop(ctx);
                context.push('/record/eggs');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 600;
    final l10n = AppLocalizations.of(context)!;

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (idx) => navigationShell.goBranch(
                idx,
                initialLocation: idx == navigationShell.currentIndex,
              ),
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
                NavigationRailDestination(icon: const Icon(Icons.storefront_outlined), selectedIcon: const Icon(Icons.storefront), label: Text(l10n.marketplace)),
                NavigationRailDestination(icon: const Icon(Icons.bar_chart_outlined), selectedIcon: const Icon(Icons.bar_chart), label: Text(l10n.reports)),
                NavigationRailDestination(icon: const Icon(Icons.menu_outlined), selectedIcon: const Icon(Icons.menu), label: Text(l10n.more)),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => _onRecordAction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (idx) => navigationShell.goBranch(
          idx,
          initialLocation: idx == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.dashboard_outlined), selectedIcon: const Icon(Icons.dashboard), label: l10n.dashboard),
          NavigationDestination(icon: const Icon(Icons.pets_outlined), selectedIcon: const Icon(Icons.pets), label: l10n.herd),
          NavigationDestination(icon: const Icon(Icons.storefront_outlined), selectedIcon: const Icon(Icons.storefront), label: l10n.marketplace),
          NavigationDestination(icon: const Icon(Icons.bar_chart_outlined), selectedIcon: const Icon(Icons.bar_chart), label: l10n.reports),
          NavigationDestination(icon: const Icon(Icons.menu_outlined), selectedIcon: const Icon(Icons.menu), label: l10n.more),
        ],
      ),
    );
  }
}
