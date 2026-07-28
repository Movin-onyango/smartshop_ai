/// ---------------------------------------------------------------------------
/// ReceiptSettings
/// ---------------------------------------------------------------------------
///
/// Stores receipt customization preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class ReceiptSettings {
  const ReceiptSettings({
    this.showLogo = true,
    this.showBusinessAddress = true,
    this.showPhone = true,
    this.showEmail = true,
    this.showTaxPin = true,
    this.showCustomerDetails = true,
    this.showCashierName = true,
    this.showPaymentMethod = true,
    this.showBarcode = false,
    this.showQrCode = false,
    this.showFooter = true,
    this.footerMessage = 'Thank you for shopping with us!',
    this.paperSize = '80mm',
    this.autoPrintReceipt = false,
  });

  /// Display business logo.
  final bool showLogo;

  /// Display business address.
  final bool showBusinessAddress;

  /// Display business phone.
  final bool showPhone;

  /// Display business email.
  final bool showEmail;

  /// Display tax PIN.
  final bool showTaxPin;

  /// Display customer details.
  final bool showCustomerDetails;

  /// Display cashier name.
  final bool showCashierName;

  /// Display payment method.
  final bool showPaymentMethod;

  /// Display barcode.
  final bool showBarcode;

  /// Display QR code.
  final bool showQrCode;

  /// Display footer.
  final bool showFooter;

  /// Receipt footer message.
  final String footerMessage;

  /// Receipt paper size.
  ///
  /// Examples:
  /// - 58mm
  /// - 80mm
  /// - A4
  final String paperSize;

  /// Automatically print receipt after a completed sale.
  final bool autoPrintReceipt;

  ReceiptSettings copyWith({
    bool? showLogo,
    bool? showBusinessAddress,
    bool? showPhone,
    bool? showEmail,
    bool? showTaxPin,
    bool? showCustomerDetails,
    bool? showCashierName,
    bool? showPaymentMethod,
    bool? showBarcode,
    bool? showQrCode,
    bool? showFooter,
    String? footerMessage,
    String? paperSize,
    bool? autoPrintReceipt,
  }) {
    return ReceiptSettings(
      showLogo: showLogo ?? this.showLogo,
      showBusinessAddress:
          showBusinessAddress ?? this.showBusinessAddress,
      showPhone: showPhone ?? this.showPhone,
      showEmail: showEmail ?? this.showEmail,
      showTaxPin: showTaxPin ?? this.showTaxPin,
      showCustomerDetails:
          showCustomerDetails ?? this.showCustomerDetails,
      showCashierName:
          showCashierName ?? this.showCashierName,
      showPaymentMethod:
          showPaymentMethod ?? this.showPaymentMethod,
      showBarcode: showBarcode ?? this.showBarcode,
      showQrCode: showQrCode ?? this.showQrCode,
      showFooter: showFooter ?? this.showFooter,
      footerMessage:
          footerMessage ?? this.footerMessage,
      paperSize: paperSize ?? this.paperSize,
      autoPrintReceipt:
          autoPrintReceipt ?? this.autoPrintReceipt,
    );
  }
}