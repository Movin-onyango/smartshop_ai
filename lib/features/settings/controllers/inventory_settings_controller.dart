import '../getters/inventory_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// InventorySettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Inventory Settings.
/// ---------------------------------------------------------------------------
class InventorySettingsController extends SettingsController {
  const InventorySettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  int get defaultReorderLevel =>
      InventorySettingsGetters.defaultReorderLevel(
        inventory,
      );

  int get lowStockThreshold =>
      InventorySettingsGetters.lowStockThreshold(
        inventory,
      );

  bool get trackInventory =>
      InventorySettingsGetters.trackInventory(
        inventory,
      );

  bool get trackExpiry =>
      InventorySettingsGetters.trackExpiry(
        inventory,
      );

  bool get allowNegativeStock =>
      InventorySettingsGetters.allowNegativeStock(
        inventory,
      );

  bool get enableStockAlerts =>
      InventorySettingsGetters.enableStockAlerts(
        inventory,
      );

  bool get autoDeductStockOnSale =>
      InventorySettingsGetters.autoDeductStockOnSale(
        inventory,
      );

  bool get autoIncreaseStockOnPurchase =>
      InventorySettingsGetters.autoIncreaseStockOnPurchase(
        inventory,
      );

  bool get inventoryManagementEnabled =>
      InventorySettingsGetters.inventoryManagementEnabled(
        inventory,
      );

  bool get expiryManagementEnabled =>
      InventorySettingsGetters.expiryManagementEnabled(
        inventory,
      );

  bool get automaticStockUpdatesEnabled =>
      InventorySettingsGetters.automaticStockUpdatesEnabled(
        inventory,
      );

  bool get alertsEnabled =>
      InventorySettingsGetters.alertsEnabled(
        inventory,
      );

  String get stockPolicy =>
      InventorySettingsGetters.stockPolicy(
        inventory,
      );

  String get inventoryMode =>
      InventorySettingsGetters.inventoryMode(
        inventory,
      );

  String get reorderSummary =>
      InventorySettingsGetters.reorderSummary(
        inventory,
      );

  String get lowStockSummary =>
      InventorySettingsGetters.lowStockSummary(
        inventory,
      );

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void editDefaultReorderLevel() {}

  /// TODO: Connect to repository update.
  void setTrackInventory(bool value) {}

  /// TODO: Connect to repository update.
  void setTrackExpiry(bool value) {}

  /// TODO: Connect to repository update.
  void setAllowNegativeStock(bool value) {}

  /// TODO: Connect to repository update.
  void setEnableStockAlerts(bool value) {}

  /// TODO: Connect to repository update.
  void setAutoDeductStockOnSale(bool value) {}

  /// TODO: Connect to repository update.
  void setAutoIncreaseStockOnPurchase(bool value) {}
}