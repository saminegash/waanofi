import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/auth/app_user.dart';
import '../../core/auth/role_permissions.dart';

/// Handles all Supabase auth operations and profile resolution.
class AuthRepository {
  AuthRepository({SupabaseClient? client})
      : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  // ───────────────── Session helpers ─────────────────

  /// Current Supabase session (null if not authenticated).
  Session? get currentSession => _client.auth.currentSession;

  /// Stream of auth state changes.
  Stream<AuthState> get onAuthStateChange =>
      _client.auth.onAuthStateChange;

  // ───────────────── Sign In ─────────────────

  /// Email + password sign-in.
  Future<AuthResponse> signInWithPassword({
    required String email,
    required String password,
  }) async {
    return _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Magic-link (passwordless) sign-in.
  Future<void> signInWithMagicLink({required String email}) async {
    await _client.auth.signInWithOtp(email: email);
  }

  // ───────────────── Sign Up ─────────────────

  /// Register a new user, create a farm, and assign the admin profile.
  ///
  /// Flow:
  /// 1. `auth.signUp` → triggers `handle_new_user()` which inserts
  ///    a profile row with role='user' and farm_id=null.
  /// 2. Calls `create_farm_and_admin()` RPC (SECURITY DEFINER)
  ///    which creates the farm and promotes the profile to admin.
  Future<AppUser> signUp({
    required String email,
    required String password,
    required String fullName,
    required String farmName,
  }) async {
    // 1. Create auth user (profile auto-created by DB trigger)
    final authResponse = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    final userId = authResponse.user?.id;
    if (userId == null) {
      throw const AuthException('Sign-up failed: no user ID returned.');
    }

    // 2. Create farm + promote to admin via SECURITY DEFINER RPC
    final result = await _client.rpc('create_farm_and_admin', params: {
      'farm_name': farmName,
      'full_name': fullName,
    });

    final farmId = result['farm_id'] as String;

    return AppUser(
      id: userId,
      role: UserRole.admin,
      farmId: farmId,
      fullName: fullName,
      email: email,
    );
  }

  // ───────────────── Sign Out ─────────────────

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // ───────────────── Profile Resolution ─────────────────

  /// Fetch the current user's profile and build an [AppUser].
  ///
  /// Returns `null` if there is no active session.
  Future<AppUser?> getCurrentAppUser() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;

    final profile = await _client
        .from('profiles')
        .select('full_name, role, farm_id')
        .eq('id', user.id)
        .maybeSingle();

    if (profile == null) return null;

    return AppUser(
      id: user.id,
      role: _parseRole(profile['role'] as String?),
      farmId: profile['farm_id'] as String?,
      fullName: profile['full_name'] as String? ?? '',
      email: user.email ?? '',
    );
  }

  /// Parse the Postgres `user_role` enum string into [UserRole].
  UserRole _parseRole(String? raw) {
    switch (raw) {
      case 'admin':
        return UserRole.admin;
      case 'user':
        return UserRole.user;
      case 'guest':
        return UserRole.guest;
      default:
        return UserRole.guest;
    }
  }
}
