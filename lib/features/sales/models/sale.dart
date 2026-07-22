import 'payment.dart';
import 'sale_item.dart';

/// ---------------------------------------------------------------------------
/// Sale
/// ---------------------------------------------------------------------------
///
/// Represents a completed sales transaction.
///
/// A Sale consists of:
/// • Invoice information
/// • Customer information (optional)
/// • Payment information
/// • One or more SaleItems
/// ---------------------------------------------------------------------------
class Sale {
  const Sale({
    this.id,
    required this.invoiceNumber,
    required this.items,
    required this.payment,
    required this.saleDate,
    this.customerId,
    this.customerName,
    this.notes,
  });

  /// Unique sale identifier.
  final String? id;

  /// Invoice / Receipt number.
  final String invoiceNumber;

  /// Products sold.
  final List<SaleItem> items;

  /// Payment information.
  final Payment payment;

  /// Date and time of sale.
  final DateTime saleDate;

  /// Optional customer ID.
  final String? customerId;

  /// Optional customer name.
  final String? customerName;

  /// Optional notes.
  final String? notes;

  //--------------------------------------------------------------------------
  // Convenience Getters
  //--------------------------------------------------------------------------

  /// Whether this sale has an attached customer.
  bool get hasCustomer =>
      customerName != null &&
      customerName!.trim().isNotEmpty;

  /// Number of different products.
  int get totalItems => items.length;

  /// Total quantity sold.
  int get totalQuantity =>
      items.fold(0, (sum, item) => sum + item.quantity);

  /// Total before discounts.
  double get grossTotal =>
      items.fold(0.0, (sum, item) => sum + item.grossTotal);

  /// Total discounts.
  double get totalDiscount =>
      items.fold(0.0, (sum, item) => sum + item.discount);

  /// Final amount payable.
  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.subtotal);

  /// Total buying cost.
  double get totalCost =>
      items.fold(0.0, (sum, item) => sum + item.cost);

  /// Expected profit.
  double get profit =>
      subtotal - totalCost;

  /// Compatibility getter for older widgets.
  double get totalProfit => profit;

  /// Overall profit margin.
  double get profitMargin {
    if (subtotal == 0) return 0;
    return (profit / subtotal) * 100;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Sale copyWith({
    String? id,
    String? invoiceNumber,
    List<SaleItem>? items,
    Payment? payment,
    DateTime? saleDate,
    String? customerId,
    String? customerName,
    String? notes,
  }) {
    return Sale(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      items: items ?? this.items,
      payment: payment ?? this.payment,
      saleDate: saleDate ?? this.saleDate,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      notes: notes ?? this.notes,
    );
  }
}