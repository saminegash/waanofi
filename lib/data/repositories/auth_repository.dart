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
    await _client.auth.signInWithOtp(
      email: email,
      emailRedirectTo: 'io.supabase.waanofi://login-callback/',
    );
  }

  // ───────────────── Sign Up ─────────────────

  /// Register a new user, create a farm, and assign the admin profile.
  ///
  /// Flow:
  /// `auth.signUp` → passes `farm_name` in metadata.
  /// The database trigger `handle_new_user()` atomically creates the profile,
  /// creates the farm, and promotes the profile to admin.
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String farmName,
  }) async {
    final authResponse = await _client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: 'io.supabase.waanofi://login-callback/',
      data: {
        'full_name': fullName,
        'farm_name': farmName,
      },
    );

    if (authResponse.user?.id == null) {
      throw const AuthException('Sign-up failed: no user ID returned.');
    }
  }

  /// Create a worker account under the current admin's farm.
  /// Bypasses email confirmation using a Supabase Edge Function.
  Future<void> createWorker({
    required String email,
    required String password,
    required String fullName,
    String role = 'user',
  }) async {
    final session = currentSession;
    if (session == null) throw const AuthException('Not authenticated');

    final response = await _client.functions.invoke(
      'create_worker',
      body: {
        'email': email,
        'password': password,
        'full_name': fullName,
        'role': role,
      },
    );

    if (response.status != 200) {
      throw AuthException(
          'Failed to create worker: ${response.data['error'] ?? response.data}');
    }
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
