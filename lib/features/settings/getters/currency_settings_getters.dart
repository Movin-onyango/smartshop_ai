import '../models/currency_settings.dart';

/// ---------------------------------------------------------------------------
/// CurrencySettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for CurrencySettings.
/// ---------------------------------------------------------------------------
abstract final class CurrencySettingsGetters {
  const CurrencySettingsGetters._();

  static String currencyCode(
    CurrencySettings settings,
  ) {
    return settings.currencyCode;
  }

  static String currencySymbol(
    CurrencySettings settings,
  ) {
    return settings.currencySymbol;
  }

  static int decimalPlaces(
    CurrencySettings settings,
  ) {
    return settings.decimalPlaces;
  }

  static String thousandSeparator(
    CurrencySettings settings,
  ) {
    return settings.thousandSeparator;
  }

  static String decimalSeparator(
    CurrencySettings settings,
  ) {
    return settings.decimalSeparator;
  }

  static String currencyDisplay(
    CurrencySettings settings,
  ) {
    return '${settings.currencyCode} (${settings.currencySymbol})';
  }

  static bool usesDecimals(
    CurrencySettings settings,
  ) {
    return settings.decimalPlaces > 0;
  }

  static String formatAmount(
    CurrencySettings settings,
    double amount,
  ) {
    return '${settings.currencySymbol} '
        '${amount.toStringAsFixed(settings.decimalPlaces)}';
  }

  static String formatCodeAndAmount(
    CurrencySettings settings,
    double amount,
  ) {
    return '${settings.currencyCode} '
        '${amount.toStringAsFixed(settings.decimalPlaces)}';
  }
}