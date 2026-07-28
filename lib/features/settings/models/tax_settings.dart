/// ---------------------------------------------------------------------------
/// TaxSettings
/// ---------------------------------------------------------------------------
///
/// Stores tax configuration used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class TaxSettings {
  const TaxSettings({
    this.vatEnabled = true,
    this.vatRate = 16.0,
    this.pricesIncludeVat = false,
  });

  /// Whether VAT calculations are enabled.
  final bool vatEnabled;

  /// VAT percentage.
  final double vatRate;

  /// Whether product prices already include VAT.
  final bool pricesIncludeVat;

  TaxSettings copyWith({
    bool? vatEnabled,
    double? vatRate,
    bool? pricesIncludeVat,
  }) {
    return TaxSettings(
      vatEnabled: vatEnabled ?? this.vatEnabled,
      vatRate: vatRate ?? this.vatRate,
      pricesIncludeVat:
          pricesIncludeVat ?? this.pricesIncludeVat,
    );
  }
}