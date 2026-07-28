/// ---------------------------------------------------------------------------
/// CurrencySettings
/// ---------------------------------------------------------------------------
///
/// Stores currency and number formatting preferences used throughout
/// SmartShop AI.
/// ---------------------------------------------------------------------------
class CurrencySettings {
  const CurrencySettings({
    this.currencyCode = 'KES',
    this.currencySymbol = 'KSh',
    this.decimalPlaces = 2,
    this.thousandSeparator = ',',
    this.decimalSeparator = '.',

  });

  /// ISO currency code.
  final String currencyCode;

  /// Currency symbol displayed throughout the application.
  final String currencySymbol;

  /// Number of decimal places to display.
  final int decimalPlaces;

  /// Thousands separator.
  final String thousandSeparator;

  /// Decimal separator.
  final String decimalSeparator;

  CurrencySettings copyWith({
    String? currencyCode,
    String? currencySymbol,
    int? decimalPlaces,
    String? thousandSeparator,
    String? decimalSeparator,
  }) {
    return CurrencySettings(
      currencyCode: currencyCode ?? this.currencyCode,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      decimalPlaces: decimalPlaces ?? this.decimalPlaces,
      thousandSeparator:
          thousandSeparator ?? this.thousandSeparator,
      decimalSeparator:
          decimalSeparator ?? this.decimalSeparator,
    );
  }
}