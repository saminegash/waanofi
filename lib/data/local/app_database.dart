import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'daos/animals_dao.dart';
import 'daos/egg_records_dao.dart';
import 'daos/egg_production_records_dao.dart';
import 'daos/flocks_dao.dart';
import 'daos/flock_adjustments_dao.dart';
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
    FlocksTable,
    EggProductionRecordsTable,
    FlockAdjustmentsTable,
  ],
  daos: [
    AnimalsDao,
    EggRecordsDao,
    EggProductionRecordsDao,
    FlocksDao,
    FlockAdjustmentsDao,
    MilkDao,
    OutboxDao,
    FeedTypesDao,
    FeedRecordsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.openConnection());
  AppDatabase.forTesting(super.executor);

  @override

  int get schemaVersion => 6;

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
        if (from < 5) {
          await m.addColumn(syncOutboxTable, syncOutboxTable.idempotencyKey);
          await m.addColumn(syncOutboxTable, syncOutboxTable.attemptCount);
          await m.addColumn(syncOutboxTable, syncOutboxTable.nextRetryAt);
          await m.addColumn(syncOutboxTable, syncOutboxTable.lastErrorCode);
        }
        if (from < 6) {
          await m.createTable(flocksTable);
          await m.createTable(eggProductionRecordsTable);
          await m.createTable(flockAdjustmentsTable);
        }
      },
    );
  }

  /// Wipes all locally cached sensitive tenant data upon logout or farm switch.
  Future<void> clearSensitiveData() async {
    await transaction(() async {
      await delete(animalsTable).go();
      await delete(milkRecordsTable).go();
      await delete(eggRecordsTable).go();
      await delete(flocksTable).go();
      await delete(eggProductionRecordsTable).go();
      await delete(flockAdjustmentsTable).go();
      await delete(feedTypesTable).go();
      await delete(feedRecordsTable).go();
      await delete(syncOutboxTable).go();
    });
  }
}

