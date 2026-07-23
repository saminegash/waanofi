import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'milk_dao.g.dart';

@DriftAccessor(tables: [MilkRecordsTable])
class MilkDao extends DatabaseAccessor<AppDatabase> with _$MilkDaoMixin {
  MilkDao(super.db);

  /// Watch all milk records for a farm
  Stream<List<LocalMilkRecord>> watchMilkRecordsByFarm(String farmId) {
    return (select(milkRecordsTable)
          ..where((t) => t.farmId.equals(farmId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  /// Get milk records for a specific animal within a date range
  Future<List<LocalMilkRecord>> getRecentMilkForAnimal(
      String animalId, DateTime startDate) {
    return (select(milkRecordsTable)
          ..where((t) =>
              t.animalId.equals(animalId) &
              t.recordedAt.isBiggerOrEqualValue(startDate))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.asc)
          ]))
        .get();
  }

  /// Batch insert or update milk records locally
  Future<void> insertOrUpdateAll(List<LocalMilkRecord> records) async {
    await batch((batch) {
      batch.insertAll(
        milkRecordsTable,
        records,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
  
  /// Insert or update a single record
  Future<void> insertOrUpdate(LocalMilkRecord record) async {
    await into(milkRecordsTable).insert(record, mode: InsertMode.insertOrReplace);
  }

  /// Delete a milk record locally
  Future<void> deleteRecord(String id) async {
    await (delete(milkRecordsTable)..where((t) => t.id.equals(id))).go();
  }
}
