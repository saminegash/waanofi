import 'package:flutter_test/flutter_test.dart';
import 'package:waanofi/features/eggs/domain/egg_record_model.dart';
import 'package:waanofi/features/marketplace/domain/marketplace_listing_model.dart';
import 'package:waanofi/features/marketplace/domain/order_model.dart';
import 'package:waanofi/features/marketplace/domain/production_batch_model.dart';

void main() {
  group('EggRecordModel Test', () {
    test('Calculates good eggs correctly', () {
      final now = DateTime(2026, 8, 5);
      final record = EggRecordModel(
        id: 'egg-1',
        farmId: 'farm-1',
        flockName: 'House A',
        productionType: EggProductionType.freeRange,
        quantity: 150,
        brokenCount: 5,
        recordedAt: now,
        createdAt: now,
      );

      expect(record.goodEggs, equals(145));
    });

    test('JSON serialization maintains enums and types', () {
      final json = {
        'id': 'egg-2',
        'farm_id': 'farm-1',
        'flock_name': 'Pasture 1',
        'production_type': 'organic',
        'quantity': 300,
        'broken_count': 0,
        'recorded_at': '2026-08-05T00:00:00.000',
        'created_at': '2026-08-05T00:00:00.000',
      };

      final record = EggRecordModel.fromJson(json);
      expect(record.productionType, equals(EggProductionType.organic));
      expect(record.goodEggs, equals(300));
    });
  });

  group('Marketplace Financial & Domain Tests', () {
    test('MarketplaceListingModel formats minor units correctly as ETB', () {
      final now = DateTime(2026, 8, 5);
      final listing = MarketplaceListingModel(
        id: 'list-1',
        farmId: 'farm-1',
        batchId: 'batch-1',
        category: ProductCategory.eggs,
        title: 'Fresh Organic Eggs - Tray of 30',
        unitPriceMinor: 65000, // 650.00 ETB in santim (minor units)
        quantityAvailable: 20,
        unit: 'tray',
        createdAt: now,
        updatedAt: now,
      );

      expect(listing.priceFormatted, equals('650.00'));
      expect(listing.category, equals(ProductCategory.eggs));
    });

    test('OrderModel formatting and enum matching', () {
      final now = DateTime(2026, 8, 5);
      final order = OrderModel(
        id: 'order-1',
        orderNumber: 'ORD-20260805-0001',
        sellerFarmId: 'farm-1',
        buyerId: 'buyer-1',
        buyerName: 'Abebe Bikila',
        subtotalMinor: 130000,
        totalAmountMinor: 130000, // 1,300.00 ETB
        paymentStatus: PaymentStatus.unpaid,
        paymentMethod: PaymentMethod.cashOnDelivery,
        deliveryAddress: 'Bole, Addis Ababa',
        status: MarketplaceOrderStatus.pending,
        createdAt: now,
        updatedAt: now,
      );

      expect(order.totalFormatted, equals('1300.00'));
      expect(order.status, equals(MarketplaceOrderStatus.pending));
    });
  });
}
