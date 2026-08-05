import 'package:drift/drift.dart';

@DataClassName('LocalAnimal')
class AnimalsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get tagNumber => text()();
  TextColumn get name => text().nullable()();
  TextColumn get breed => text().nullable()();
  TextColumn get sex => text()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get photoUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalMilkRecord')
class MilkRecordsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get animalId => text()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get session => text()(); // morning, evening, night
  RealColumn get litres => real()();
  TextColumn get recordedBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalFeedType')
class FeedTypesTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get name => text()();
  TextColumn get unit => text().withDefault(const Constant('kg'))();
  RealColumn get unitCost => real().withDefault(const Constant(0.0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalFeedRecord')
class FeedRecordsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get animalId => text().nullable()(); // Null means farm-wide
  TextColumn get feedTypeId => text()();
  RealColumn get quantityKg => real()();
  RealColumn get cost => real()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get recordedBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalEggRecord')
class EggRecordsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get flockName => text()();
  TextColumn get productionType => text().withDefault(const Constant('free_range'))();
  DateTimeColumn get recordedAt => dateTime()();
  IntColumn get quantity => integer()();
  IntColumn get brokenCount => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  TextColumn get recordedBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SyncOutboxItem')
class SyncOutboxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()(); // e.g. 'milk_record'
  TextColumn get operation => text()(); // e.g. 'upsert', 'delete'
  TextColumn get payload => text()(); // JSON string of the record
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, processing, retrying, permanently_failed
  TextColumn get errorMessage => text().nullable()();
  TextColumn get idempotencyKey => text().nullable()();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextRetryAt => dateTime().nullable()();
  TextColumn get lastErrorCode => text().nullable()();
}

@DataClassName('LocalFlock')
class FlocksTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get flockCode => text()();
  TextColumn get name => text()();
  TextColumn get breed => text()();
  TextColumn get purpose => text().withDefault(const Constant('layers'))();
  IntColumn get numberOfBirds => integer().withDefault(const Constant(0))();
  IntColumn get numberOfLayingHens => integer().withDefault(const Constant(0))();
  DateTimeColumn get arrivalDate => dateTime()();
  DateTimeColumn get hatchDate => dateTime().nullable()();
  TextColumn get housingType => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get notes => text().nullable()();
  TextColumn get createdBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalEggProductionRecord')
class EggProductionRecordsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get flockId => text()();
  DateTimeColumn get productionDate => dateTime()();
  IntColumn get goodEggs => integer().withDefault(const Constant(0))();
  IntColumn get crackedEggs => integer().withDefault(const Constant(0))();
  IntColumn get rejectedEggs => integer().withDefault(const Constant(0))();
  IntColumn get farmUseEggs => integer().withDefault(const Constant(0))();
  IntColumn get soldDirectlyEggs => integer().withDefault(const Constant(0))();
  IntColumn get availableEggs => integer().withDefault(const Constant(0))();
  TextColumn get recordedBy => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalFlockAdjustment')
class FlockAdjustmentsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get flockId => text()();
  TextColumn get adjustmentType => text()();
  IntColumn get birdsChanged => integer()();
  IntColumn get hensChanged => integer().withDefault(const Constant(0))();
  TextColumn get reason => text().nullable()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get recordedBy => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalFarmMarketProfile')
class FarmMarketProfilesTable extends Table {
  TextColumn get farmId => text()();
  TextColumn get publicFarmName => text()();
  TextColumn get publicDescription => text().nullable()();
  TextColumn get publicPhone => text().nullable()();
  TextColumn get publicEmail => text().nullable()();
  TextColumn get generalLocation => text()();
  TextColumn get marketplaceStatus => text().withDefault(const Constant('draft'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {farmId};
}

@DataClassName('LocalMarketProduct')
class MarketProductsTable extends Table {
  TextColumn get id => text()();
  TextColumn get productCode => text()();
  TextColumn get category => text()();
  TextColumn get nameEn => text()();
  TextColumn get nameAm => text()();
  TextColumn get nameOm => text()();
  TextColumn get baseInventoryUnit => text()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalInventoryBatch')
class InventoryBatchesTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get productId => text().nullable()();
  TextColumn get batchCode => text()();
  TextColumn get sourceType => text()();
  RealColumn get producedQuantity => real()();
  RealColumn get approvedQuantity => real().withDefault(const Constant(0))();
  RealColumn get availableQuantity => real().withDefault(const Constant(0))();
  TextColumn get baseUnit => text()();
  DateTimeColumn get producedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime().nullable()();
  TextColumn get qualityStatus => text().withDefault(const Constant('pending_inspection'))();
  TextColumn get marketplaceStatus => text().withDefault(const Constant('unlisted'))();
  IntColumn get version => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalQualityCheck')
class QualityChecksTable extends Table {
  TextColumn get id => text()();
  TextColumn get batchId => text()();
  TextColumn get checkType => text()();
  TextColumn get result => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get checkedBy => text().nullable()();
  DateTimeColumn get checkedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get approvalStatus => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LocalMarketListing')
class MarketListingsTable extends Table {
  TextColumn get id => text()();
  TextColumn get farmId => text()();
  TextColumn get productId => text().nullable()();
  TextColumn get publicTitle => text()();
  TextColumn get publicDescription => text().nullable()();
  TextColumn get sellingUnit => text()();
  IntColumn get unitConversion => integer().withDefault(const Constant(1))();
  IntColumn get priceInMinorUnits => integer()();
  TextColumn get currency => text().withDefault(const Constant('ETB'))();
  IntColumn get minimumOrderQuantity => integer().withDefault(const Constant(1))();
  TextColumn get status => text().withDefault(const Constant('draft'))();
  TextColumn get approvalStatus => text().withDefault(const Constant('pending'))();

  @override
  Set<Column> get primaryKey => {id};
}



