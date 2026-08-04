import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/auth/auth_providers.dart';
import '../../data/egg_repository.dart';
import '../../domain/egg_record_model.dart';

class EggEntryState {
  const EggEntryState({
    required this.date,
    this.flockName = '',
    this.productionType = EggProductionType.freeRange,
    this.quantity,
    this.brokenCount = 0,
    this.notes,
    this.isLoading = false,
    this.isSaved = false,
  });

  final DateTime date;
  final String flockName;
  final EggProductionType productionType;
  final int? quantity;
  final int brokenCount;
  final String? notes;
  final bool isLoading;
  final bool isSaved;

  int get goodEggs => (quantity ?? 0) - brokenCount;

  EggEntryState copyWith({
    DateTime? date,
    String? flockName,
    EggProductionType? productionType,
    int? quantity,
    int? brokenCount,
    String? notes,
    bool? isLoading,
    bool? isSaved,
  }) {
    return EggEntryState(
      date: date ?? this.date,
      flockName: flockName ?? this.flockName,
      productionType: productionType ?? this.productionType,
      quantity: quantity ?? this.quantity,
      brokenCount: brokenCount ?? this.brokenCount,
      notes: notes ?? this.notes,
      isLoading: isLoading ?? this.isLoading,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}

final eggEntryControllerProvider =
    StateNotifierProvider.autoDispose<EggEntryController, EggEntryState>((ref) {
  return EggEntryController(ref);
});

class EggEntryController extends StateNotifier<EggEntryState> {
  EggEntryController(this._ref)
      : super(EggEntryState(
          date: DateTime.now(),
        ));

  final Ref _ref;

  void setDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void setFlockName(String name) {
    state = state.copyWith(flockName: name);
  }

  void setProductionType(EggProductionType type) {
    state = state.copyWith(productionType: type);
  }

  void setQuantity(int? quantity) {
    state = state.copyWith(quantity: quantity);
  }

  void setBrokenCount(int count) {
    state = state.copyWith(brokenCount: count);
  }

  void setNotes(String? notes) {
    state = state.copyWith(notes: notes);
  }

  Future<void> saveRecord() async {
    final user = _ref.read(currentUserProvider);
    if (user?.farmId == null) throw Exception('No farm selected');
    if (state.flockName.isEmpty) throw Exception('Flock name is required');
    if (state.quantity == null || state.quantity! < 0) {
      throw Exception('Quantity must be 0 or greater');
    }
    if (state.brokenCount > (state.quantity ?? 0)) {
      throw Exception('Broken count cannot exceed total quantity');
    }

    state = state.copyWith(isLoading: true);

    try {
      final repo = _ref.read(eggRepositoryProvider);
      final record = EggRecordModel(
        id: const Uuid().v4(),
        farmId: user!.farmId!,
        flockName: state.flockName,
        productionType: state.productionType,
        recordedAt: state.date,
        quantity: state.quantity!,
        brokenCount: state.brokenCount,
        notes: state.notes,
        recordedBy: user.id,
        createdAt: DateTime.now(),
      );

      await repo.batchUpsertEggRecords([record]);

      state = state.copyWith(isLoading: false, isSaved: true);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
