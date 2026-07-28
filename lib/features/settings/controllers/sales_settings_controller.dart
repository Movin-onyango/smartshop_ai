import '../getters/sales_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// SalesSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Sales Settings.
/// ---------------------------------------------------------------------------
class SalesSettingsController extends SettingsController {
  const SalesSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get allowDiscounts =>
      SalesSettingsGetters.allowDiscounts(
        sales,
      );

  bool get requireCustomer =>
      SalesSettingsGetters.requireCustomer(
        sales,
      );

  String get defaultPaymentMethod =>
      SalesSettingsGetters.defaultPaymentMethod(
        sales,
      );

  bool get autoGenerateReceipt =>
      SalesSettingsGetters.autoGenerateReceipt(
        sales,
      );

  bool get allowPartialPayments =>
      SalesSettingsGetters.allowPartialPayments(
        sales,
      );

  bool get allowReturns =>
      SalesSettingsGetters.allowReturns(
        sales,
      );

  bool get requireCashierConfirmation =>
      SalesSettingsGetters.requireCashierConfirmation(
        sales,
      );

  bool get autoCompleteSale =>
      SalesSettingsGetters.autoCompleteSale(
        sales,
      );

  bool get checkoutRequiresCustomer =>
      SalesSettingsGetters.checkoutRequiresCustomer(
        sales,
      );

  bool get checkoutCanApplyDiscounts =>
      SalesSettingsGetters.checkoutCanApplyDiscounts(
        sales,
      );

  bool get receiptGenerationEnabled =>
      SalesSettingsGetters.receiptGenerationEnabled(
        sales,
      );

  bool get supportsSplitPayments =>
      SalesSettingsGetters.supportsSplitPayments(
        sales,
      );

  bool get returnsEnabled =>
      SalesSettingsGetters.returnsEnabled(
        sales,
      );

  bool get confirmationRequired =>
      SalesSettingsGetters.confirmationRequired(
        sales,
      );

  String get paymentSummary =>
      SalesSettingsGetters.paymentSummary(
        sales,
      );

  String get checkoutMode =>
      SalesSettingsGetters.checkoutMode(
        sales,
      );

  List<String> get enabledFeatures =>
      SalesSettingsGetters.enabledFeatures(
        sales,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<String> get availablePaymentMethods => const [
        'Cash',
        'M-Pesa',
        'Card',
        'Bank Transfer',
        'Credit',
      ];

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setAllowDiscounts(bool value) {}

  /// TODO: Connect to repository update.
  void setRequireCustomer(bool value) {}

  /// TODO: Connect to repository update.
  void setDefaultPaymentMethod(String? value) {}

  /// TODO: Connect to repository update.
  void setAutoGenerateReceipt(bool value) {}

  /// TODO: Connect to repository update.
  void setAllowPartialPayments(bool value) {}

  /// TODO: Connect to repository update.
  void setAllowReturns(bool value) {}

  /// TODO: Connect to repository update.
  void setRequireCashierConfirmation(bool value) {}

  /// TODO: Connect to repository update.
  void setAutoCompleteSale(bool value) {}
}