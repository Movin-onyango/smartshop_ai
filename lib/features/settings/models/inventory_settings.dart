/// ---------------------------------------------------------------------------
/// InventorySettings
/// ---------------------------------------------------------------------------
///
/// Stores inventory management preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class InventorySettings {
  const InventorySettings({
    this.defaultReorderLevel = 10,
    this.lowStockThreshold = 5,
    this.trackInventory = true,
    this.trackExpiry = true,
    this.allowNegativeStock = false,
    this.enableStockAlerts = true,
    this.autoDeductStockOnSale = true,
    this.autoIncreaseStockOnPurchase = true,
  });

  /// Default reorder level assigned to new products.
  final int defaultReorderLevel;

  /// Quantity considered as low stock.
  final int lowStockThreshold;

  /// Enables inventory tracking.
  final bool trackInventory;

  /// Enables expiry date tracking.
  final bool trackExpiry;

  /// Allows products to have negative stock.
  final bool allowNegativeStock;

  /// Enables low-stock notifications.
  final bool enableStockAlerts;

  /// Automatically deduct stock after completing a sale.
  final bool autoDeductStockOnSale;

  /// Automatically increase stock after recording a purchase.
  final bool autoIncreaseStockOnPurchase;

  InventorySettings copyWith({
    int? defaultReorderLevel,
    int? lowStockThreshold,
    bool? trackInventory,
    bool? trackExpiry,
    bool? allowNegativeStock,
    bool? enableStockAlerts,
    bool? autoDeductStockOnSale,
    bool? autoIncreaseStockOnPurchase,
  }) {
    return InventorySettings(
      defaultReorderLevel:
          defaultReorderLevel ?? this.defaultReorderLevel,
      lowStockThreshold:
          lowStockThreshold ?? this.lowStockThreshold,
      trackInventory:
          trackInventory ?? this.trackInventory,
      trackExpiry:
          trackExpiry ?? this.trackExpiry,
      allowNegativeStock:
          allowNegativeStock ?? this.allowNegativeStock,
      enableStockAlerts:
          enableStockAlerts ?? this.enableStockAlerts,
      autoDeductStockOnSale:
          autoDeductStockOnSale ??
              this.autoDeductStockOnSale,
      autoIncreaseStockOnPurchase:
          autoIncreaseStockOnPurchase ??
              this.autoIncreaseStockOnPurchase,
    );
  }
}