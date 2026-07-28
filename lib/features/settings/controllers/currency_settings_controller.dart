import '../getters/currency_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// CurrencySettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Currency Settings.
/// ---------------------------------------------------------------------------
class CurrencySettingsController extends SettingsController {
  const CurrencySettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  String get currencyCode =>
      CurrencySettingsGetters.currencyCode(
        currency,
      );

  String get currencySymbol =>
      CurrencySettingsGetters.currencySymbol(
        currency,
      );

  int get decimalPlaces =>
      CurrencySettingsGetters.decimalPlaces(
        currency,
      );

  String get thousandSeparator =>
      CurrencySettingsGetters.thousandSeparator(
        currency,
      );

  String get decimalSeparator =>
      CurrencySettingsGetters.decimalSeparator(
        currency,
      );

  String get currencyDisplay =>
      CurrencySettingsGetters.currencyDisplay(
        currency,
      );

  bool get usesDecimals =>
      CurrencySettingsGetters.usesDecimals(
        currency,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<String> get availableCurrencies => const [
        'KES',
        'USD',
        'EUR',
        'GBP',
        'TZS',
        'UGX',
      ];

  List<String> get availableSymbols => const [
        'KSh',
        '\$',
        '€',
        '£',
      ];

  List<String> get availableDecimalSeparators => const [
        '.',
        ',',
      ];

  List<String> get availableThousandSeparators => const [
        ',',
        '.',
        ' ',
      ];

  //--------------------------------------------------------------------------
  // Formatting
  //--------------------------------------------------------------------------

  String formatAmount(
    double amount,
  ) {
    return CurrencySettingsGetters.formatAmount(
      currency,
      amount,
    );
  }

  String formatCodeAndAmount(
    double amount,
  ) {
    return CurrencySettingsGetters.formatCodeAndAmount(
      currency,
      amount,
    );
  }

  //--------------------------------------------------------------------------
  // Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setCurrency(String? value) {}

  /// TODO: Connect to repository update.
  void setCurrencySymbol(String? value) {}

  /// TODO: Connect to repository update.
  void setDecimalSeparator(String? value) {}

  /// TODO: Connect to repository update.
  void setThousandSeparator(String? value) {}

  /// TODO: Connect to repository update.
  void setShowCurrencySymbol(bool value) {}
}