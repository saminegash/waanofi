import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';

/// Placeholder home screen shown after successful authentication.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Waanofi Dairy'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.agriculture_rounded,
              size: 80,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome to Waanofi Dairy',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Your dairy management dashboard',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.pets),
              label: const Text('Manage Herd'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () => context.go('/animals'),
            ),
          ],
        ),
      ),
    );
  }
}
