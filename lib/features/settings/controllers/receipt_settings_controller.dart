import '../getters/receipt_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// ReceiptSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Receipt Settings.
/// ---------------------------------------------------------------------------
class ReceiptSettingsController extends SettingsController {
  const ReceiptSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get showLogo =>
      ReceiptSettingsGetters.showLogo(
        receipt,
      );

  bool get showBusinessAddress =>
      ReceiptSettingsGetters.showBusinessAddress(
        receipt,
      );

  bool get showPhone =>
      ReceiptSettingsGetters.showPhone(
        receipt,
      );

  bool get showEmail =>
      ReceiptSettingsGetters.showEmail(
        receipt,
      );

  bool get showTaxPin =>
      ReceiptSettingsGetters.showTaxPin(
        receipt,
      );

  bool get showCustomerDetails =>
      ReceiptSettingsGetters.showCustomerDetails(
        receipt,
      );

  bool get showCashierName =>
      ReceiptSettingsGetters.showCashierName(
        receipt,
      );

  bool get showPaymentMethod =>
      ReceiptSettingsGetters.showPaymentMethod(
        receipt,
      );

  bool get showBarcode =>
      ReceiptSettingsGetters.showBarcode(
        receipt,
      );

  bool get showQrCode =>
      ReceiptSettingsGetters.showQrCode(
        receipt,
      );

  bool get showFooter =>
      ReceiptSettingsGetters.showFooter(
        receipt,
      );

  String get footerMessage =>
      ReceiptSettingsGetters.footerMessage(
        receipt,
      );

  String get paperSize =>
      ReceiptSettingsGetters.paperSize(
        receipt,
      );

  bool get autoPrintReceipt =>
      ReceiptSettingsGetters.autoPrintReceipt(
        receipt,
      );

  bool get hasFooterMessage =>
      ReceiptSettingsGetters.hasFooterMessage(
        receipt,
      );

  bool get isThermalPaper =>
      ReceiptSettingsGetters.isThermalPaper(
        receipt,
      );

  bool get isA4Paper =>
      ReceiptSettingsGetters.isA4Paper(
        receipt,
      );

  String get receiptType =>
      ReceiptSettingsGetters.receiptType(
        receipt,
      );

  List<String> get enabledSections =>
      ReceiptSettingsGetters.enabledSections(
        receipt,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<String> get availablePaperSizes => const [
        '58 mm',
        '80 mm',
        'A4',
      ];

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setShowLogo(bool value) {}

  /// TODO: Connect to repository update.
  void setShowBusinessAddress(bool value) {}

  /// TODO: Connect to repository update.
  void setShowPhone(bool value) {}

  /// TODO: Connect to repository update.
  void setShowEmail(bool value) {}

  /// TODO: Connect to repository update.
  void setShowTaxPin(bool value) {}

  /// TODO: Connect to repository update.
  void setShowCustomerDetails(bool value) {}

  /// TODO: Connect to repository update.
  void setShowCashierName(bool value) {}

  /// TODO: Connect to repository update.
  void setShowPaymentMethod(bool value) {}

  /// TODO: Connect to repository update.
  void setShowBarcode(bool value) {}

  /// TODO: Connect to repository update.
  void setShowQrCode(bool value) {}

  /// TODO: Connect to repository update.
  void setShowFooter(bool value) {}

  /// TODO: Connect to repository update.
  void setPaperSize(String? value) {}

  /// TODO: Connect to repository update.
  void setAutoPrintReceipt(bool value) {}

  /// TODO: Connect to repository update.
  void editFooterMessage() {}
}