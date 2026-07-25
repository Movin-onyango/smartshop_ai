import 'purchase_item.dart';
import 'purchase_status.dart';

/// ---------------------------------------------------------------------------
/// Purchase
/// ---------------------------------------------------------------------------
///
/// Represents a purchase order placed with a supplier.
/// ---------------------------------------------------------------------------
class Purchase {
  const Purchase({
    this.id,
    required this.purchaseNumber,
    required this.supplierId,
    required this.supplierName,
    required this.orderDate,
    this.expectedDeliveryDate,
    this.receivedDate,
    this.status = PurchaseStatus.draft,
    this.items = const [],
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;

  final String purchaseNumber;

  final String supplierId;

  final String supplierName;

  final DateTime orderDate;

  final DateTime? expectedDeliveryDate;

  final DateTime? receivedDate;

  final PurchaseStatus status;

  final List<PurchaseItem> items;

  final String? notes;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  //--------------------------------------------------------------------------
  // Calculated Values
  //--------------------------------------------------------------------------

  int get totalItems => items.length;

  double get totalQuantity {
    return items.fold(0.0, (sum, item) => sum + item.quantity);
  }

  double get totalReceivedQuantity {
    return items.fold(0.0, (sum, item) => sum + item.receivedQuantity);
  }

  double get subtotal {
    return items.fold(0.0, (sum, item) => sum + item.subtotal);
  }

  double get totalDiscount {
    return items.fold(0.0, (sum, item) => sum + item.discountAmount);
  }

  double get taxableAmount {
    return subtotal - totalDiscount;
  }

  double get totalTax {
    return items.fold(0.0, (sum, item) => sum + item.taxAmount);
  }

  double get grandTotal {
    return items.fold(0.0, (sum, item) => sum + item.total);
  }

  bool get isFullyReceived {
    return items.isNotEmpty && items.every((item) => item.isFullyReceived);
  }

  bool get isPartiallyReceived {
    return items.any((item) => item.receivedQuantity > 0) && !isFullyReceived;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Purchase copyWith({
    String? id,
    String? purchaseNumber,
    String? supplierId,
    String? supplierName,
    DateTime? orderDate,
    DateTime? expectedDeliveryDate,
    DateTime? receivedDate,
    PurchaseStatus? status,
    List<PurchaseItem>? items,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Purchase(
      id: id ?? this.id,
      purchaseNumber: purchaseNumber ?? this.purchaseNumber,
      supplierId: supplierId ?? this.supplierId,
      supplierName: supplierName ?? this.supplierName,
      orderDate: orderDate ?? this.orderDate,
      expectedDeliveryDate: expectedDeliveryDate ?? this.expectedDeliveryDate,
      receivedDate: receivedDate ?? this.receivedDate,
      status: status ?? this.status,
      items: items ?? this.items,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
