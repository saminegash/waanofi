import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/feed_type_model.dart';
import '../data/feed_types_repository.dart';

final feedTypesControllerProvider =
    StateNotifierProvider<FeedTypesController, AsyncValue<List<FeedTypeModel>>>(
        (ref) {
  final repo = ref.watch(feedTypesRepositoryProvider);
  return FeedTypesController(repo);
});

class FeedTypesController extends StateNotifier<AsyncValue<List<FeedTypeModel>>> {
  FeedTypesController(this._repo) : super(const AsyncLoading()) {
    _init();
  }

  final FeedTypesRepository _repo;

  void _init() {
    _repo.watchFeedTypes().listen(
      (types) {
        if (mounted) {
          state = AsyncData(types);
        }
      },
      onError: (e, st) {
        if (mounted) {
          state = AsyncError(e, st);
        }
      },
    );
  }

  Future<void> saveFeedType(FeedTypeModel feedType) async {
    await _repo.upsertFeedType(feedType);
  }
}
