import '../models/tax_settings.dart';

/// ---------------------------------------------------------------------------
/// TaxSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for TaxSettings.
/// ---------------------------------------------------------------------------
abstract final class TaxSettingsGetters {
  const TaxSettingsGetters._();

  static bool vatEnabled(
    TaxSettings settings,
  ) {
    return settings.vatEnabled;
  }

  static double vatRate(
    TaxSettings settings,
  ) {
    return settings.vatRate;
  }

  static bool pricesIncludeVat(
    TaxSettings settings,
  ) {
    return settings.pricesIncludeVat;
  }

  static String formattedVatRate(
    TaxSettings settings,
  ) {
    return '${settings.vatRate.toStringAsFixed(2)}%';
  }

  static String taxMode(
    TaxSettings settings,
  ) {
    return settings.pricesIncludeVat
        ? 'VAT Inclusive'
        : 'VAT Exclusive';
  }

  static bool isVatApplicable(
    TaxSettings settings,
  ) {
    return settings.vatEnabled &&
        settings.vatRate > 0;
  }

  static double calculateVat(
    TaxSettings settings,
    double amount,
  ) {
    if (!settings.vatEnabled) {
      return 0;
    }

    return amount * (settings.vatRate / 100);
  }

  static double calculateTotalWithVat(
    TaxSettings settings,
    double amount,
  ) {
    if (!settings.vatEnabled) {
      return amount;
    }

    if (settings.pricesIncludeVat) {
      return amount;
    }

    return amount + calculateVat(
      settings,
      amount,
    );
  }

  static double calculateNetAmount(
    TaxSettings settings,
    double amount,
  ) {
    if (!settings.vatEnabled) {
      return amount;
    }

    if (!settings.pricesIncludeVat) {
      return amount;
    }

    return amount /
        (1 + (settings.vatRate / 100));
  }
}