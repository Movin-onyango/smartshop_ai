import 'package:flutter/foundation.dart';

import '../models/sale_item.dart';

/// ---------------------------------------------------------------------------
/// TotalsController
/// ---------------------------------------------------------------------------
///
/// Responsible only for financial calculations.
///
/// Responsibilities:
/// • Gross Total
/// • Discount
/// • Subtotal
/// • Total Cost
/// • Profit
/// • Profit Margin
///
/// This controller contains no cart logic.
/// It simply calculates totals from a list of SaleItems.
/// ---------------------------------------------------------------------------
class TotalsController extends ChangeNotifier {
  List<SaleItem> _items = const [];

  //---------------------------------------------------------------------------
  // Data
  //---------------------------------------------------------------------------

  List<SaleItem> get items => List.unmodifiable(_items);

  /// Updates the list of sale items and recalculates totals.
  void updateItems(List<SaleItem> items) {
    _items = List<SaleItem>.from(items);
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Totals
  //---------------------------------------------------------------------------

  double get grossTotal =>
      _items.fold(
        0.0,
        (sum, item) => sum + item.grossTotal,
      );

  double get totalDiscount =>
      _items.fold(
        0.0,
        (sum, item) => sum + item.discount,
      );

  /// Compatibility alias used by the UI.
  double get discount => totalDiscount;

  double get subtotal =>
      _items.fold(
        0.0,
        (sum, item) => sum + item.subtotal,
      );

  double get totalCost =>
      _items.fold(
        0.0,
        (sum, item) => sum + item.cost,
      );

  double get totalProfit =>
      _items.fold(
        0.0,
        (sum, item) => sum + item.profit,
      );

  /// Compatibility alias used by the UI.
  double get expectedProfit => totalProfit;

  double get profitMargin {
    if (subtotal == 0) {
      return 0;
    }

    return (totalProfit / subtotal) * 100;
  }

  //---------------------------------------------------------------------------
  // Counts
  //---------------------------------------------------------------------------

  int get totalItems => _items.length;

  int get totalQuantity =>
      _items.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;

  //---------------------------------------------------------------------------
  // Reset
  //---------------------------------------------------------------------------

  void clear() {
    _items = const [];
    notifyListeners();
  }
}