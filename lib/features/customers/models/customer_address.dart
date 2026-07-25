/// ---------------------------------------------------------------------------
/// CustomerAddress
/// ---------------------------------------------------------------------------
///
/// Stores a customer's physical and postal address.
///
/// This model is intentionally reusable across:
/// • Customers
/// • Suppliers
/// • Deliveries
/// • Orders
/// • Invoices
/// ---------------------------------------------------------------------------
class CustomerAddress {
  const CustomerAddress({
    this.country,
    this.county,
    this.city,
    this.area,
    this.street,
    this.building,
    this.houseNumber,
    this.postalCode,
    this.landmark,
    this.latitude,
    this.longitude,
  });

  final String? country;
  final String? county;
  final String? city;
  final String? area;
  final String? street;
  final String? building;
  final String? houseNumber;
  final String? postalCode;
  final String? landmark;

  final double? latitude;
  final double? longitude;

  //---------------------------------------------------------------------------
  // Computed
  //---------------------------------------------------------------------------

  bool get isEmpty =>
      country == null &&
      county == null &&
      city == null &&
      area == null &&
      street == null &&
      building == null &&
      houseNumber == null &&
      postalCode == null &&
      landmark == null;

  bool get isNotEmpty => !isEmpty;

  String get shortAddress {
    return [
      area,
      city,
      county,
    ].where((e) => e != null && e.isNotEmpty).join(', ');
  }

  String get fullAddress {
    return [
      houseNumber,
      building,
      street,
      area,
      city,
      county,
      postalCode,
      country,
    ].where((e) => e != null && e!.isNotEmpty).join(', ');
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  CustomerAddress copyWith({
    String? country,
    String? county,
    String? city,
    String? area,
    String? street,
    String? building,
    String? houseNumber,
    String? postalCode,
    String? landmark,
    double? latitude,
    double? longitude,
  }) {
    return CustomerAddress(
      country: country ?? this.country,
      county: county ?? this.county,
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      building: building ?? this.building,
      houseNumber: houseNumber ?? this.houseNumber,
      postalCode: postalCode ?? this.postalCode,
      landmark: landmark ?? this.landmark,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  //---------------------------------------------------------------------------
  // Serialization
  //---------------------------------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'county': county,
      'city': city,
      'area': area,
      'street': street,
      'building': building,
      'houseNumber': houseNumber,
      'postalCode': postalCode,
      'landmark': landmark,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CustomerAddress.fromMap(Map<String, dynamic> map) {
    return CustomerAddress(
      country: map['country'],
      county: map['county'],
      city: map['city'],
      area: map['area'],
      street: map['street'],
      building: map['building'],
      houseNumber: map['houseNumber'],
      postalCode: map['postalCode'],
      landmark: map['landmark'],
      latitude: (map['latitude'] as num?)?.toDouble(),
      longitude: (map['longitude'] as num?)?.toDouble(),
    );
  }

  @override
  String toString() => fullAddress;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CustomerAddress &&
            other.country == country &&
            other.county == county &&
            other.city == city &&
            other.area == area &&
            other.street == street &&
            other.building == building &&
            other.houseNumber == houseNumber &&
            other.postalCode == postalCode &&
            other.landmark == landmark &&
            other.latitude == latitude &&
            other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(
    country,
    county,
    city,
    area,
    street,
    building,
    houseNumber,
    postalCode,
    landmark,
    latitude,
    longitude,
  );
}
