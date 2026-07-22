import '../../products/models/product.dart';

/// ---------------------------------------------------------------------------
/// InventoryItem
/// ---------------------------------------------------------------------------
///
/// Represents the live inventory information for a product.
///
/// Product = What is sold
/// Inventory = Current stock state
/// ---------------------------------------------------------------------------
class InventoryItem {
  const InventoryItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.reorderLevel,
    required this.lastUpdated,
  });

  final String id;

  /// Associated product.
  final Product product;

  /// Current stock.
  final int quantity;

  /// Minimum stock before reorder.
  final int reorderLevel;

  /// Last inventory update.
  final DateTime lastUpdated;

  //--------------------------------------------------------------------------
  // Computed Properties
  //--------------------------------------------------------------------------

  bool get isOutOfStock => quantity <= 0;

  bool get isLowStock =>
      quantity > 0 && quantity <= reorderLevel;

  double get stockValue =>
      quantity * product.buyingPrice;

  double get retailValue =>
      quantity * product.sellingPrice;

  double get expectedProfit =>
      retailValue - stockValue;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  InventoryItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    int? reorderLevel,
    DateTime? lastUpdated,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      reorderLevel: reorderLevel ?? this.reorderLevel,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}