import 'package:flutter/foundation.dart';

import '../models/payment.dart';

/// ---------------------------------------------------------------------------
/// PaymentController
/// ---------------------------------------------------------------------------
///
/// Manages payment information for the current sale.
///
/// Responsibilities:
/// • Select payment method
/// • Track amount received
/// • Calculate change
/// • Validate payment
/// ---------------------------------------------------------------------------
class PaymentController extends ChangeNotifier {
  PaymentMethod _paymentMethod = PaymentMethod.cash;

  double _amountReceived = 0;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  PaymentMethod get paymentMethod => _paymentMethod;

  double get amountReceived => _amountReceived;

  //---------------------------------------------------------------------------
  // Setters
  //---------------------------------------------------------------------------

  void setPaymentMethod(PaymentMethod method) {
    if (_paymentMethod == method) return;

    _paymentMethod = method;
    notifyListeners();
  }

  void setAmountReceived(double amount) {
    if (amount < 0) amount = 0;

    _amountReceived = amount;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Calculations
  //---------------------------------------------------------------------------

  double calculateChange(double saleTotal) {
    final change = _amountReceived - saleTotal;

    return change < 0 ? 0 : change;
  }

  double calculateBalance(double saleTotal) {
    final balance = saleTotal - _amountReceived;

    return balance < 0 ? 0 : balance;
  }

  bool hasEnoughPayment(double saleTotal) {
    if (_paymentMethod == PaymentMethod.credit) {
      return true;
    }

    return _amountReceived >= saleTotal;
  }

  //---------------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------------

  bool validate(double saleTotal) {
    switch (_paymentMethod) {
      case PaymentMethod.credit:
        return true;

      case PaymentMethod.cash:
      case PaymentMethod.mpesa:
      case PaymentMethod.card:
      case PaymentMethod.bankTransfer:
      case PaymentMethod.mixed:
        return _amountReceived >= saleTotal;
    }
  }

  //---------------------------------------------------------------------------
  // Build Payment Model
  //---------------------------------------------------------------------------

  Payment buildPayment({
    String? reference,
    String? notes,
  }) {
    return Payment(
      method: _paymentMethod,
      amountPaid: _amountReceived,
      reference: reference,
      notes: notes,
    );
  }

  //---------------------------------------------------------------------------
  // Reset
  //---------------------------------------------------------------------------

  void clear() {
    _paymentMethod = PaymentMethod.cash;
    _amountReceived = 0;

    notifyListeners();
  }
}