import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/animals_repository.dart';
import '../../domain/animal_model.dart';

final networkStatusProvider = StreamProvider<bool>((ref) {
  return Connectivity().onConnectivityChanged.map((results) {
    return !results.contains(ConnectivityResult.none);
  });
});

class AnimalsState {
  const AnimalsState({
    this.searchQuery = '',
    this.statusFilter,
    this.breedFilter,
  });

  final String searchQuery;
  final String? statusFilter;
  final String? breedFilter;

  AnimalsState copyWith({
    String? searchQuery,
    String? statusFilter,
    String? breedFilter,
  }) {
    return AnimalsState(
      searchQuery: searchQuery ?? this.searchQuery,
      statusFilter: statusFilter, // Allow nulls
      breedFilter: breedFilter,     // Allow nulls
    );
  }
}

final animalsStateProvider = StateProvider<AnimalsState>((ref) => const AnimalsState());

final animalsControllerProvider =
    StreamNotifierProvider<AnimalsController, List<AnimalModel>>(() {
  return AnimalsController();
});

class AnimalsController extends StreamNotifier<List<AnimalModel>> {
  @override
  Stream<List<AnimalModel>> build() {
    final repo = ref.watch(animalsRepositoryProvider);
    final filterState = ref.watch(animalsStateProvider);

    return repo.watchAnimals().map((animals) {
      return animals.where((animal) {
        // Search query
        if (filterState.searchQuery.isNotEmpty) {
          final query = filterState.searchQuery.toLowerCase();
          final matchesTag = animal.tagNumber.toLowerCase().contains(query);
          final matchesName = (animal.name ?? '').toLowerCase().contains(query);
          if (!matchesTag && !matchesName) return false;
        }

        // Status filter
        if (filterState.statusFilter != null &&
            animal.status != filterState.statusFilter) {
          return false;
        }

        // Breed filter
        if (filterState.breedFilter != null &&
            animal.breed != filterState.breedFilter) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void setSearchQuery(String query) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(searchQuery: query));
  }

  void setStatusFilter(String? status) {
    ref.read(animalsStateProvider.notifier).update((s) => AnimalsState(
          searchQuery: s.searchQuery,
          statusFilter: status,
          breedFilter: s.breedFilter,
        ));
  }

  void setBreedFilter(String? breed) {
    ref.read(animalsStateProvider.notifier).update((s) => AnimalsState(
          searchQuery: s.searchQuery,
          statusFilter: s.statusFilter,
          breedFilter: breed,
        ));
  }
  
  /// Helper to get unique breeds for the filter dropdown
  List<String> getAvailableBreeds() {
    final allAnimals = state.valueOrNull ?? [];
    final breeds = allAnimals
        .map((a) => a.breed)
        .where((b) => b != null && b.isNotEmpty)
        .cast<String>()
        .toSet()
        .toList();
    breeds.sort();
    return breeds;
  }
}
