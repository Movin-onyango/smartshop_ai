import 'package:flutter/foundation.dart';

import '../../inventory/repositories/inventory_repository.dart';
import '../models/payment.dart';
import '../models/sale.dart';
import '../repositories/sales_repository.dart';

/// ---------------------------------------------------------------------------
/// CheckoutController
/// ---------------------------------------------------------------------------
///
/// Responsible for completing a sale.
///
/// Responsibilities
/// • Validate checkout
/// • Save sale
/// • Update inventory
/// • Generate receipt (future)
/// • Print receipt (future)
/// ---------------------------------------------------------------------------
class CheckoutController extends ChangeNotifier {
  CheckoutController();

  bool _isProcessing = false;

  //--------------------------------------------------------------------------
  // Checkout State
  //--------------------------------------------------------------------------

  PaymentMethod _paymentMethod = PaymentMethod.cash;

  double _amountReceived = 0;

  String? _reference;

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get isProcessing => _isProcessing;

  PaymentMethod get paymentMethod => _paymentMethod;

  double get amountReceived => _amountReceived;

  String? get reference => _reference;

  //--------------------------------------------------------------------------
  // Setters
  //--------------------------------------------------------------------------

  void setPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  void setAmountReceived(double amount) {
    _amountReceived = amount;
    notifyListeners();
  }

  void setReference(String? value) {
    _reference = value;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Compatibility Helpers
  //--------------------------------------------------------------------------

  bool canCompleteSale(double total) {
    if (_paymentMethod == PaymentMethod.credit) {
      return true;
    }

    return _amountReceived >= total;
  }

  double change(double total) {
    if (_paymentMethod == PaymentMethod.credit) {
      return 0;
    }

    final value = _amountReceived - total;
    return value < 0 ? 0 : value;
  }

  double balance(double total) {
    if (_paymentMethod == PaymentMethod.credit) {
      return total;
    }

    return 0;
  }

  Payment buildPayment() {
    return Payment(
      method: _paymentMethod,
      amountPaid: _amountReceived,
      reference: _reference,
    );
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  bool validate({
    required Sale sale,
    required Payment payment,
  }) {
    if (sale.items.isEmpty) {
      return false;
    }

    if (payment.amountPaid < sale.subtotal &&
        !payment.isCredit) {
      return false;
    }

    return true;
  }

  //--------------------------------------------------------------------------
  // Checkout
  //--------------------------------------------------------------------------

  Future<bool> completeSale(Sale sale) async {
    try {
      _isProcessing = true;
      notifyListeners();

      // Save sale
      SalesRepository.add(sale);

      // Reduce inventory
      for (final item in sale.items) {
        InventoryRepository.decreaseStock(
          item.product.id!,
          item.quantity,
        );
      }

      // TODO:
      // • Generate receipt
      // • Print receipt
      // • Sync cloud
      // • Award loyalty points

      return true;
    } catch (_) {
      return false;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }
}