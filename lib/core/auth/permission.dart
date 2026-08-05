/// Every granular permission in the Waanofi Dairy app.
///
/// Each [UserRole] maps to a fixed set of these permissions
/// via [rolePermissions] in `role_permissions.dart`.
enum Permission {
  // Milk
  viewMilk,
  recordMilk,
  editMilk,

  // Feed
  viewFeed,
  recordFeed,

  // Eggs & Poultry
  viewEggs,
  recordEggs,
  viewPoultry,
  manageFlocks,
  recordEggProduction,
  editEggProduction,
  deleteEggProduction,
  viewPoultryReports,

  // Animals
  manageAnimals,

  // Team
  manageUsers,

  // Finance
  viewFinance,

  // Data
  exportData,

  // Marketplace
  viewMarketplace,
  manageListings,
  placeOrders,
}

