import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/auth/auth_providers.dart';
import '../../../animals/data/animals_repository.dart';
import '../../../animals/domain/animal_model.dart';
import '../../data/feed_repository.dart';
import '../../domain/feed_record_model.dart';
import '../../domain/feed_type_model.dart';

final feedEntryControllerProvider =
    StateNotifierProvider<FeedEntryController, FeedEntryState>((ref) {
  final animalRepo = ref.watch(animalsRepositoryProvider);
  final feedRepo = ref.watch(feedRepositoryProvider);
  final user = ref.watch(currentUserProvider);

  return FeedEntryController(animalRepo, feedRepo, user?.farmId, user?.id);
});

class FeedEntryState {
  const FeedEntryState({
    required this.selectedDate,
    this.selectedFeedType,
    this.isFarmWide = true,
    this.activeAnimals = const [],
    this.farmWideQuantity = 0.0,
    this.animalQuantities = const {},
  });

  final DateTime selectedDate;
  final FeedTypeModel? selectedFeedType;
  final bool isFarmWide;
  final List<AnimalModel> activeAnimals;
  final double farmWideQuantity;
  final Map<String, double> animalQuantities;

  FeedEntryState copyWith({
    DateTime? selectedDate,
    FeedTypeModel? selectedFeedType,
    bool? isFarmWide,
    List<AnimalModel>? activeAnimals,
    double? farmWideQuantity,
    Map<String, double>? animalQuantities,
  }) {
    return FeedEntryState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedFeedType: selectedFeedType ?? this.selectedFeedType,
      isFarmWide: isFarmWide ?? this.isFarmWide,
      activeAnimals: activeAnimals ?? this.activeAnimals,
      farmWideQuantity: farmWideQuantity ?? this.farmWideQuantity,
      animalQuantities: animalQuantities ?? this.animalQuantities,
    );
  }

  double get totalQuantity {
    if (isFarmWide) return farmWideQuantity;
    return animalQuantities.values.fold(0.0, (sum, val) => sum + val);
  }

  double get totalCost {
    if (selectedFeedType == null) return 0.0;
    return totalQuantity * selectedFeedType!.unitCost;
  }
}

class FeedEntryController extends StateNotifier<FeedEntryState> {
  FeedEntryController(this._animalRepo, this._feedRepo, this._farmId, this._userId)
      : super(FeedEntryState(selectedDate: DateTime.now())) {
    _loadAnimals();
  }

  final AnimalsRepository _animalRepo;
  final FeedRepository _feedRepo;
  final String? _farmId;
  final String? _userId;

  void _loadAnimals() {
    _animalRepo.watchAnimals().listen((animals) {
      if (!mounted) return;
      final active = animals.where((a) => a.isLiveInventory).toList();
      state = state.copyWith(activeAnimals: active);
    });
  }

  void updateDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void updateFeedType(FeedTypeModel type) {
    state = state.copyWith(selectedFeedType: type);
  }

  void toggleEntryType(bool isFarmWide) {
    state = state.copyWith(isFarmWide: isFarmWide);
  }

  void updateFarmWideQuantity(double quantity) {
    state = state.copyWith(farmWideQuantity: quantity);
  }

  void updateAnimalQuantity(String animalId, double quantity) {
    final newMap = Map<String, double>.from(state.animalQuantities);
    newMap[animalId] = quantity;
    state = state.copyWith(animalQuantities: newMap);
  }

  Future<void> submit() async {
    if (_farmId == null || state.selectedFeedType == null || state.totalQuantity == 0) return;

    final records = <FeedRecordModel>[];
    final now = DateTime.now();

    if (state.isFarmWide) {
      records.add(FeedRecordModel(
        id: Uuid().v4(),
        farmId: _farmId!,
        animalId: null,
        feedTypeId: state.selectedFeedType!.id,
        quantityKg: state.farmWideQuantity,
        cost: state.farmWideQuantity * state.selectedFeedType!.unitCost,
        recordedAt: state.selectedDate,
        recordedBy: _userId,
        createdAt: now,
      ));
    } else {
      for (final entry in state.animalQuantities.entries) {
        if (entry.value > 0) {
          records.add(FeedRecordModel(
            id: Uuid().v4(),
            farmId: _farmId!,
            animalId: entry.key,
            feedTypeId: state.selectedFeedType!.id,
            quantityKg: entry.value,
            cost: entry.value * state.selectedFeedType!.unitCost,
            recordedAt: state.selectedDate,
            recordedBy: _userId,
            createdAt: now,
          ));
        }
      }
    }

    if (records.isNotEmpty) {
      await _feedRepo.batchUpsertFeedRecords(records);
      // Reset form after submission
      state = state.copyWith(
        farmWideQuantity: 0.0,
        animalQuantities: {},
      );
    }
  }
}
