/// ---------------------------------------------------------------------------
/// SalesSettings
/// ---------------------------------------------------------------------------
///
/// Stores sales and checkout preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class SalesSettings {
  const SalesSettings({
    this.allowDiscounts = true,
    this.requireCustomer = false,
    this.defaultPaymentMethod = 'Cash',
    this.autoGenerateReceipt = true,
    this.allowPartialPayments = false,
    this.allowReturns = true,
    this.requireCashierConfirmation = false,
    this.autoCompleteSale = true,
  });

  /// Allows discounts during checkout.
  final bool allowDiscounts;

  /// Requires selecting a customer before completing a sale.
  final bool requireCustomer;

  /// Default payment method used during checkout.
  final String defaultPaymentMethod;

  /// Automatically generates a receipt after a successful sale.
  final bool autoGenerateReceipt;

  /// Allows partial payments.
  final bool allowPartialPayments;

  /// Allows sales to be refunded or returned.
  final bool allowReturns;

  /// Requires cashier confirmation before completing a sale.
  final bool requireCashierConfirmation;

  /// Automatically completes a sale after successful payment.
  final bool autoCompleteSale;

  SalesSettings copyWith({
    bool? allowDiscounts,
    bool? requireCustomer,
    String? defaultPaymentMethod,
    bool? autoGenerateReceipt,
    bool? allowPartialPayments,
    bool? allowReturns,
    bool? requireCashierConfirmation,
    bool? autoCompleteSale,
  }) {
    return SalesSettings(
      allowDiscounts:
          allowDiscounts ?? this.allowDiscounts,
      requireCustomer:
          requireCustomer ?? this.requireCustomer,
      defaultPaymentMethod:
          defaultPaymentMethod ??
              this.defaultPaymentMethod,
      autoGenerateReceipt:
          autoGenerateReceipt ??
              this.autoGenerateReceipt,
      allowPartialPayments:
          allowPartialPayments ??
              this.allowPartialPayments,
      allowReturns:
          allowReturns ?? this.allowReturns,
      requireCashierConfirmation:
          requireCashierConfirmation ??
              this.requireCashierConfirmation,
      autoCompleteSale:
          autoCompleteSale ??
              this.autoCompleteSale,
    );
  }
}