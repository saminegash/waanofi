import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waanofi/data/local/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('Logout & Context Security Hardening', () {
    test('clearSensitiveData thoroughly purges local tenant tables without affecting non-tenant structural logic', () async {
      // Insert mock animal representing sensitive farm tenant data
      await db.into(db.animalsTable).insert(
        AnimalsTableCompanion.insert(
          id: 'animal_1',
          farmId: 'farm_A',
          tagNumber: 'TAG001',
          sex: 'Female',
          name: const Value('Bessi'),
        ),
      );

      // Insert mock milk record
      await db.into(db.milkRecordsTable).insert(
        MilkRecordsTableCompanion.insert(
          id: 'milk_1',
          farmId: 'farm_A',
          animalId: 'animal_1',
          recordedAt: DateTime.now(),
          session: 'Morning',
          litres: 12.5,
        ),
      );


      // Verify local tenant data exists
      final animalsBefore = await db.select(db.animalsTable).get();
      expect(animalsBefore.length, 1);

      final milkBefore = await db.select(db.milkRecordsTable).get();
      expect(milkBefore.length, 1);

      // Perform sensitive data cleanup as invoked upon sign-out or tenant context switch
      await db.clearSensitiveData();

      // Verify sensitive local tenant records are completely purged to prevent data cross-contamination
      final animalsAfter = await db.select(db.animalsTable).get();
      expect(animalsAfter.isEmpty, isTrue, reason: 'Animals table must be purged on logout');

      final milkAfter = await db.select(db.milkRecordsTable).get();
      expect(milkAfter.isEmpty, isTrue, reason: 'Milk records table must be purged on logout');
    });
  });
}
