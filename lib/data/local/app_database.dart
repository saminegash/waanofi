import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'daos/animals_dao.dart';
import 'daos/animal_state_logs_dao.dart';
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
    AnimalStateLogsTable,
    MilkRecordsTable,
    SyncOutboxTable,
    FeedTypesTable,
    FeedRecordsTable,
    EggRecordsTable,
    FlocksTable,
    EggProductionRecordsTable,
    FlockAdjustmentsTable,
    FarmMarketProfilesTable,
    MarketProductsTable,
    InventoryBatchesTable,
    QualityChecksTable,
    MarketListingsTable,
  ],
  daos: [
    AnimalsDao,
    AnimalStateLogsDao,
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
  int get schemaVersion => 8;

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
        if (from < 7) {
          await m.createTable(farmMarketProfilesTable);
          await m.createTable(marketProductsTable);
          await m.createTable(inventoryBatchesTable);
          await m.createTable(qualityChecksTable);
          await m.createTable(marketListingsTable);
        }
        if (from < 8) {
          await m.addColumn(animalsTable, animalsTable.lifecycleStatus);
          await m.addColumn(animalsTable, animalsTable.reproductiveStatus);
          await m.addColumn(animalsTable, animalsTable.lactationStatus);
          await m.addColumn(animalsTable, animalsTable.healthStatus);
          await m.addColumn(animalsTable, animalsTable.cattleClass);
          await m.addColumn(animalsTable, animalsTable.location);
          await m.addColumn(animalsTable, animalsTable.deletedAt);
          await m.createTable(animalStateLogsTable);

          await customStatement('''
            UPDATE animals SET
              lifecycle_status = CASE 
                WHEN status = 'sold' THEN 'sold'
                WHEN status = 'deceased' THEN 'deceased'
                ELSE 'active'
              END,
              reproductive_status = CASE 
                WHEN sex = 'male' THEN 'not_applicable'
                WHEN status = 'pregnant' THEN 'pregnant'
                WHEN status IN ('active', 'dry') THEN 'open'
                ELSE 'unknown'
              END,
              lactation_status = CASE 
                WHEN sex = 'male' THEN 'not_applicable'
                WHEN status = 'dry' THEN 'dry'
                WHEN status = 'pregnant' THEN 'dry'
                WHEN status = 'active' THEN 'lactating'
                ELSE 'unknown'
              END,
              health_status = CASE 
                WHEN status = 'sick' THEN 'sick'
                ELSE 'healthy'
              END,
              cattle_class = CASE 
                WHEN sex = 'male' THEN 'bull'
                ELSE 'cow'
              END;
          ''');
        }
      },
    );
  }

  /// Wipes all locally cached sensitive tenant data upon logout or farm switch.
  Future<void> clearSensitiveData() async {
    await transaction(() async {
      await delete(animalsTable).go();
      await delete(animalStateLogsTable).go();
      await delete(milkRecordsTable).go();
      await delete(eggRecordsTable).go();
      await delete(flocksTable).go();
      await delete(eggProductionRecordsTable).go();
      await delete(flockAdjustmentsTable).go();
      await delete(farmMarketProfilesTable).go();
      await delete(inventoryBatchesTable).go();
      await delete(qualityChecksTable).go();
      await delete(marketListingsTable).go();
      await delete(feedTypesTable).go();
      await delete(feedRecordsTable).go();
      await delete(syncOutboxTable).go();
    });
  }
}

