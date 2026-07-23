import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../auth/auth_providers.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/signup_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/animals/presentation/animals_list_page.dart';
import '../../features/animals/presentation/animal_detail_page.dart';
import '../../features/animals/presentation/animal_form_page.dart';

/// Routes that require admin privileges.
const _adminRoutes = {'/admin', '/admin/users', '/admin/finance'};

/// Routes that guests are NOT allowed to access (everything except read-only).
const _guestBlockedRoutes = {'/record', '/admin', '/admin/users', '/admin/finance', '/animals/new'};

/// Application router with auth + role-based guards.
///
/// - Unauthenticated → `/login`
/// - Authenticated + no farm → `/signup` (shouldn't happen normally)
/// - Guest hitting an admin/write route → `/`
/// - Admin route without admin role → `/`
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authStateProvider);
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final location = state.matchedLocation;

      // Auth pages
      final isAuthRoute = location == '/login' || location == '/signup';

      // Not logged in → send to login (unless already there)
      if (!isLoggedIn && !isAuthRoute) return '/login';

      // Logged in but on auth page → send to home
      if (isLoggedIn && isAuthRoute) return '/';

      // Role-based guards (only when we have a resolved user)
      final appUser = authState.valueOrNull;
      if (appUser != null) {
        // Guest blocked from write/admin routes
        // Check if route starts with blocked patterns or exact matches
        final isGuestBlocked = _guestBlockedRoutes.any((route) => 
            location == route || (location.startsWith('$route/') && route.length > 1) || location.endsWith('/edit'));
            
        if (appUser.isGuest && isGuestBlocked) {
          return '/';
        }

        // Non-admin blocked from admin routes
        if (!appUser.isAdmin && _adminRoutes.contains(location)) {
          return '/';
        }
      }

      return null; // no redirect
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/animals',
        name: 'animals',
        builder: (context, state) => const AnimalsListPage(),
        routes: [
          GoRoute(
            path: 'new',
            name: 'animal_new',
            builder: (context, state) => const AnimalFormPage(),
          ),
          GoRoute(
            path: ':id',
            name: 'animal_detail',
            builder: (context, state) => AnimalDetailPage(animalId: state.pathParameters['id']!),
          ),
          GoRoute(
            path: ':id/edit',
            name: 'animal_edit',
            builder: (context, state) => AnimalFormPage(animalId: state.pathParameters['id']),
          ),
        ],
      ),
    ],
  );
}

/// Provider for the GoRouter instance.
///
/// Using a provider lets the router react to auth state changes.
final appRouterProvider = Provider<GoRouter>((ref) {
  return appRouter(ref);
});
