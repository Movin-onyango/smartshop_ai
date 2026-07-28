import '../models/inventory_settings.dart';

/// ---------------------------------------------------------------------------
/// InventorySettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for InventorySettings.
/// ---------------------------------------------------------------------------
abstract final class InventorySettingsGetters {
  const InventorySettingsGetters._();

  static int defaultReorderLevel(
    InventorySettings settings,
  ) {
    return settings.defaultReorderLevel;
  }

  static int lowStockThreshold(
    InventorySettings settings,
  ) {
    return settings.lowStockThreshold;
  }

  static bool trackInventory(
    InventorySettings settings,
  ) {
    return settings.trackInventory;
  }

  static bool trackExpiry(
    InventorySettings settings,
  ) {
    return settings.trackExpiry;
  }

  static bool allowNegativeStock(
    InventorySettings settings,
  ) {
    return settings.allowNegativeStock;
  }

  static bool enableStockAlerts(
    InventorySettings settings,
  ) {
    return settings.enableStockAlerts;
  }

  static bool autoDeductStockOnSale(
    InventorySettings settings,
  ) {
    return settings.autoDeductStockOnSale;
  }

  static bool autoIncreaseStockOnPurchase(
    InventorySettings settings,
  ) {
    return settings.autoIncreaseStockOnPurchase;
  }

  static bool inventoryManagementEnabled(
    InventorySettings settings,
  ) {
    return settings.trackInventory;
  }

  static bool expiryManagementEnabled(
    InventorySettings settings,
  ) {
    return settings.trackInventory &&
        settings.trackExpiry;
  }

  static bool automaticStockUpdatesEnabled(
    InventorySettings settings,
  ) {
    return settings.autoDeductStockOnSale &&
        settings.autoIncreaseStockOnPurchase;
  }

  static bool alertsEnabled(
    InventorySettings settings,
  ) {
    return settings.trackInventory &&
        settings.enableStockAlerts;
  }

  static String stockPolicy(
    InventorySettings settings,
  ) {
    return settings.allowNegativeStock
        ? 'Negative Stock Allowed'
        : 'Negative Stock Prevented';
  }

  static String inventoryMode(
    InventorySettings settings,
  ) {
    return settings.trackInventory
        ? 'Inventory Tracking Enabled'
        : 'Inventory Tracking Disabled';
  }

  static String reorderSummary(
    InventorySettings settings,
  ) {
    return 'Reorder at ${settings.defaultReorderLevel} items';
  }

  static String lowStockSummary(
    InventorySettings settings,
  ) {
    return 'Low stock below ${settings.lowStockThreshold} items';
  }
}