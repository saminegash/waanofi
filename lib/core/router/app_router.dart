import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../auth/auth_providers.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/signup_page.dart';
import '../../features/home/presentation/main_shell.dart';
import '../../features/analytics/presentation/dashboard_view.dart';
import '../../features/animals/presentation/animals_list_page.dart';
import '../../features/animals/presentation/animal_detail_page.dart';
import '../../features/animals/presentation/animal_form_page.dart';
import '../../features/milk/presentation/daily_milk_entry_page.dart';
import '../../features/admin/presentation/manage_users_page.dart';
import '../../features/feed/presentation/daily_feed_entry_page.dart';
import '../../features/feed/presentation/manage_feed_types_page.dart';
import '../../features/reports/presentation/reports_page.dart';
import '../../features/home/presentation/more_view.dart';

import '../../features/onboarding/presentation/splash_page.dart';
import '../../features/onboarding/presentation/onboarding_page.dart';

// Navigation keys for each tab branch
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _dashboardKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final _herdKey = GlobalKey<NavigatorState>(debugLabel: 'herd');
final _reportsKey = GlobalKey<NavigatorState>(debugLabel: 'reports');
final _moreKey = GlobalKey<NavigatorState>(debugLabel: 'more');

/// Routes that require admin privileges.
const _adminRoutes = {'/admin', '/more/admin/users', '/admin/finance', '/more/admin/feed_types'};

/// Routes that guests are NOT allowed to access (everything except read-only).
const _guestBlockedRoutes = {'/record', '/admin', '/more/admin/users', '/admin/finance', '/animals/new'};

/// Application router with auth + role-based guards.
GoRouter appRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authStateProvider);
      final session = Supabase.instance.client.auth.currentSession;
      final isLoggedIn = session != null;
      final location = state.matchedLocation;

      // Allow splash and onboarding to handle themselves
      if (location == '/splash' || location == '/onboarding') return null;

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
      // ── Pre-auth routes (full-screen, no shell) ──
      GoRoute(
        path: '/splash',
        name: 'splash',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SignUpPage(),
      ),

      // ── Record pages (full-screen overlays, pushed over the shell) ──
      GoRoute(
        path: '/record/milk',
        name: 'record_milk',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DailyMilkEntryPage(),
      ),
      GoRoute(
        path: '/record/feed',
        name: 'record_feed',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DailyFeedEntryPage(),
      ),

      // ── Main shell with bottom navigation ──
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          // Tab 0: Dashboard
          StatefulShellBranch(
            navigatorKey: _dashboardKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const DashboardView(),
              ),
            ],
          ),

          // Tab 1: Herd
          StatefulShellBranch(
            navigatorKey: _herdKey,
            routes: [
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
          ),

          // Tab 2: Reports
          StatefulShellBranch(
            navigatorKey: _reportsKey,
            routes: [
              GoRoute(
                path: '/reports',
                name: 'reports',
                builder: (context, state) => const ReportsPage(),
              ),
            ],
          ),

          // Tab 3: More / Settings
          StatefulShellBranch(
            navigatorKey: _moreKey,
            routes: [
              GoRoute(
                path: '/more',
                name: 'more',
                builder: (context, state) => const MoreView(),
                routes: [
                  GoRoute(
                    path: 'admin/users',
                    name: 'manage_users',
                    builder: (context, state) => const ManageUsersPage(),
                  ),
                  GoRoute(
                    path: 'admin/feed_types',
                    name: 'manage_feed_types',
                    builder: (context, state) => const ManageFeedTypesPage(),
                  ),
                ],
              ),
            ],
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
