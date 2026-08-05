import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'flock_adjustments_dao.g.dart';

@DriftAccessor(tables: [FlockAdjustmentsTable])
class FlockAdjustmentsDao extends DatabaseAccessor<AppDatabase> with _$FlockAdjustmentsDaoMixin {
  FlockAdjustmentsDao(super.db);

  Stream<List<LocalFlockAdjustment>> watchAdjustmentsByFlock(String flockId) {
    return (select(flockAdjustmentsTable)
          ..where((t) => t.flockId.equals(flockId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<void> insertOrUpdate(LocalFlockAdjustment adjustment) {
    return into(flockAdjustmentsTable).insertOnConflictUpdate(adjustment);
  }

  Future<void> insertOrUpdateAll(List<LocalFlockAdjustment> adjustments) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(flockAdjustmentsTable, adjustments);
    });
  }

  Future<void> deleteAdjustment(String id) {
    return (delete(flockAdjustmentsTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() {
    return delete(flockAdjustmentsTable).go();
  }
}
