import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../auth/app_user.dart';
import '../../data/repositories/auth_repository.dart';
import '../providers/database_provider.dart';
import '../sync/sync_coordinator.dart';

/// Singleton [AuthRepository] provider.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final sync = ref.watch(syncCoordinatorProvider);
  return AuthRepository(
    database: db,
    syncCoordinator: sync,
  );
});


/// Exposes the current [AppUser] (or null) reactively.
///
/// Listens to Supabase auth state changes and re-fetches the profile
/// whenever the session changes (login, logout, token refresh).
final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AsyncValue<AppUser?>>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(repo);
});

/// Notifier that keeps [AppUser] in sync with Supabase auth state.
class AuthStateNotifier extends StateNotifier<AsyncValue<AppUser?>> {
  AuthStateNotifier(this._repo) : super(const AsyncValue.loading()) {
    _init();
  }

  final AuthRepository _repo;
  StreamSubscription<AuthState>? _sub;

  Future<void> _init() async {
    // Fetch current user on startup
    await _refreshUser();

    // Listen for auth changes
    _sub = _repo.onAuthStateChange.listen((authState) {
      _refreshUser();
    });
  }

  Future<void> _refreshUser() async {
    try {
      final appUser = await _repo.getCurrentAppUser();
      if (mounted) {
        state = AsyncValue.data(appUser);
      }
    } catch (e, st) {
      if (mounted) {
        state = AsyncValue.error(e, st);
      }
    }
  }

  /// Force-refresh (e.g. after profile update).
  Future<void> refresh() => _refreshUser();

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

/// Convenience provider that unwraps the [AppUser] (nullable).
final currentUserProvider = Provider<AppUser?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

/// Whether the user is authenticated.
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(currentUserProvider) != null;
});
