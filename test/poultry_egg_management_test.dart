import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:waanofi/core/auth/permission.dart';
import 'package:waanofi/core/auth/role_permissions.dart';
import 'package:waanofi/features/poultry/domain/flock_model.dart';
import 'package:waanofi/features/poultry/domain/egg_production_record_model.dart';

void main() {
  group('Poultry Domain Helper Mathematics & Tray Conversions', () {
    test('Calculates full trays and loose eggs correctly', () {
      final record1 = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime(2026, 8, 7),
        goodEggs: 100,
        farmUseEggs: 5,
        soldDirectlyEggs: 30,
        availableEggs: 65, // 100 - 5 - 30
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(record1.computedAvailable, equals(65));
      expect(record1.fullTrays, equals(2)); // 65 ~/ 30 = 2
      expect(record1.looseEggs, equals(5)); // 65 % 30 = 5
      expect(record1.formattedTrayEquivalent, equals('2 full trays, 5 loose eggs'));
    });

    test('Formats singular trays and zero remainder cleanly', () {
      final record2 = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime(2026, 8, 7),
        goodEggs: 30,
        availableEggs: 30,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(record2.fullTrays, equals(1));
      expect(record2.looseEggs, equals(0));
      expect(record2.formattedTrayEquivalent, equals('1 full tray'));
    });

    test('Formats loose eggs only when under 30', () {
      final record3 = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime(2026, 8, 7),
        goodEggs: 12,
        availableEggs: 12,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(record3.fullTrays, equals(0));
      expect(record3.looseEggs, equals(12));
      expect(record3.formattedTrayEquivalent, equals('12 loose eggs'));
    });
  });

  group('Domain Validation & Zero Negative Tolerance', () {
    test('Throws exception if any quantity is negative', () {
      final negativeRecord = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime.now(),
        goodEggs: -5, // Invalid negative count
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(
        () => negativeRecord.validate(),
        throwsA(isA<EggProductionValidationException>()),
      );
    });

    test('Throws exception if allocation exceeds collected good eggs', () {
      final overAllocatedRecord = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime.now(),
        goodEggs: 40,
        farmUseEggs: 25,
        soldDirectlyEggs: 20, // Total allocated = 45 > 40
        availableEggs: -5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(
        () => overAllocatedRecord.validate(),
        throwsA(isA<EggProductionValidationException>()),
      );
    });

    test('Valid record passes verification silently', () {
      final validRecord = EggProductionRecordModel(
        id: const Uuid().v4(),
        farmId: 'farm_a',
        flockId: 'flock_1',
        productionDate: DateTime.now(),
        goodEggs: 50,
        crackedEggs: 2,
        rejectedEggs: 1,
        farmUseEggs: 10,
        soldDirectlyEggs: 10,
        availableEggs: 30,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(() => validRecord.validate(), returnsNormally);
      expect(validRecord.totalCollected, equals(53));
    });
  });

  group('Flock Helper Properties', () {
    test('Computes laying rate percentage and active state accurately', () {
      final flock = FlockModel(
        id: 'flock_abc',
        farmId: 'farm_123',
        flockCode: 'FL-01',
        name: 'Alpha Layers',
        breed: 'Rhode Island Red',
        purpose: FlockPurpose.layers,
        numberOfBirds: 200,
        numberOfLayingHens: 180,
        arrivalDate: DateTime(2026, 1, 1),
        status: FlockStatus.active,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(flock.isActive, isTrue);
      expect(flock.layingRatePercentage, equals(90.0)); // (180 / 200) * 100
    });
  });

  group('Role-Based Access Control (RBAC) Security Hardening', () {
    test('Admin role possesses unrestricted poultry permissions', () {
      final adminPerms = rolePermissions[UserRole.admin]!;
      expect(adminPerms.contains(Permission.viewPoultry), isTrue);
      expect(adminPerms.contains(Permission.manageFlocks), isTrue);
      expect(adminPerms.contains(Permission.recordEggProduction), isTrue);
      expect(adminPerms.contains(Permission.editEggProduction), isTrue);
      expect(adminPerms.contains(Permission.deleteEggProduction), isTrue);
      expect(adminPerms.contains(Permission.viewPoultryReports), isTrue);
    });

    test('Worker role is strictly prohibited from managing flocks or deleting production logs', () {
      final workerPerms = rolePermissions[UserRole.user]!;
      expect(workerPerms.contains(Permission.viewPoultry), isTrue);
      expect(workerPerms.contains(Permission.recordEggProduction), isTrue);
      expect(workerPerms.contains(Permission.editEggProduction), isTrue);
      expect(workerPerms.contains(Permission.viewPoultryReports), isTrue);
      
      // Prohibited actions for regular workers
      expect(workerPerms.contains(Permission.manageFlocks), isFalse);
      expect(workerPerms.contains(Permission.deleteEggProduction), isFalse);
    });

    test('Guest role only possesses read-only access to poultry analytics', () {
      final guestPerms = rolePermissions[UserRole.guest]!;
      expect(guestPerms.contains(Permission.viewPoultry), isTrue);
      
      // No modification rights at all
      expect(guestPerms.contains(Permission.manageFlocks), isFalse);
      expect(guestPerms.contains(Permission.recordEggProduction), isFalse);
      expect(guestPerms.contains(Permission.editEggProduction), isFalse);
      expect(guestPerms.contains(Permission.deleteEggProduction), isFalse);
    });
  });
}
