// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Waanofi Dairy';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get herd => 'Herd';

  @override
  String get reports => 'Reports';

  @override
  String get more => 'More';

  @override
  String get recordMilk => 'Record Milk';

  @override
  String get recordFeed => 'Record Feed';

  @override
  String get settings => 'Settings & More';

  @override
  String get logout => 'Sign Out';

  @override
  String get language => 'Language';

  @override
  String get preferences => 'Preferences';

  @override
  String get account => 'Account';

  @override
  String get adminTools => 'Admin Tools';

  @override
  String get manageWorkers => 'Manage Workers';

  @override
  String get manageFeedTypes => 'Manage Feed Types';

  @override
  String get farmSettings => 'Farm Settings';

  @override
  String get milkPricePerLitre => 'Milk Price per Litre (ETB)';

  @override
  String get onboardingTitle1 => 'Track Your Herd';

  @override
  String get onboardingDesc1 =>
      'Easily manage your dairy cows, their health status, and production records.';

  @override
  String get onboardingTitle2 => 'Record Daily Milk';

  @override
  String get onboardingDesc2 =>
      'Log milk production per cow or at the farm level with intuitive forms.';

  @override
  String get onboardingTitle3 => 'Analyze Performance';

  @override
  String get onboardingDesc3 =>
      'View dynamic charts, profit/loss metrics, and identify your top producers.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInToContinue => 'Sign in to continue';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get sendMagicLink => 'Send Magic Link';

  @override
  String get enterEmailFirst => 'Enter your email first';

  @override
  String get checkEmailForLink => 'Check your email for a sign-in link!';

  @override
  String get backToSignIn => 'Back to sign in';

  @override
  String get noAccountSignUp => 'Don\'t have an account? Create one';

  @override
  String get hasAccountSignIn => 'Already have an account? Sign in';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createAccountAndFarm => 'Create Account & Farm';

  @override
  String get setUpYourDairy => 'Set up your dairy';

  @override
  String get fullName => 'Full Name';

  @override
  String get farmName => 'Farm Name';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get farmNameRequired => 'Farm name is required';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get validEmailRequired => 'Enter a valid email';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get required => 'Required';

  @override
  String get todaysMilk => 'Today\'s Milk';

  @override
  String get thirtyDayTrend => '30D Trend';

  @override
  String get thirtyDayProfit => '30D Profit';

  @override
  String get thirtyDayMilkTrend => '30 Day Milk Trend';

  @override
  String get noDataThirtyDays => 'No data for the last 30 days';

  @override
  String get financialOverview => 'Financial Overview (30 Days)';

  @override
  String get revenue => 'Revenue';

  @override
  String get feedCost => 'Feed Cost';

  @override
  String get herdStatus => 'Herd Status';

  @override
  String get topProducers => 'Top Producers (30 Days)';

  @override
  String get noRecords => 'No records';

  @override
  String get failedToLoadDashboard => 'Failed to load dashboard';

  @override
  String get herdManagement => 'Herd Management';

  @override
  String get offlineMode => 'Offline mode - showing cached data';

  @override
  String get searchTagOrName => 'Search tag or name...';

  @override
  String get status => 'Status';

  @override
  String get breed => 'Breed';

  @override
  String get allStatuses => 'All Statuses';

  @override
  String get active => 'Active';

  @override
  String get dry => 'Dry';

  @override
  String get pregnant => 'Pregnant';

  @override
  String get sick => 'Sick';

  @override
  String get sold => 'Sold';

  @override
  String get deceased => 'Deceased';

  @override
  String get allBreeds => 'All Breeds';

  @override
  String get noAnimalsFound => 'No animals found';

  @override
  String get emptyHerdDesc =>
      'Your herd is currently empty or no animals match your filter.';

  @override
  String get addAnimal => 'Add Animal';

  @override
  String get unnamed => 'Unnamed';

  @override
  String get unknownBreed => 'Unknown breed';

  @override
  String get newAnimal => 'New Animal';

  @override
  String get editAnimal => 'Edit Animal';

  @override
  String get tagNumber => 'Tag Number *';

  @override
  String get nameOptional => 'Name (Optional)';

  @override
  String get breedOptional => 'Breed (Optional)';

  @override
  String get sex => 'Sex';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get selectDate => 'Select Date';

  @override
  String get save => 'Save';

  @override
  String get saving => 'Saving...';

  @override
  String get cancel => 'Cancel';

  @override
  String get notFound => 'Not Found';

  @override
  String get animalNotFound => 'Animal not found.';

  @override
  String get info => 'Info';

  @override
  String get milk => 'Milk';

  @override
  String get feed => 'Feed';

  @override
  String get milkHistoryComingSoon => 'Milk history coming soon';

  @override
  String get feedHistoryComingSoon => 'Feed history coming soon';

  @override
  String get saveBatch => 'Save Batch';

  @override
  String get savedLocally => 'Saved locally. Will sync when online.';

  @override
  String get feedRecordedSecurely => 'Feed recorded securely!';

  @override
  String get selectFeedTypeFirst => 'Please select a Feed Type first.';

  @override
  String get farmWideEntry => 'Farm-wide Entry';

  @override
  String get perAnimalEntry => 'Per Animal Entry';

  @override
  String get enterTotalQuantity =>
      'Enter total quantity distributed to the herd:';

  @override
  String get estimatedCost => 'Estimated Cost (Hidden from Workers):';

  @override
  String get saveFeed => 'Save Feed';

  @override
  String get noActiveFeedTypes => 'No Feed Types (Ask Admin)';

  @override
  String get feedType => 'Feed Type';

  @override
  String get date => 'Date';

  @override
  String get noActiveAnimals => 'No active animals found.';

  @override
  String get session => 'Session';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get evening => 'Evening';

  @override
  String get adminConsole => 'Admin Console';

  @override
  String get workers => 'Workers';

  @override
  String get auditLog => 'Audit Log';

  @override
  String get addNewWorker => 'Add New Worker';

  @override
  String get role => 'Role';

  @override
  String get workerUser => 'Worker (User)';

  @override
  String get admin => 'Admin';

  @override
  String get createAccountBtn => 'Create Account';

  @override
  String get workerCreatedSuccess => 'Worker created successfully!';

  @override
  String get currentTeam => 'Current Team';

  @override
  String get deactivated => 'Deactivated';

  @override
  String get noAuditLogs => 'No audit logs available.';

  @override
  String get modified => 'modified';

  @override
  String get created => 'Created';

  @override
  String get deleted => 'Deleted';

  @override
  String get addFeedType => 'Add Feed Type';

  @override
  String get feedName => 'Feed Name (e.g. Alfalfa)';

  @override
  String get unit => 'Unit (e.g. kg, bales)';

  @override
  String get costPerUnit => 'Cost per Unit';

  @override
  String get mustBeNumber => 'Must be a number';

  @override
  String get noFeedTypesConfigured => 'No feed types configured yet.';

  @override
  String get exportPdf => 'Export PDF';

  @override
  String get exportCsv => 'Export CSV';

  @override
  String get groupBy => 'Group By';

  @override
  String get byDay => 'By Day';

  @override
  String get byMonth => 'By Month';

  @override
  String get byAnimal => 'By Animal';

  @override
  String get noDataForPeriod => 'No data for this period.';

  @override
  String get sessions => 'sessions';

  @override
  String savedToPath(String path) {
    return 'Saved to $path';
  }

  @override
  String get errorSomethingWrong => 'Oops! Something went wrong.';

  @override
  String get error => 'Error';

  @override
  String get recordEggs => 'Record Eggs';

  @override
  String get marketplace => 'Marketplace';

  @override
  String get flockName => 'Flock Name';

  @override
  String get flockNameHint => 'e.g. House A, Pasture 1';

  @override
  String get productionType => 'Production Type';

  @override
  String get eggQuantity => 'Egg Quantity';

  @override
  String get brokenCount => 'Broken Count';

  @override
  String get totalEggs => 'Total Eggs';

  @override
  String get goodEggs => 'Good Eggs';

  @override
  String get broken => 'Broken';

  @override
  String get notesOptional => 'Notes (Optional)';

  @override
  String get freeRange => 'Free Range';

  @override
  String get caged => 'Caged';

  @override
  String get organic => 'Organic';

  @override
  String get myOrders => 'My Orders';

  @override
  String get allCategories => 'All';

  @override
  String get freshMilk => 'Fresh Milk';

  @override
  String get eggs => 'Eggs';

  @override
  String get retry => 'Retry';

  @override
  String get noListings => 'No marketplace listings found.';

  @override
  String get productDetails => 'Product Details';

  @override
  String get pricePerUnit => 'Price';

  @override
  String get available => 'Available';

  @override
  String get description => 'Description';

  @override
  String get orderNow => 'Order Now';

  @override
  String get outOfStock => 'Out of Stock';

  @override
  String get checkout => 'Checkout';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get quantity => 'Quantity';

  @override
  String get maxAvailable => 'Max available';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get deliveryNotesOptional => 'Delivery Notes (Optional)';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get processing => 'Processing...';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get checkoutRequiresInternet =>
      'Checkout requires internet connection.';

  @override
  String get orderPlaced => 'Order Placed Successfully!';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get continueShopping => 'Continue Shopping';

  @override
  String get viewOrders => 'View Orders';

  @override
  String get cashOnDelivery => 'Cash on Delivery';

  @override
  String get payOnDeliveryDesc => 'Pay cash when your order is delivered.';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get bankTransfer => 'Bank Transfer';

  @override
  String get bankTransferDesc => 'Direct bank deposit or Telebirr transfer.';

  @override
  String get noOrders => 'No orders found.';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusProcessing => 'Processing';

  @override
  String get statusReady => 'Ready for Delivery';

  @override
  String get statusOutForDelivery => 'Out for Delivery';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get deliveryPending => 'Delivery Pending';

  @override
  String get deliveryAssigned => 'Driver Assigned';

  @override
  String get deliveryPickedUp => 'Picked Up';

  @override
  String get deliveryInTransit => 'In Transit';

  @override
  String get deliveryDelivered => 'Delivered';

  @override
  String get deliveryFailed => 'Delivery Failed';

  @override
  String get incomingOrders => 'Incoming Orders';

  @override
  String get noIncomingOrders => 'No incoming orders yet.';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String get cancelOrderConfirm =>
      'Are you sure you want to cancel this order?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get confirmOrder => 'Confirm';

  @override
  String get startProcessing => 'Process';

  @override
  String get markReady => 'Mark Ready';

  @override
  String get sendForDelivery => 'Dispatch';

  @override
  String get markDelivered => 'Delivered';

  @override
  String get poultryManagement => 'Poultry & Eggs Management';

  @override
  String get poultryReports => 'Poultry Reports';

  @override
  String get recordDailyEggs => 'Record Daily Eggs';

  @override
  String get addFlock => 'Add Flock';

  @override
  String get activeFlocks => 'Active Flocks';

  @override
  String get layingHens => 'Laying Hens';

  @override
  String get todayGoodEggs => 'Today\'s Good Eggs';

  @override
  String get trays => 'trays';

  @override
  String get loose => 'loose';

  @override
  String get flocks => 'Flocks';

  @override
  String get viewAll => 'View All';

  @override
  String get noFlocksRecorded => 'No flocks recorded yet.';

  @override
  String get birds => 'birds';

  @override
  String get layingRate => 'laying rate';

  @override
  String get pleaseSelectFlock => 'Please select a flock.';

  @override
  String get allocationExceedsCollectedError =>
      'Allocated eggs cannot exceed good eggs collected.';

  @override
  String get eggRecordSaved => 'Egg production record saved successfully!';

  @override
  String get selectFlock => 'Select Flock';

  @override
  String get productionDate => 'Production Date';

  @override
  String get collectedEggs => 'Collected Eggs';

  @override
  String get crackedEggs => 'Cracked Eggs';

  @override
  String get rejectedEggs => 'Rejected Eggs';

  @override
  String get eggAllocations => 'Egg Allocations';

  @override
  String get farmUseEggs => 'Farm Use Eggs';

  @override
  String get soldDirectlyEggs => 'Sold Directly Eggs';

  @override
  String get availableForSale => 'Available for Sale';

  @override
  String get fullTrays => 'full trays';

  @override
  String get eggsPerTray => 'eggs/tray';

  @override
  String get looseEggs => 'loose eggs';

  @override
  String get saveRecord => 'Save Record';

  @override
  String get editFlock => 'Edit Flock';

  @override
  String get flockCode => 'Flock Code';

  @override
  String get flockPurpose => 'Purpose';

  @override
  String get totalBirds => 'Total Birds';

  @override
  String get hensCannotExceedBirds => 'Laying hens cannot exceed total birds.';

  @override
  String get flockSaved => 'Flock saved successfully!';

  @override
  String get fieldRequired => 'This field is required.';

  @override
  String get flockDetails => 'Flock Details';

  @override
  String get recordAdjustment => 'Record Adjustment';

  @override
  String get recentProduction => 'Recent Egg Production';

  @override
  String get populationAdjustments => 'Population Adjustments';

  @override
  String get noEggRecordsFound => 'No recent egg records found.';

  @override
  String get noAdjustmentsRecorded => 'No adjustments recorded yet.';

  @override
  String get adjustmentExceedsCurrentBirds =>
      'Adjustment exceeds currently available birds.';

  @override
  String get adjustmentRecorded =>
      'Population adjustment recorded successfully!';

  @override
  String get adjustmentType => 'Adjustment Type';

  @override
  String get birdQuantity => 'Number of Birds';

  @override
  String get layingHensInvolved => 'Laying Hens Involved';

  @override
  String get reasonOptional => 'Reason (Optional)';

  @override
  String get productionSummary => 'Production Summary';

  @override
  String get sevenDayOutput => '7-Day Good Eggs';

  @override
  String get thirtyDayOutput => '30-Day Good Eggs';

  @override
  String get productionPerHen => 'Laying Rate (Per Hen)';

  @override
  String get thirtyDayAverage => '30-Day Average';

  @override
  String get rejectedOrCracked => 'Cracked & Rejected';

  @override
  String get lastThirtyDays => 'Last 30 Days';

  @override
  String get farmType => 'Farm Type';

  @override
  String get dairyFarm => 'Dairy Farm';

  @override
  String get poultryFarm => 'Poultry Farm';

  @override
  String get mixedFarm => 'Mixed Farm (Dairy & Poultry)';

  @override
  String get sellerHub => 'Marketplace Seller Hub';

  @override
  String get publicSellerProfile => 'Public Seller Profile';

  @override
  String get verificationSubmission => 'Verification Submission';

  @override
  String get inventoryBatches => 'Inventory Batches';

  @override
  String get createMilkBatch => 'Create Milk Batch';

  @override
  String get createEggBatch => 'Create Egg Batch';

  @override
  String get qualityCheck => 'Quality Inspection';

  @override
  String get activeListings => 'Active Listings';

  @override
  String get availableMilk => 'Available Milk (L)';

  @override
  String get availableEggTrays => 'Available Egg Trays';

  @override
  String get batchesNearingExpiry => 'Batches Nearing Expiry';

  @override
  String get rejectedBatches => 'Rejected Batches';

  @override
  String get pendingApprovals => 'Pending Approvals';

  @override
  String get createListing => 'Create Listing';

  @override
  String get editListing => 'Edit Listing';

  @override
  String get pauseListing => 'Pause Listing';

  @override
  String get resumeListing => 'Resume Listing';

  @override
  String get markOutOfStock => 'Mark Out of Stock';

  @override
  String get buyerAccount => 'Buyer Account';

  @override
  String get buyerType => 'Buyer Type';

  @override
  String get household => 'Household / Personal';

  @override
  String get retailShop => 'Retail Shop';

  @override
  String get cafe => 'Café';

  @override
  String get restaurant => 'Restaurant';

  @override
  String get hotel => 'Hotel';

  @override
  String get bakery => 'Bakery';

  @override
  String get school => 'School / University';

  @override
  String get institution => 'Institution / Government';

  @override
  String get otherBusiness => 'Other Business';

  @override
  String get organizationName => 'Organization / Business Name';

  @override
  String get taxNumberOptional => 'Tax Identification Number (TIN - Optional)';

  @override
  String get deliveryAddresses => 'Delivery Addresses';

  @override
  String get addAddress => 'Add Address';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get addressLabel => 'Address Label (e.g., Home, Cafe Branch)';

  @override
  String get recipientName => 'Recipient Name';

  @override
  String get region => 'Region';

  @override
  String get city => 'City / Town';

  @override
  String get subCity => 'Sub-City / Woreda';

  @override
  String get neighborhood => 'Neighborhood / Kebele / Sefer';

  @override
  String get landmark => 'Near Landmark';

  @override
  String get setDefaultAddress => 'Set as default delivery address';

  @override
  String get farmCart => 'Farm Cart';

  @override
  String get cartClearPrompt =>
      'Your cart has items from another farm. Each farm requires a separate order. Clear cart and add this item?';

  @override
  String get clearAndAdd => 'Clear Cart and Add';

  @override
  String get minimumOrderQuantity => 'Minimum Order Quantity';

  @override
  String get maximumOrderQuantity => 'Maximum Order Quantity';

  @override
  String get fulfilmentMethod => 'Fulfilment Method';

  @override
  String get pickupAtFarm => 'Pickup at Farm';

  @override
  String get deliveryToAddress => 'Delivery to Address';

  @override
  String get deliverySlot => 'Delivery Time Slot';

  @override
  String get morningSlot => 'Morning (6:00 AM - 10:00 AM)';

  @override
  String get afternoonSlot => 'Afternoon (2:00 PM - 6:00 PM)';

  @override
  String get lastRefreshed => 'Cached data. Last refreshed';

  @override
  String get sellerProducts => 'Seller Products';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get itemAddedToCart => 'Item added to cart';

  @override
  String get proceedToReview => 'Review Order Summary';
}
