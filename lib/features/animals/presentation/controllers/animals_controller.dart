import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/animals_repository.dart';
import '../../domain/animal_enums.dart';
import '../../domain/animal_model.dart';

final networkStatusProvider = StreamProvider<bool>((ref) {
  return Connectivity().onConnectivityChanged.map((results) {
    return !results.contains(ConnectivityResult.none);
  });
});

class AnimalsState {
  const AnimalsState({
    this.searchQuery = '',
    this.lifecycleFilter,
    this.reproductiveFilter,
    this.lactationFilter,
    this.healthFilter,
    this.cattleClassFilter,
    this.breedFilter,
  });

  final String searchQuery;
  final AnimalLifecycleStatus? lifecycleFilter;
  final AnimalReproductiveStatus? reproductiveFilter;
  final AnimalLactationStatus? lactationFilter;
  final AnimalHealthStatus? healthFilter;
  final CattleClass? cattleClassFilter;
  final String? breedFilter;

  AnimalsState copyWith({
    String? searchQuery,
    AnimalLifecycleStatus? lifecycleFilter,
    AnimalReproductiveStatus? reproductiveFilter,
    AnimalLactationStatus? lactationFilter,
    AnimalHealthStatus? healthFilter,
    CattleClass? cattleClassFilter,
    String? breedFilter,
    bool clearLifecycle = false,
    bool clearReproductive = false,
    bool clearLactation = false,
    bool clearHealth = false,
    bool clearCattleClass = false,
    bool clearBreed = false,
  }) {
    return AnimalsState(
      searchQuery: searchQuery ?? this.searchQuery,
      lifecycleFilter: clearLifecycle ? null : (lifecycleFilter ?? this.lifecycleFilter),
      reproductiveFilter: clearReproductive ? null : (reproductiveFilter ?? this.reproductiveFilter),
      lactationFilter: clearLactation ? null : (lactationFilter ?? this.lactationFilter),
      healthFilter: clearHealth ? null : (healthFilter ?? this.healthFilter),
      cattleClassFilter: clearCattleClass ? null : (cattleClassFilter ?? this.cattleClassFilter),
      breedFilter: clearBreed ? null : (breedFilter ?? this.breedFilter),
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

        // Lifecycle filter
        if (filterState.lifecycleFilter != null &&
            animal.lifecycleStatus != filterState.lifecycleFilter) {
          return false;
        }

        // Reproductive filter
        if (filterState.reproductiveFilter != null &&
            animal.reproductiveStatus != filterState.reproductiveFilter) {
          return false;
        }

        // Lactation filter
        if (filterState.lactationFilter != null &&
            animal.lactationStatus != filterState.lactationFilter) {
          return false;
        }

        // Health filter
        if (filterState.healthFilter != null &&
            animal.healthStatus != filterState.healthFilter) {
          return false;
        }

        // Cattle class filter
        if (filterState.cattleClassFilter != null &&
            animal.cattleClass != filterState.cattleClassFilter) {
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

  void setLifecycleFilter(AnimalLifecycleStatus? status) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          lifecycleFilter: status,
          clearLifecycle: status == null,
        ));
  }

  void setReproductiveFilter(AnimalReproductiveStatus? status) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          reproductiveFilter: status,
          clearReproductive: status == null,
        ));
  }

  void setLactationFilter(AnimalLactationStatus? status) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          lactationFilter: status,
          clearLactation: status == null,
        ));
  }

  void setHealthFilter(AnimalHealthStatus? status) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          healthFilter: status,
          clearHealth: status == null,
        ));
  }

  void setCattleClassFilter(CattleClass? cattleClass) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          cattleClassFilter: cattleClass,
          clearCattleClass: cattleClass == null,
        ));
  }

  void setBreedFilter(String? breed) {
    ref.read(animalsStateProvider.notifier).update((s) => s.copyWith(
          breedFilter: breed,
          clearBreed: breed == null,
        ));
  }

  void resetFilters() {
    ref.read(animalsStateProvider.notifier).state = const AnimalsState();
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

    final currentFilter = ref.read(animalsStateProvider).breedFilter;
    if (currentFilter != null && !breeds.contains(currentFilter)) {
      breeds.add(currentFilter);
    }

    breeds.sort();
    return breeds;
  }
}
