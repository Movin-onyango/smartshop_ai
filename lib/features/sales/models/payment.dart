/// ---------------------------------------------------------------------------
/// Payment Method
/// ---------------------------------------------------------------------------
enum PaymentMethod { cash, mpesa, card, bankTransfer, credit, mixed }

/// ---------------------------------------------------------------------------
/// Payment
/// ---------------------------------------------------------------------------
///
/// Represents payment information for a completed sale.
/// ---------------------------------------------------------------------------
class Payment {
  const Payment({
    required this.method,
    required this.amountPaid,
    this.reference,
    this.notes,
  });

  /// Selected payment method.
  final PaymentMethod method;

  /// Amount received from the customer.
  final double amountPaid;

  /// Transaction reference.
  final String? reference;

  /// Optional payment notes.
  final String? notes;

  //--------------------------------------------------------------------------
  // Convenience Getters
  //--------------------------------------------------------------------------

  bool get isCash => method == PaymentMethod.cash;

  bool get isMpesa => method == PaymentMethod.mpesa;

  bool get isCard => method == PaymentMethod.card;

  bool get isBankTransfer => method == PaymentMethod.bankTransfer;

  bool get isCredit => method == PaymentMethod.credit;

  bool get isMixed => method == PaymentMethod.mixed;

  /// Compatibility getter.
  ///
  /// Older widgets use amountReceived while the model stores amountPaid.
  double get amountReceived => amountPaid;

  /// Compatibility getter.
  ///
  /// Actual change is calculated during checkout using:
  /// amountPaid - sale.subtotal.
  ///
  /// This getter exists only to keep widgets compiling.
  double get change => 0;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Payment copyWith({
    PaymentMethod? method,
    double? amountPaid,
    String? reference,
    String? notes,
  }) {
    return Payment(
      method: method ?? this.method,
      amountPaid: amountPaid ?? this.amountPaid,
      reference: reference ?? this.reference,
      notes: notes ?? this.notes,
    );
  }
}
