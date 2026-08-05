import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'egg_production_records_dao.g.dart';

@DriftAccessor(tables: [EggProductionRecordsTable])
class EggProductionRecordsDao extends DatabaseAccessor<AppDatabase> with _$EggProductionRecordsDaoMixin {
  EggProductionRecordsDao(super.db);

  Stream<List<LocalEggProductionRecord>> watchRecordsByFarm(String farmId) {
    return (select(eggProductionRecordsTable)
          ..where((t) => t.farmId.equals(farmId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.productionDate, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<List<LocalEggProductionRecord>> watchRecordsByFlock(String flockId) {
    return (select(eggProductionRecordsTable)
          ..where((t) => t.flockId.equals(flockId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.productionDate, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<void> insertOrUpdate(LocalEggProductionRecord record) {
    return into(eggProductionRecordsTable).insertOnConflictUpdate(record);
  }

  Future<void> insertOrUpdateAll(List<LocalEggProductionRecord> records) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(eggProductionRecordsTable, records);
    });
  }

  Future<void> deleteRecord(String id) {
    return (delete(eggProductionRecordsTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() {
    return delete(eggProductionRecordsTable).go();
  }
}
