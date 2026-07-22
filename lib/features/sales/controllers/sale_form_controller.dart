import 'package:flutter/foundation.dart';

import '../../products/models/product.dart';
import '../models/payment.dart';
import '../models/sale_item.dart';

import 'cart_controller.dart';
import 'customer_controller.dart';
import 'payment_controller.dart';
import 'product_search_controller.dart';
import 'totals_controller.dart';

/// ---------------------------------------------------------------------------
/// SaleFormController
/// ---------------------------------------------------------------------------
///
/// Coordinates the sale creation workflow.
///
/// This controller intentionally contains very little business logic.
/// Each responsibility is delegated to a dedicated controller.
///
/// Responsibilities:
/// • Coordinate the POS workflow
/// • Synchronize controllers
/// • Expose a simple API to the UI
/// • Validate checkout
/// ---------------------------------------------------------------------------
class SaleFormController extends ChangeNotifier {
  SaleFormController() {
    cart.addListener(_syncTotals);
  }

  @override
  void dispose() {
    cart.removeListener(_syncTotals);

    cart.dispose();
    productSearch.dispose();
    customer.dispose();
    payment.dispose();
    totals.dispose();

    super.dispose();
  }

  //--------------------------------------------------------------------------
  // Child Controllers
  //--------------------------------------------------------------------------

  final CartController cart = CartController();

  final ProductSearchController productSearch =
      ProductSearchController();

  final CustomerController customer =
      CustomerController();

  final PaymentController payment =
      PaymentController();

  final TotalsController totals =
      TotalsController();

  //--------------------------------------------------------------------------
  // Synchronization
  //--------------------------------------------------------------------------

  void _syncTotals() {
    totals.updateItems(cart.items);
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Product Search
  //--------------------------------------------------------------------------

  void loadProducts(List<Product> products) {
    productSearch.loadProducts(products);
  }

  void searchProducts(String query) {
    productSearch.search(query);
    notifyListeners();
  }

  List<Product> get filteredProducts =>
      productSearch.filteredProducts;

  //--------------------------------------------------------------------------
  // Cart
  //--------------------------------------------------------------------------

  void addProduct(Product product) {
    cart.addProduct(product);
  }

  void increaseQuantity(SaleItem item) {
    cart.increaseQuantity(item);
  }

  void decreaseQuantity(SaleItem item) {
    cart.decreaseQuantity(item);
  }

  void removeItem(SaleItem item) {
    cart.removeItem(item);
  }

  //--------------------------------------------------------------------------
  // Compatibility Layer
  //--------------------------------------------------------------------------

  // Old API expected by existing widgets/screens

  List<SaleItem> get items => cart.items;

  List<SaleItem> get cartItems => cart.items;

  bool get isEmpty => cart.isEmpty;

  bool get isNotEmpty => cart.isNotEmpty;

  int get itemCount => cart.itemCount;

  int get totalQuantity => cart.totalQuantity;

  double get grossTotal => totals.grossTotal;

  double get totalDiscount => totals.totalDiscount;

  double get discount => totals.discount;

  double get subtotal => totals.subtotal;

  double get totalCost => totals.totalCost;

  double get totalProfit => totals.totalProfit;

  double get expectedProfit => totals.expectedProfit;

  double get profitMargin => totals.profitMargin;

  bool get canCheckout => cart.isNotEmpty;

  void clearCart() {
    clear();
  }

  //--------------------------------------------------------------------------
  // Customer
  //--------------------------------------------------------------------------

  String? get customerName =>
      customer.customerName;

  String? get customerPhone =>
      customer.customerPhone;

  void clearCustomer() {
    customer.clearCustomer();
    notifyListeners();
  }

  Future<void> selectCustomer() async {
    await customer.pickCustomer();
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Payment
  //--------------------------------------------------------------------------

  PaymentMethod get paymentMethod =>
      payment.paymentMethod;

  void setPaymentMethod(
    PaymentMethod method,
  ) {
    payment.setPaymentMethod(method);
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Checkout
  //--------------------------------------------------------------------------

  Future<void> checkout() async {
    if (!canCheckout) {
      return;
    }

    // TODO:
    //
    // 1. Validate stock.
    // 2. Build Sale model.
    // 3. Save using repository.
    // 4. Reduce inventory.
    // 5. Generate receipt.
    // 6. Navigate to receipt screen.
  }

  //--------------------------------------------------------------------------
  // Reset
  //--------------------------------------------------------------------------

  void clear() {
    cart.clear();
    customer.clearCustomer();
    payment.clear();
    totals.clear();

    notifyListeners();
  }
}