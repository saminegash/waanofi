import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'daos/animals_dao.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [AnimalsTable],
  daos: [AnimalsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.openConnection());

  @override
  int get schemaVersion => 1;
}
