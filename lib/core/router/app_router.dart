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
import '../../features/admin/presentation/farm_settings_page.dart';
import '../../features/reports/presentation/reports_page.dart';
import '../../features/home/presentation/more_view.dart';

import '../../features/onboarding/presentation/splash_page.dart';
import '../../features/onboarding/presentation/onboarding_page.dart';
import '../../features/sync/presentation/sync_status_page.dart';


// Marketplace imports
import '../../features/eggs/presentation/daily_egg_entry_page.dart';
import '../../features/marketplace/presentation/marketplace_browse_page.dart';
import '../../features/marketplace/presentation/listing_detail_page.dart';
import '../../features/marketplace/presentation/checkout_page.dart';
import '../../features/marketplace/presentation/my_orders_page.dart';
import '../../features/marketplace/presentation/seller_orders_page.dart';
import '../../features/marketplace/domain/marketplace_listing_model.dart';

// Poultry & Egg Management imports
import '../../features/poultry/presentation/poultry_dashboard_page.dart';
import '../../features/poultry/presentation/flocks_list_page.dart';
import '../../features/poultry/presentation/flock_form_page.dart';
import '../../features/poultry/presentation/flock_detail_page.dart';
import '../../features/poultry/presentation/flock_adjustment_form_page.dart';
import '../../features/poultry/presentation/daily_egg_production_form_page.dart';
import '../../features/poultry/presentation/poultry_reports_page.dart';
import '../../features/poultry/domain/flock_model.dart';


// Navigation keys for each tab branch
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _dashboardKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final _herdKey = GlobalKey<NavigatorState>(debugLabel: 'herd');
final _marketplaceKey = GlobalKey<NavigatorState>(debugLabel: 'marketplace');
final _reportsKey = GlobalKey<NavigatorState>(debugLabel: 'reports');
final _moreKey = GlobalKey<NavigatorState>(debugLabel: 'more');

/// Routes that require admin privileges.
const _adminRoutes = {'/admin', '/more/admin/users', '/admin/finance', '/more/admin/feed_types', '/more/admin/farm_settings', '/more/admin/seller_orders'};

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
      GoRoute(
        path: '/record/eggs',
        name: 'record_eggs',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const DailyEggEntryPage(),
      ),

      // ── Marketplace overlay pages ──
      GoRoute(
        path: '/marketplace/checkout',
        name: 'marketplace_checkout',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final listing = state.extra as MarketplaceListingModel;
          return CheckoutPage(listing: listing);
        },
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

          // Tab 2: Marketplace
          StatefulShellBranch(
            navigatorKey: _marketplaceKey,
            routes: [
              GoRoute(
                path: '/marketplace',
                name: 'marketplace',
                builder: (context, state) => const MarketplaceBrowsePage(),
                routes: [
                  GoRoute(
                    path: 'orders',
                    name: 'my_orders',
                    builder: (context, state) => const MyOrdersPage(),
                  ),
                  GoRoute(
                    path: ':id',
                    name: 'listing_detail',
                    builder: (context, state) => ListingDetailPage(listingId: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),

          // Tab 3: Reports
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

          // Tab 4: More / Settings
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
                  GoRoute(
                    path: 'admin/farm_settings',
                    name: 'farm_settings',
                    builder: (context, state) => const FarmSettingsPage(),
                  ),
                  GoRoute(
                    path: 'admin/seller_orders',
                    name: 'seller_orders',
                    builder: (context, state) => const SellerOrdersPage(),
                  ),
                  GoRoute(
                    path: 'sync_status',
                    name: 'sync_status',
                    builder: (context, state) => const SyncStatusPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/poultry',
        name: 'poultry_dashboard',
        builder: (context, state) => const PoultryDashboardPage(),
      ),
      GoRoute(
        path: '/poultry/flocks',
        name: 'flocks_list',
        builder: (context, state) => const FlocksListPage(),
      ),
      GoRoute(
        path: '/poultry/flocks/add',
        name: 'add_flock',
        builder: (context, state) => const FlockFormPage(),
      ),
      GoRoute(
        path: '/poultry/flocks/detail/:id',
        name: 'flock_detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final flock = state.extra as FlockModel?;
          return FlockDetailPage(flockId: id, initialFlock: flock);
        },
      ),
      GoRoute(
        path: '/poultry/flocks/:id/adjust',
        name: 'flock_adjust',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final flock = state.extra as FlockModel?;
          return FlockAdjustmentFormPage(flockId: id, flock: flock);
        },
      ),
      GoRoute(
        path: '/poultry/record_egg',
        name: 'record_egg',
        builder: (context, state) => const DailyEggProductionFormPage(),
      ),
      GoRoute(
        path: '/poultry/reports',
        name: 'poultry_reports',
        builder: (context, state) => const PoultryReportsPage(),
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
