import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/auth_providers.dart';
import '../../core/auth/permission.dart';

/// Guards a widget tree behind one or more [Permission]s.
///
/// Shows [fallback] (defaults to "Access denied") when the user lacks
/// the required permission(s).
///
/// ```dart
/// RoleGuard(
///   permission: Permission.manageAnimals,
///   child: AnimalListPage(),
/// )
/// ```
class RoleGuard extends ConsumerWidget {
  const RoleGuard({
    super.key,
    this.permission,
    this.permissions,
    this.requireAll = true,
    this.fallback,
    required this.child,
  }) : assert(
          permission != null || permissions != null,
          'Provide either permission or permissions',
        );

  /// Single permission to check.
  final Permission? permission;

  /// Multiple permissions to check.
  final List<Permission>? permissions;

  /// If true (default), user must hold ALL [permissions].
  /// If false, user must hold ANY of [permissions].
  final bool requireAll;

  /// Widget shown when access is denied.
  final Widget? fallback;

  /// Widget shown when access is granted.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return fallback ?? const _AccessDenied();
    }

    final bool allowed;
    if (permission != null) {
      allowed = user.hasPermission(permission!);
    } else if (requireAll) {
      allowed = user.hasAllPermissions(permissions!);
    } else {
      allowed = user.hasAnyPermission(permissions!);
    }

    if (!allowed) {
      return fallback ?? const _AccessDenied();
    }

    return child;
  }
}

class _AccessDenied extends StatelessWidget {
  const _AccessDenied();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Access Denied')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'You don\'t have permission to view this page.',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
