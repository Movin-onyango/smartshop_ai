/// ---------------------------------------------------------------------------
/// PurchaseItem
/// ---------------------------------------------------------------------------
///
/// Represents a single line item within a purchase order.
/// ---------------------------------------------------------------------------
class PurchaseItem {
  const PurchaseItem({
    this.id,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitCost,
    this.discount = 0,
    this.tax = 0,
    this.receivedQuantity = 0,
  });

  final String? id;

  final String productId;

  final String productName;

  final double quantity;

  final double unitCost;

  final double discount;

  final double tax;

  /// Quantity already received.
  final double receivedQuantity;

  //---------------------------------------------------------------------------
  // Calculated Values
  //---------------------------------------------------------------------------

  double get subtotal {
    return quantity * unitCost;
  }

  double get discountAmount {
    return subtotal * (discount / 100);
  }

  double get taxableAmount {
    return subtotal - discountAmount;
  }

  double get taxAmount {
    return taxableAmount * (tax / 100);
  }

  double get total {
    return taxableAmount + taxAmount;
  }

  double get remainingQuantity {
    return quantity - receivedQuantity;
  }

  bool get isFullyReceived {
    return receivedQuantity >= quantity;
  }

  bool get isPartiallyReceived {
    return receivedQuantity > 0 &&
        receivedQuantity < quantity;
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  PurchaseItem copyWith({
    String? id,
    String? productId,
    String? productName,
    double? quantity,
    double? unitCost,
    double? discount,
    double? tax,
    double? receivedQuantity,
  }) {
    return PurchaseItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitCost: unitCost ?? this.unitCost,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      receivedQuantity:
          receivedQuantity ??
          this.receivedQuantity,
    );
  }
}