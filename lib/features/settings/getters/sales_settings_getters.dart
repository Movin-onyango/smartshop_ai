import '../models/sales_settings.dart';

/// ---------------------------------------------------------------------------
/// SalesSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for SalesSettings.
/// ---------------------------------------------------------------------------
abstract final class SalesSettingsGetters {
  const SalesSettingsGetters._();

  static bool allowDiscounts(
    SalesSettings settings,
  ) {
    return settings.allowDiscounts;
  }

  static bool requireCustomer(
    SalesSettings settings,
  ) {
    return settings.requireCustomer;
  }

  static String defaultPaymentMethod(
    SalesSettings settings,
  ) {
    return settings.defaultPaymentMethod;
  }

  static bool autoGenerateReceipt(
    SalesSettings settings,
  ) {
    return settings.autoGenerateReceipt;
  }

  static bool allowPartialPayments(
    SalesSettings settings,
  ) {
    return settings.allowPartialPayments;
  }

  static bool allowReturns(
    SalesSettings settings,
  ) {
    return settings.allowReturns;
  }

  static bool requireCashierConfirmation(
    SalesSettings settings,
  ) {
    return settings.requireCashierConfirmation;
  }

  static bool autoCompleteSale(
    SalesSettings settings,
  ) {
    return settings.autoCompleteSale;
  }

  static bool checkoutRequiresCustomer(
    SalesSettings settings,
  ) {
    return settings.requireCustomer;
  }

  static bool checkoutCanApplyDiscounts(
    SalesSettings settings,
  ) {
    return settings.allowDiscounts;
  }

  static bool receiptGenerationEnabled(
    SalesSettings settings,
  ) {
    return settings.autoGenerateReceipt;
  }

  static bool supportsSplitPayments(
    SalesSettings settings,
  ) {
    return settings.allowPartialPayments;
  }

  static bool returnsEnabled(
    SalesSettings settings,
  ) {
    return settings.allowReturns;
  }

  static bool confirmationRequired(
    SalesSettings settings,
  ) {
    return settings.requireCashierConfirmation;
  }

  static String paymentSummary(
    SalesSettings settings,
  ) {
    return 'Default Payment: ${settings.defaultPaymentMethod}';
  }

  static String checkoutMode(
    SalesSettings settings,
  ) {
    return settings.autoCompleteSale
        ? 'Automatic Checkout'
        : 'Manual Checkout';
  }

  static List<String> enabledFeatures(
    SalesSettings settings,
  ) {
    final features = <String>[];

    if (settings.allowDiscounts) {
      features.add('Discounts');
    }

    if (settings.requireCustomer) {
      features.add('Customer Verification');
    }

    if (settings.autoGenerateReceipt) {
      features.add('Auto Receipt');
    }

    if (settings.allowPartialPayments) {
      features.add('Partial Payments');
    }

    if (settings.allowReturns) {
      features.add('Returns');
    }

    if (settings.requireCashierConfirmation) {
      features.add('Cashier Confirmation');
    }

    if (settings.autoCompleteSale) {
      features.add('Auto Complete Sale');
    }

    return features;
  }
}