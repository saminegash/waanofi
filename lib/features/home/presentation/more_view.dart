import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth/permission.dart';
import '../../../shared/widgets/role_guard.dart';

class MoreView extends ConsumerWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings & More')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Admin Tools', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          RoleGuard(
            permission: Permission.manageUsers,
            fallback: const SizedBox.shrink(),
            child: ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Manage Workers'),
              onTap: () => context.push('/admin/users'),
            ),
          ),
          RoleGuard(
            permission: Permission.manageAnimals,
            fallback: const SizedBox.shrink(),
            child: ListTile(
              leading: const Icon(Icons.grass),
              title: const Text('Manage Feed Types'),
              onTap: () => context.push('/admin/feed_types'),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
