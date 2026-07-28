import '../models/receipt_settings.dart';

/// ---------------------------------------------------------------------------
/// ReceiptSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for ReceiptSettings.
/// ---------------------------------------------------------------------------
abstract final class ReceiptSettingsGetters {
  const ReceiptSettingsGetters._();

  static bool showLogo(
    ReceiptSettings settings,
  ) {
    return settings.showLogo;
  }

  static bool showBusinessAddress(
    ReceiptSettings settings,
  ) {
    return settings.showBusinessAddress;
  }

  static bool showPhone(
    ReceiptSettings settings,
  ) {
    return settings.showPhone;
  }

  static bool showEmail(
    ReceiptSettings settings,
  ) {
    return settings.showEmail;
  }

  static bool showTaxPin(
    ReceiptSettings settings,
  ) {
    return settings.showTaxPin;
  }

  static bool showCustomerDetails(
    ReceiptSettings settings,
  ) {
    return settings.showCustomerDetails;
  }

  static bool showCashierName(
    ReceiptSettings settings,
  ) {
    return settings.showCashierName;
  }

  static bool showPaymentMethod(
    ReceiptSettings settings,
  ) {
    return settings.showPaymentMethod;
  }

  static bool showBarcode(
    ReceiptSettings settings,
  ) {
    return settings.showBarcode;
  }

  static bool showQrCode(
    ReceiptSettings settings,
  ) {
    return settings.showQrCode;
  }

  static bool showFooter(
    ReceiptSettings settings,
  ) {
    return settings.showFooter;
  }

  static String footerMessage(
    ReceiptSettings settings,
  ) {
    return settings.footerMessage;
  }

  static String paperSize(
    ReceiptSettings settings,
  ) {
    return settings.paperSize;
  }

  static bool autoPrintReceipt(
    ReceiptSettings settings,
  ) {
    return settings.autoPrintReceipt;
  }

  static bool hasFooterMessage(
    ReceiptSettings settings,
  ) {
    return settings.footerMessage.trim().isNotEmpty;
  }

  static bool isThermalPaper(
    ReceiptSettings settings,
  ) {
    return settings.paperSize == '58mm' ||
        settings.paperSize == '80mm';
  }

  static bool isA4Paper(
    ReceiptSettings settings,
  ) {
    return settings.paperSize == 'A4';
  }

  static String receiptType(
    ReceiptSettings settings,
  ) {
    return isThermalPaper(settings)
        ? 'Thermal Receipt'
        : 'Full Page Receipt';
  }

  static List<String> enabledSections(
    ReceiptSettings settings,
  ) {
    final sections = <String>[];

    if (settings.showLogo) {
      sections.add('Logo');
    }

    if (settings.showBusinessAddress) {
      sections.add('Business Address');
    }

    if (settings.showPhone) {
      sections.add('Phone');
    }

    if (settings.showEmail) {
      sections.add('Email');
    }

    if (settings.showTaxPin) {
      sections.add('Tax PIN');
    }

    if (settings.showCustomerDetails) {
      sections.add('Customer');
    }

    if (settings.showCashierName) {
      sections.add('Cashier');
    }

    if (settings.showPaymentMethod) {
      sections.add('Payment Method');
    }

    if (settings.showBarcode) {
      sections.add('Barcode');
    }

    if (settings.showQrCode) {
      sections.add('QR Code');
    }

    if (settings.showFooter) {
      sections.add('Footer');
    }

    return sections;
  }
}