import 'permission.dart';
import 'role_permissions.dart';

/// Authenticated user with role and farm context.
///
/// Created by [AuthRepository] after fetching the profile row.
class AppUser {
  const AppUser({
    required this.id,
    required this.role,
    required this.farmId,
    required this.fullName,
    required this.email,
  });

  final String id;
  final UserRole role;
  final String? farmId;
  final String fullName;
  final String email;

  /// Whether this user holds the given [permission].
  bool hasPermission(Permission permission) {
    final perms = rolePermissions[role];
    return perms != null && perms.contains(permission);
  }

  /// Whether this user holds ALL of the given [permissions].
  bool hasAllPermissions(Iterable<Permission> permissions) {
    return permissions.every(hasPermission);
  }

  /// Whether this user holds ANY of the given [permissions].
  bool hasAnyPermission(Iterable<Permission> permissions) {
    return permissions.any(hasPermission);
  }

  bool get isAdmin => role == UserRole.admin;
  bool get isWorker => role == UserRole.user;
  bool get isGuest => role == UserRole.guest;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          role == other.role &&
          farmId == other.farmId;

  @override
  int get hashCode => Object.hash(id, role, farmId);

  @override
  String toString() =>
      'AppUser(id: $id, role: $role, farmId: $farmId, name: $fullName)';
}
