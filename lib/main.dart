import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/waanofi_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    publishableKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(
    const ProviderScope(
      child: WaanofiApp(),
    ),
  );
}

/// Root widget for the Waanofi Dairy application.
///
/// Uses [MaterialApp.router] with the Riverpod-provided [GoRouter]
/// (which includes auth + role-based guards) and applies the
/// WaanofiTheme light/dark variants.
class WaanofiApp extends ConsumerWidget {
  const WaanofiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Waanofi Dairy',
      debugShowCheckedModeBanner: false,
      theme: WaanofiTheme.light,
      darkTheme: WaanofiTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
