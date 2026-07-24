import 'package:waanofi/core/theme/waanofi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:waanofi/l10n/app_localizations.dart';

import '../../../core/auth/permission.dart';
import '../../../core/providers/locale_provider.dart';
import '../../../shared/widgets/role_guard.dart';

class MoreView extends ConsumerWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.adminTools, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary)),
          ),
          RoleGuard(
            permission: Permission.manageUsers,
            fallback: const SizedBox.shrink(),
            child: ListTile(
              leading: const Icon(Icons.people),
              title: Text(l10n.manageWorkers),
              onTap: () => context.push('/more/admin/users'),
            ),
          ),
          RoleGuard(
            permission: Permission.manageAnimals,
            fallback: const SizedBox.shrink(),
            child: ListTile(
              leading: const Icon(Icons.grass),
              title: Text(l10n.manageFeedTypes),
              onTap: () => context.push('/more/admin/feed_types'),
            ),
          ),
          RoleGuard(
            permission: Permission.viewFinance,
            fallback: const SizedBox.shrink(),
            child: ListTile(
              leading: const Icon(Icons.monetization_on),
              title: Text(l10n.farmSettings),
              onTap: () => context.push('/more/admin/farm_settings'),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.preferences, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary)),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.language),
            trailing: DropdownButton<String>(
              value: locale.languageCode,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'am', child: Text('አማርኛ')),
                DropdownMenuItem(value: 'om', child: Text('Afaan Oromoo')),
              ],
              onChanged: (val) {
                if (val != null) {
                  ref.read(localeControllerProvider.notifier).setLocale(Locale(val));
                }
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(l10n.account, style: const TextStyle(fontWeight: FontWeight.bold, color: WaanofiColors.textSecondary)),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: WaanofiColors.error),
            title: Text(l10n.logout, style: const TextStyle(color: WaanofiColors.error)),
            onTap: () async {
              await Supabase.instance.client.auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
