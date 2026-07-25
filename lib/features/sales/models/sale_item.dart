import '../../products/models/product.dart';

/// ---------------------------------------------------------------------------
/// SaleItem
/// ---------------------------------------------------------------------------
///
/// Represents a single product sold in a sale.
///
/// One sale may contain multiple SaleItems.
/// ---------------------------------------------------------------------------
class SaleItem {
  const SaleItem({
    this.id,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    this.discount = 0,
  });

  /// Unique sale item identifier.
  final String? id;

  /// Product being sold.
  final Product product;

  /// Quantity sold.
  final int quantity;

  /// Selling price per unit at the time of sale.
  ///
  /// Stored here so historical sales remain accurate even if the
  /// product price changes later.
  final double unitPrice;

  /// Discount applied to this line.
  final double discount;

  //--------------------------------------------------------------------------
  // Compatibility Getters
  //--------------------------------------------------------------------------

  /// Convenience getter used by existing widgets.
  String get productName => product.name;

  //--------------------------------------------------------------------------
  // Computed Values
  //--------------------------------------------------------------------------

  /// Total before discount.
  double get grossTotal => quantity * unitPrice;

  /// Total after discount.
  double get subtotal => grossTotal - discount;

  /// Buying cost of this quantity.
  double get cost => quantity * product.buyingPrice;

  /// Expected profit from this line.
  double get profit => subtotal - cost;

  /// Profit margin (%).
  double get profitMargin {
    if (subtotal == 0) return 0;
    return (profit / subtotal) * 100;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  SaleItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    double? unitPrice,
    double? discount,
  }) {
    return SaleItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
    );
  }
}
