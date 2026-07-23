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
  TextColumn get status => text()();
  TextColumn get photoUrl => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
