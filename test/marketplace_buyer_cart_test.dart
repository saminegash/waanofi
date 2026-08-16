import 'package:flutter_test/flutter_test.dart';
import 'package:waanofi/features/marketplace/domain/buyer_account_model.dart';
import 'package:waanofi/features/marketplace/domain/delivery_address_model.dart';
import 'package:waanofi/features/marketplace/domain/public_listing_model.dart';
import 'package:waanofi/features/marketplace/domain/cart_model.dart';
import 'package:waanofi/features/marketplace/presentation/controllers/cart_controller.dart';

void main() {
  group('Phase 4: Buyer Marketplace, Farm-Specific Cart & Order Preparation Suite', () {
    final now = DateTime.now();

    const mockListingFarmA = PublicListingModel(
      listingId: 'listing-a1',
      farmId: 'farm-alpha-100',
      listingStatus: 'active',
      publicTitle: 'Organic Pasture Fresh Milk',
      publicDescription: 'Unpasteurized chilled morning whole milk.',
      sellingUnit: 'L',
      unitConversion: '1 L',
      priceInMinorUnits: 12000, // 120.00 ETB
      currency: 'ETB',
      minimumOrderQuantity: 5,
      maximumOrderQuantity: 50,
      availableFulfilmentMethods: ['pickup', 'delivery'],
      productCode: 'MILK_RAW_L',
      category: 'fresh_milk',
      productNameEn: 'Fresh Milk',
      publicFarmName: 'Alpha Green Dairy Farm',
      generalLocation: 'Bishoftu, Oromia',
      pickupAvailability: true,
      deliveryAvailability: true,
      approximateAvailableQuantity: 40.0,
    );

    const mockListingFarmB = PublicListingModel(
      listingId: 'listing-b1',
      farmId: 'farm-beta-200',
      listingStatus: 'active',
      publicTitle: 'Free-Range Brown Eggs (Tray of 30)',
      publicDescription: 'Farm fresh pasture eggs collected daily.',
      sellingUnit: 'trays',
      unitConversion: '30 eggs per tray',
      priceInMinorUnits: 45000, // 450.00 ETB
      currency: 'ETB',
      minimumOrderQuantity: 2,
      maximumOrderQuantity: 20,
      availableFulfilmentMethods: ['pickup'],
      productCode: 'EGGS_TRAY_30',
      category: 'eggs',
      productNameEn: 'Eggs Tray',
      publicFarmName: 'Beta Poultry Farm',
      generalLocation: 'Addis Ababa',
      pickupAvailability: true,
      deliveryAvailability: false,
      approximateAvailableQuantity: 15.0,
    );

    test('1. Public Listing Visibility & Financial santim conversions', () {
      expect(mockListingFarmA.priceEtb, equals(120.0));
      expect(mockListingFarmA.formattedPriceEtb, equals('120.00 ETB / L'));
      expect(mockListingFarmA.canBeOrdered, isTrue);
      expect(mockListingFarmA.supportsPickup, isTrue);
      expect(mockListingFarmA.supportsDelivery, isTrue);
    });

    test('2. Single-Farm Cart Lock enforcement & Replacement Dialog trigger', () {
      final controller = CartController();

      // Step 1: Add item from Farm A
      final resA = controller.addItem(mockListingFarmA, quantity: 10);
      expect(resA.isSuccess, isTrue);
      expect(controller.state.farmId, equals('farm-alpha-100'));
      expect(controller.state.farmName, equals('Alpha Green Dairy Farm'));
      expect(controller.state.itemCount, equals(10));

      // Step 2: Attempt to add item from Farm B (should block and trigger conflict)
      final resB = controller.addItem(mockListingFarmB, quantity: 5);
      expect(resB.isSuccess, isFalse);
      expect(resB.isFarmConflict, isTrue);
      expect(resB.existingFarmName, equals('Alpha Green Dairy Farm'));
      expect(resB.newFarmName, equals('Beta Poultry Farm'));

      // Verify cart remains locked to Farm A
      expect(controller.state.farmId, equals('farm-alpha-100'));
      expect(controller.state.items.length, equals(1));

      // Step 3: Explicitly clear cart and add Farm B item
      final resClear = controller.clearAndAddItem(mockListingFarmB, quantity: 4);
      expect(resClear.isSuccess, isTrue);
      expect(controller.state.farmId, equals('farm-beta-200'));
      expect(controller.state.farmName, equals('Beta Poultry Farm'));
      expect(controller.state.items.first.listingId, equals('listing-b1'));
      expect(controller.state.itemCount, equals(4));
    });

    test('3. Quantity Bounds Validation (MOQ, Maximum Order Quantity & Stock)', () {
      final controller = CartController();

      // Below Minimum Order Quantity (MOQ is 5 L for milk)
      final resLow = controller.addItem(mockListingFarmA, quantity: 3);
      expect(resLow.isSuccess, isFalse);
      expect(resLow.type, equals(CartActionResultType.validationError));
      expect(resLow.message, contains('below Minimum Order Quantity'));

      // Above available stock (approximate available is 40 L)
      final resStock = controller.addItem(mockListingFarmA, quantity: 45);
      expect(resStock.isSuccess, isFalse);
      expect(resStock.message, contains('exceeds currently available stock'));

      // Valid MOQ addition
      final resValid = controller.addItem(mockListingFarmA, quantity: 10);
      expect(resValid.isSuccess, isTrue);
      expect(controller.state.itemsTotalEtb, equals(1200.0)); // 10 x 120 ETB

      // Update quantity above Max Order Quantity (Max is 50 L)
      final resUpdateMax = controller.updateQuantity('listing-a1', 55);
      expect(resUpdateMax.isSuccess, isFalse);
      expect(resUpdateMax.message, contains('cannot exceed Maximum Order Quantity'));
    });

    test('4. Paused and OutOfStock listings rejection', () {
      final controller = CartController();

      final pausedListing = mockListingFarmA.copyWith(listingStatus: 'paused');
      final resPaused = controller.addItem(pausedListing, quantity: 10);
      expect(resPaused.isSuccess, isFalse);
      expect(resPaused.message, contains('Paused listings'));

      final outOfStockListing = mockListingFarmA.copyWith(approximateAvailableQuantity: 0.0);
      final resOut = controller.addItem(outOfStockListing, quantity: 10);
      expect(resOut.isSuccess, isFalse);
      expect(resOut.message, contains('out of stock'));
    });

    test('5. Offline Checkout Blocking & Online Review Validation', () {
      final controller = CartController();
      controller.addItem(mockListingFarmA, quantity: 10);
      controller.setFulfilmentMethod('delivery');

      // Attempt checkout offline -> strictly blocked!
      final resOffline = controller.validateForCheckout(isOffline: true);
      expect(resOffline.isSuccess, isFalse);
      expect(resOffline.type, equals(CartActionResultType.offlineBlocked));

      // Online checkout attempt without selecting delivery address -> error
      final resNoAddress = controller.validateForCheckout(isOffline: false);
      expect(resNoAddress.isSuccess, isFalse);
      expect(resNoAddress.message, contains('delivery address'));

      // Assign delivery address
      controller.setDeliveryAddress('addr-123');
      final resOnlineValid = controller.validateForCheckout(isOffline: false);
      expect(resOnlineValid.isSuccess, isTrue);

      // Verify grand total calculation with flat delivery fee estimate (150 ETB)
      expect(controller.state.grandTotalEtb, equals(1350.0)); // 1200 + 150
    });

    test('6. Data Privacy Shielding verification', () {
      // Assert that PublicListingModel doesn't leak private internal production details
      final json = mockListingFarmA.toJson();
      expect(json.containsKey('worker_id'), isFalse);
      expect(json.containsKey('production_batch_cost'), isFalse);
      expect(json.containsKey('feed_type_id'), isFalse);
      expect(json.containsKey('flock_health_notes'), isFalse);
    });

    test('7. Delivery Address Model hierarchy without mandatory GPS coordinates', () {
      final address = DeliveryAddressModel(
        id: 'addr-xyz',
        buyerId: 'user-789',
        label: 'Cafe Branch #2',
        recipientName: 'Abebe Bikila',
        phone: '+251911234567',
        region: 'Addis Ababa',
        city: 'Addis Ababa',
        subCity: 'Bole',
        neighborhood: 'Gerji',
        landmark: 'Behind Roba Bakery',
        isDefault: true,
        createdAt: now,
        updatedAt: now,
      );

      expect(address.hasCoordinates, isFalse);
      expect(address.fullAddressDisplay, equals('Gerji, Bole, Addis Ababa (Behind Roba Bakery)'));
      expect(address.isDefault, isTrue);
    });

    test('8. Dual Identity Coexistence (Farmer operating institutional Buyer Account)', () {
      // User who is an existing Farm Owner creates an institutional Cafe Buyer Account
      final buyerAccount = BuyerAccountModel(
        userId: 'farmer-owner-account-id',
        buyerType: BuyerType.cafe,
        organizationName: 'Buna & Milk Cafe Enterprise',
        contactName: 'Selamawit Tessema',
        phone: '+251922334455',
        email: 'selam@bunamilk.et',
        taxNumber: 'TIN-99887766',
        verificationStatus: 'verified',
        preferredLanguage: 'am',
        createdAt: now,
        updatedAt: now,
      );

      expect(buyerAccount.isInstitutional, isTrue);
      expect(buyerAccount.isVerified, isTrue);
      expect(buyerAccount.buyerType, equals(BuyerType.cafe));
      expect(buyerAccount.userId, equals('farmer-owner-account-id'));
    });
  });
}
