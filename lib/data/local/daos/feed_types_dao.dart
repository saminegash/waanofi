import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'feed_types_dao.g.dart';

@DriftAccessor(tables: [FeedTypesTable])
class FeedTypesDao extends DatabaseAccessor<AppDatabase> with _$FeedTypesDaoMixin {
  FeedTypesDao(super.db);

  Future<List<LocalFeedType>> getAllFeedTypes() {
    return select(feedTypesTable).get();
  }

  Future<void> batchInsertFeedTypes(List<LocalFeedType> types) async {
    await batch((batch) {
      batch.insertAll(
        feedTypesTable,
        types,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> upsertFeedType(LocalFeedType type) {
    return into(feedTypesTable).insert(type, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteFeedType(String id) {
    return (delete(feedTypesTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() {
    return delete(feedTypesTable).go();
  }
}
