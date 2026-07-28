/// ---------------------------------------------------------------------------
/// BusinessSettings
/// ---------------------------------------------------------------------------
///
/// Stores business profile information used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class BusinessSettings {
  const BusinessSettings({
    this.businessName = 'SmartShop AI',
    this.ownerName = '',
    this.phone = '',
    this.email = '',
    this.address = '',
    this.taxPin = '',
    this.logoPath = '',
  });

  final String businessName;

  final String ownerName;

  final String phone;

  final String email;

  final String address;

  final String taxPin;

  final String logoPath;

  BusinessSettings copyWith({
    String? businessName,
    String? ownerName,
    String? phone,
    String? email,
    String? address,
    String? taxPin,
    String? logoPath,
  }) {
    return BusinessSettings(
      businessName: businessName ?? this.businessName,
      ownerName: ownerName ?? this.ownerName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      taxPin: taxPin ?? this.taxPin,
      logoPath: logoPath ?? this.logoPath,
    );
  }
}