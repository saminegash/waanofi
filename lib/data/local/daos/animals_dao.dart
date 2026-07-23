import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables.dart';

part 'animals_dao.g.dart';

@DriftAccessor(tables: [AnimalsTable])
class AnimalsDao extends DatabaseAccessor<AppDatabase> with _$AnimalsDaoMixin {
  AnimalsDao(super.db);

  /// Watch all animals for a specific farm
  Stream<List<LocalAnimal>> watchAnimalsByFarm(String farmId) {
    return (select(animalsTable)
          ..where((t) => t.farmId.equals(farmId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.tagNumber, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  /// Insert or update an animal record
  Future<void> insertOrUpdate(LocalAnimal animal) {
    return into(animalsTable).insertOnConflictUpdate(animal);
  }
  
  /// Insert or update multiple animal records in a batch
  Future<void> insertOrUpdateAll(List<LocalAnimal> animals) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(animalsTable, animals);
    });
  }

  /// Delete an animal by ID
  Future<void> deleteAnimal(String id) {
    return (delete(animalsTable)..where((t) => t.id.equals(id))).go();
  }

  /// Clear all animals (e.g., on logout)
  Future<void> clearAll() {
    return delete(animalsTable).go();
  }
}
