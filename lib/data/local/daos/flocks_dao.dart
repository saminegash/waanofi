import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'flocks_dao.g.dart';

@DriftAccessor(tables: [FlocksTable])
class FlocksDao extends DatabaseAccessor<AppDatabase> with _$FlocksDaoMixin {
  FlocksDao(super.db);

  Stream<List<LocalFlock>> watchFlocksByFarm(String farmId) {
    return (select(flocksTable)
          ..where((t) => t.farmId.equals(farmId) & t.deletedAt.isNull())
          ..orderBy([
            (t) => OrderingTerm(expression: t.name, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  Future<LocalFlock?> getFlockById(String id) {
    return (select(flocksTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertOrUpdate(LocalFlock flock) {
    return into(flocksTable).insertOnConflictUpdate(flock);
  }

  Future<void> insertOrUpdateAll(List<LocalFlock> flocks) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(flocksTable, flocks);
    });
  }

  Future<void> deleteFlock(String id) {
    return (delete(flocksTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAll() {
    return delete(flocksTable).go();
  }
}
