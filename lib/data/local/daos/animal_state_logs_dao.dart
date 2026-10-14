import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'animal_state_logs_dao.g.dart';

@DriftAccessor(tables: [AnimalStateLogsTable])
class AnimalStateLogsDao extends DatabaseAccessor<AppDatabase> with _$AnimalStateLogsDaoMixin {
  AnimalStateLogsDao(super.db);

  Stream<List<LocalAnimalStateLog>> watchLogsForAnimal(String animalId) {
    return (select(animalStateLogsTable)
          ..where((t) => t.animalId.equals(animalId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedTimestamp, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Future<List<LocalAnimalStateLog>> getLogsForAnimal(String animalId) {
    return (select(animalStateLogsTable)
          ..where((t) => t.animalId.equals(animalId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.recordedTimestamp, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<void> insertLog(LocalAnimalStateLog log) {
    return into(animalStateLogsTable).insertOnConflictUpdate(log);
  }

  Future<void> insertAllLogs(List<LocalAnimalStateLog> logs) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(animalStateLogsTable, logs);
    });
  }

  Future<void> clearAll() {
    return delete(animalStateLogsTable).go();
  }
}
