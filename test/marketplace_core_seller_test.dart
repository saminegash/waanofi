import 'package:flutter_test/flutter_test.dart';
import 'package:waanofi/features/marketplace/domain/seller_listing_model.dart';
import 'package:waanofi/features/marketplace/domain/inventory_batch_model.dart';
import 'package:waanofi/features/marketplace/domain/farm_market_profile_model.dart';
import 'package:waanofi/features/marketplace/domain/farm_membership_model.dart';

void main() {
  group('Marketplace Seller Financial & Arithmetic Precision', () {
    test('Exact santim minor units conversion prevents floating-point rounding errors', () {
      final listing = SellerListingModel(
        id: 'list_001',
        farmId: 'farm_01',
        publicTitle: 'Fresh Whole Milk',
        sellingUnit: 'litres',
        priceInMinorUnits: 8550, // 85.50 ETB
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(listing.priceFormatted, equals('85.50 ETB'));
      expect(listing.computeOrderTotalMinorUnits(10), equals(85500)); // 855.00 ETB exact in santim
    });

    test('Enforces Mandatory Minimum & Maximum Order Quantity guards', () {
      final listing = SellerListingModel(
        id: 'list_002',
        farmId: 'farm_01',
        publicTitle: 'Pasture Table Eggs (Trays)',
        sellingUnit: 'tray_30',
        priceInMinorUnits: 65000, // 650.00 ETB
        minimumOrderQuantity: 5,
        maximumOrderQuantity: 50,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(() => listing.computeOrderTotalMinorUnits(3), throwsA(isA<ArgumentError>()));
      expect(() => listing.computeOrderTotalMinorUnits(60), throwsA(isA<ArgumentError>()));
      expect(listing.computeOrderTotalMinorUnits(10), equals(650000));
    });
  });

  group('Inventory Batches Quality & Expiry Safeguards', () {
    test('Automated 30-egg Tray calculator and integer loose count formatting', () {
      final eggBatch = InventoryBatchModel(
        id: 'batch_egg_1',
        farmId: 'farm_01',
        batchCode: 'EGG-20260808',
        sourceType: 'egg_production',
        producedQuantity: 158,
        approvedQuantity: 158,
        availableQuantity: 158,
        baseUnit: 'eggs',
        producedAt: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(eggBatch.formattedEggInventory, equals('5 Trays + 8 Loose'));
    });

    test('Expired or unapproved batches cannot be listed for sale', () {
      final now = DateTime.now();
      final expiredBatch = InventoryBatchModel(
        id: 'batch_milk_expired',
        farmId: 'farm_01',
        batchCode: 'MILK-EXP',
        sourceType: 'milk_production',
        producedQuantity: 50.0,
        approvedQuantity: 50.0,
        availableQuantity: 50.0,
        baseUnit: 'litres',
        producedAt: now.subtract(const Duration(days: 3)),
        expiresAt: now.subtract(const Duration(hours: 4)),
        qualityStatus: InventoryQualityStatus.approved,
        createdAt: now.subtract(const Duration(days: 3)),
        updatedAt: now,
      );

      expect(expiredBatch.isExpired, isTrue);
      expect(expiredBatch.canBeListed, isFalse);
    });

    test('Validates positive production quantities and approval bounds', () {
      final invalidBatch = InventoryBatchModel(
        id: 'invalid_1',
        farmId: 'farm_01',
        batchCode: 'INV-1',
        sourceType: 'milk_production',
        producedQuantity: 100.0,
        approvedQuantity: 120.0, // Exceeds produced!
        availableQuantity: 100.0,
        baseUnit: 'litres',
        producedAt: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(() => invalidBatch.validate(), throwsA(isA<ArgumentError>()));
    });
  });

  group('Seller Profile & Membership Access Rules', () {
    test('Only approved seller profile status is eligible to publish active listings', () {
      final draftProfile = FarmMarketProfileModel(
        farmId: 'farm_01',
        publicFarmName: 'Waanofi Pastures',
        generalLocation: 'Bishoftu',
        marketplaceStatus: MarketProfileStatus.pendingReview,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(draftProfile.isEligibleToPublish, isFalse);
      expect(draftProfile.copyWith(marketplaceStatus: MarketProfileStatus.approved).isEligibleToPublish, isTrue);
    });

    test('Only Owner and Manager roles have rights to approve inventory batches', () {
      final workerMembership = FarmMembershipModel(
        id: 'm_1',
        userId: 'u_worker',
        farmId: 'farm_01',
        membershipRole: MembershipRole.worker,
        joinedAt: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final managerMembership = workerMembership.copyWith(membershipRole: MembershipRole.manager);

      expect(workerMembership.canApproveBatches, isFalse);
      expect(managerMembership.canApproveBatches, isTrue);
    });
  });
}
