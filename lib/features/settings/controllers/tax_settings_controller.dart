import '../getters/tax_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// TaxSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Tax Settings.
/// ---------------------------------------------------------------------------
class TaxSettingsController extends SettingsController {
  const TaxSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get vatEnabled =>
      TaxSettingsGetters.vatEnabled(
        tax,
      );

  double get vatRate =>
      TaxSettingsGetters.vatRate(
        tax,
      );

  bool get pricesIncludeVat =>
      TaxSettingsGetters.pricesIncludeVat(
        tax,
      );

  String get formattedVatRate =>
      TaxSettingsGetters.formattedVatRate(
        tax,
      );

  String get taxMode =>
      TaxSettingsGetters.taxMode(
        tax,
      );

  bool get isVatApplicable =>
      TaxSettingsGetters.isVatApplicable(
        tax,
      );

  //--------------------------------------------------------------------------
  // Helper Methods
  //--------------------------------------------------------------------------

  double calculateVat(
    double amount,
  ) {
    return TaxSettingsGetters.calculateVat(
      tax,
      amount,
    );
  }

  double calculateTotalWithVat(
    double amount,
  ) {
    return TaxSettingsGetters.calculateTotalWithVat(
      tax,
      amount,
    );
  }

  double calculateNetAmount(
    double amount,
  ) {
    return TaxSettingsGetters.calculateNetAmount(
      tax,
      amount,
    );
  }

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<double> get availableVatRates => const [
        0,
        8,
        16,
      ];

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setVatEnabled(bool value) {}

  /// TODO: Connect to repository update.
  void setVatRate(double? value) {}

  /// TODO: Connect to repository update.
  void setPricesIncludeVat(bool value) {}
}