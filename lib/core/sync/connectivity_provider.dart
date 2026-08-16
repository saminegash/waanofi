import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider to monitor if the device is currently offline.
/// Defaults to false (online) until connectivity status is verified.
final isOfflineProvider = StateProvider<bool>((ref) => false);

/// Stream provider that listens to connectivity changes and updates [isOfflineProvider].
final connectivityMonitorProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  final connectivity = Connectivity();
  return connectivity.onConnectivityChanged.map((results) {
    final offline = results.isEmpty || results.every((r) => r == ConnectivityResult.none);
    ref.read(isOfflineProvider.notifier).state = offline;
    return results;
  });
});
