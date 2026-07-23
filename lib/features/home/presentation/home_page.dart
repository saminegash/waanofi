import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.water_drop, color: Colors.blue),
              title: const Text('Record Milk'),
              onTap: () {
                Navigator.pop(context);
                context.push('/record/milk');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grass, color: Colors.green),
              title: const Text('Record Feed'),
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
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onRecordAction(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets), label: 'Herd'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Reports'),
          NavigationDestination(icon: Icon(Icons.menu_outlined), selectedIcon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }
}
