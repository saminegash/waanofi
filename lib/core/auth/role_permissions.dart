import 'permission.dart';

/// The three application-level roles, mirroring the `user_role` Postgres enum.
enum UserRole {
  admin,
  user, // "worker"
  guest,
}

/// Single source of truth mapping each [UserRole] to its allowed [Permission]s.
///
/// To change what a role can do, edit this map — everything else
/// ([RoleGuard], [hasPermission], router redirects) derives from it.
const Map<UserRole, Set<Permission>> rolePermissions = {
  UserRole.admin: {
    Permission.viewMilk,
    Permission.recordMilk,
    Permission.editMilk,
    Permission.viewFeed,
    Permission.recordFeed,
    Permission.manageAnimals,
    Permission.manageUsers,
    Permission.viewFinance,
    Permission.exportData,
  },
  UserRole.user: {
    Permission.viewMilk,
    Permission.recordMilk,
    Permission.editMilk, // own records within 24 h (enforced by RLS)
    Permission.viewFeed,
    Permission.recordFeed,
    // NO: manageAnimals, manageUsers, viewFinance, exportData
  },
  UserRole.guest: {
    Permission.viewMilk, // aggregates only (enforced by RLS view)
    // NO writes at all
  },
};
