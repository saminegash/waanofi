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

@DataClassName('SyncOutboxItem')
class SyncOutboxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()(); // e.g. 'milk_record'
  TextColumn get operation => text()(); // e.g. 'upsert'
  TextColumn get payload => text()(); // JSON string of the record
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, processing, failed
  TextColumn get errorMessage => text().nullable()();
}
