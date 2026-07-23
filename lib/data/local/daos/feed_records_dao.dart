import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'feed_records_dao.g.dart';

@DriftAccessor(tables: [FeedRecordsTable])
class FeedRecordsDao extends DatabaseAccessor<AppDatabase> with _$FeedRecordsDaoMixin {
  FeedRecordsDao(super.db);

  Future<List<LocalFeedRecord>> getAllFeedRecords() {
    return select(feedRecordsTable).get();
  }

  Future<void> batchInsertFeedRecords(List<LocalFeedRecord> records) async {
    await batch((batch) {
      batch.insertAll(
        feedRecordsTable,
        records,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> clearAll() {
    return delete(feedRecordsTable).go();
  }
}
