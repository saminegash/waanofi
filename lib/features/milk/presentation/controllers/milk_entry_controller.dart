import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/auth/auth_providers.dart';
import '../../../animals/data/animals_repository.dart';
import '../../../animals/domain/animal_model.dart';
import '../../data/milk_repository.dart';
import '../../domain/milk_record_model.dart';

class MilkEntryState {
  const MilkEntryState({
    required this.date,
    required this.session,
    this.animals = const [],
    this.sevenDayAverages = const {},
    this.sevenDayHistories = const {},
    this.entries = const {},
    this.isLoading = true,
  });

  final DateTime date;
  final MilkSession session;
  final List<AnimalModel> animals;
  final Map<String, double> sevenDayAverages;
  final Map<String, List<double>> sevenDayHistories;
  final Map<String, double?> entries; // null means no entry yet
  final bool isLoading;

  MilkEntryState copyWith({
    DateTime? date,
    MilkSession? session,
    List<AnimalModel>? animals,
    Map<String, double>? sevenDayAverages,
    Map<String, List<double>>? sevenDayHistories,
    Map<String, double?>? entries,
    bool? isLoading,
  }) {
    return MilkEntryState(
      date: date ?? this.date,
      session: session ?? this.session,
      animals: animals ?? this.animals,
      sevenDayAverages: sevenDayAverages ?? this.sevenDayAverages,
      sevenDayHistories: sevenDayHistories ?? this.sevenDayHistories,
      entries: entries ?? this.entries,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  double get totalLitres => entries.values.whereType<double>().fold(0, (a, b) => a + b);
}

final milkEntryControllerProvider =
    StateNotifierProvider.autoDispose<MilkEntryController, MilkEntryState>((ref) {
  return MilkEntryController(ref);
});

class MilkEntryController extends StateNotifier<MilkEntryState> {
  MilkEntryController(this._ref)
      : super(MilkEntryState(
          date: DateTime.now(),
          session: MilkSession.morning,
        )) {
    _init();
  }

  final Ref _ref;

  Future<void> _init() async {
    // Watch active female animals
    _ref.watch(animalsRepositoryProvider).watchAnimals().listen((allAnimals) async {
      final lactating = allAnimals
          .where((a) => a.sex == 'female' && a.status == 'active')
          .toList();

      state = state.copyWith(animals: lactating);
      await _calculateAverages(lactating);
      state = state.copyWith(isLoading: false);
    });
  }

  Future<void> _calculateAverages(List<AnimalModel> lactating) async {
    final repo = _ref.read(milkRepositoryProvider);
    final averages = <String, double>{};
    final histories = <String, List<double>>{};
    
    // We want the last 7 days
    final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));

    for (final animal in lactating) {
      final records = await repo.getRecentMilkForAnimal(animal.id, sevenDaysAgo);
      if (records.isNotEmpty) {
        final total = records.fold<double>(0, (sum, r) => sum + r.litres);
        averages[animal.id] = total / records.length; // Average per recorded session
        histories[animal.id] = records.map((r) => r.litres).toList();
      } else {
        averages[animal.id] = 0.0;
        histories[animal.id] = [];
      }
    }
    
    if (mounted) {
      state = state.copyWith(
        sevenDayAverages: averages,
        sevenDayHistories: histories,
      );
    }
  }

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void setSession(MilkSession session) {
    state = state.copyWith(session: session);
  }

  void setEntry(String animalId, double? litres) {
    final newEntries = Map<String, double?>.from(state.entries);
    newEntries[animalId] = litres;
    state = state.copyWith(entries: newEntries);
  }

  Future<void> saveBatch() async {
    final repo = _ref.read(milkRepositoryProvider);
    final user = _ref.read(currentUserProvider);
    if (user?.farmId == null) return;
    
    final records = <MilkRecordModel>[];
    
    for (final entry in state.entries.entries) {
      if (entry.value != null) {
        records.add(
          MilkRecordModel(
            id: '', // Empty ID means insert
            farmId: user!.farmId!,
            animalId: entry.key,
            recordedAt: state.date,
            session: state.session,
            litres: entry.value!,
            recordedBy: user!.id,
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    if (records.isNotEmpty) {
      await repo.batchUpsertMilkRecords(records);
      
      // Clear entries after save
      state = state.copyWith(entries: {});
    }
  }
}
