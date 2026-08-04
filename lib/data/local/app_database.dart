import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'daos/animals_dao.dart';
import 'daos/egg_records_dao.dart';
import 'daos/milk_dao.dart';
import 'daos/outbox_dao.dart';
import 'daos/feed_types_dao.dart';
import 'daos/feed_records_dao.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AnimalsTable,
    MilkRecordsTable,
    SyncOutboxTable,
    FeedTypesTable,
    FeedRecordsTable,
    EggRecordsTable,
  ],
  daos: [
    AnimalsDao,
    EggRecordsDao,
    MilkDao,
    OutboxDao,
    FeedTypesDao,
    FeedRecordsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(milkRecordsTable);
          await m.createTable(syncOutboxTable);
        }
        if (from < 3) {
          await m.createTable(feedTypesTable);
          await m.createTable(feedRecordsTable);
        }
        if (from < 4) {
          await m.createTable(eggRecordsTable);
        }
      },
    );
  }
}
