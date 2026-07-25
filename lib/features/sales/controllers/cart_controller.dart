import 'package:flutter/foundation.dart';

import '../../products/models/product.dart';
import '../models/sale_item.dart';

/// ---------------------------------------------------------------------------
/// CartController
/// ---------------------------------------------------------------------------
///
/// Manages the shopping cart.
///
/// Responsibilities:
/// • Add products
/// • Remove products
/// • Update quantities
/// • Apply discounts
/// • Clear cart
/// • Expose cart totals
/// ---------------------------------------------------------------------------
class CartController extends ChangeNotifier {
  final List<SaleItem> _items = [];

  /// Read-only cart items.
  List<SaleItem> get items => List.unmodifiable(_items);

  //---------------------------------------------------------------------------
  // State
  //---------------------------------------------------------------------------

  bool get isEmpty => _items.isEmpty;

  bool get isNotEmpty => _items.isNotEmpty;

  int get itemCount => _items.length;

  int get totalQuantity => _items.fold(0, (sum, item) => sum + item.quantity);

  //---------------------------------------------------------------------------
  // Totals
  //---------------------------------------------------------------------------

  double get grossTotal =>
      _items.fold(0.0, (sum, item) => sum + item.grossTotal);

  double get totalDiscount =>
      _items.fold(0.0, (sum, item) => sum + item.discount);

  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.subtotal);

  double get totalCost => _items.fold(0.0, (sum, item) => sum + item.cost);

  double get totalProfit => _items.fold(0.0, (sum, item) => sum + item.profit);

  //---------------------------------------------------------------------------
  // Cart Operations
  //---------------------------------------------------------------------------

  void addProduct(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);

    if (index == -1) {
      _items.add(
        SaleItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          product: product,
          quantity: 1,
          unitPrice: product.sellingPrice,
        ),
      );
    } else {
      increaseQuantity(_items[index]);
    }

    notifyListeners();
  }

  void removeItem(SaleItem item) {
    _items.removeWhere((element) => element.id == item.id);

    notifyListeners();
  }

  void increaseQuantity(SaleItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);

    if (index == -1) return;

    final current = _items[index];

    _items[index] = current.copyWith(quantity: current.quantity + 1);

    notifyListeners();
  }

  void decreaseQuantity(SaleItem item) {
    final index = _items.indexWhere((element) => element.id == item.id);

    if (index == -1) return;

    final current = _items[index];

    if (current.quantity <= 1) {
      removeItem(current);
      return;
    }

    _items[index] = current.copyWith(quantity: current.quantity - 1);

    notifyListeners();
  }

  void updateDiscount(SaleItem item, double discount) {
    final index = _items.indexWhere((element) => element.id == item.id);

    if (index == -1) return;

    _items[index] = _items[index].copyWith(discount: discount);

    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
