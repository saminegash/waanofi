import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'egg_records_dao.g.dart';

@DriftAccessor(tables: [EggRecordsTable])
class EggRecordsDao extends DatabaseAccessor<AppDatabase> with _$EggRecordsDaoMixin {
  EggRecordsDao(super.db);

  /// Watch all egg records for a farm
  Stream<List<LocalEggRecord>> watchEggRecordsByFarm(String farmId) {
    return (select(eggRecordsTable)
          ..where((t) => t.farmId.equals(farmId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  /// Get egg records for a date range
  Future<List<LocalEggRecord>> getEggRecordsInRange(
      String farmId, DateTime start, DateTime end) {
    return (select(eggRecordsTable)
          ..where((t) =>
              t.farmId.equals(farmId) &
              t.recordedAt.isBiggerOrEqualValue(start) &
              t.recordedAt.isSmallerOrEqualValue(end))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  /// Batch insert or update egg records locally
  Future<void> insertOrUpdateAll(List<LocalEggRecord> records) async {
    await batch((batch) {
      batch.insertAll(
        eggRecordsTable,
        records,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  /// Insert or update a single record
  Future<void> insertOrUpdate(LocalEggRecord record) async {
    await into(eggRecordsTable).insert(record, mode: InsertMode.insertOrReplace);
  }

  /// Delete an egg record locally
  Future<void> deleteRecord(String id) async {
    await (delete(eggRecordsTable)..where((t) => t.id.equals(id))).go();
  }
}
