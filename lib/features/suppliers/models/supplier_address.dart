import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// SupplierAddress
/// ---------------------------------------------------------------------------
///
/// Physical address for a supplier.
/// ---------------------------------------------------------------------------
@immutable
class SupplierAddress {
  const SupplierAddress({
    this.country,
    this.county,
    this.city,
    this.postalCode,
    this.street,
    this.building,
    this.landmark,
  });

  //--------------------------------------------------------------------------
  // Location
  //--------------------------------------------------------------------------

  final String? country;

  final String? county;

  final String? city;

  final String? postalCode;

  //--------------------------------------------------------------------------
  // Street
  //--------------------------------------------------------------------------

  final String? street;

  final String? building;

  final String? landmark;

  //--------------------------------------------------------------------------
  // Computed Properties
  //--------------------------------------------------------------------------

  bool get isEmpty =>
      (country?.trim().isEmpty ?? true) &&
      (county?.trim().isEmpty ?? true) &&
      (city?.trim().isEmpty ?? true) &&
      (postalCode?.trim().isEmpty ?? true) &&
      (street?.trim().isEmpty ?? true) &&
      (building?.trim().isEmpty ?? true) &&
      (landmark?.trim().isEmpty ?? true);

  bool get isNotEmpty => !isEmpty;

  String get fullAddress {
    final parts = [
      building,
      street,
      landmark,
      city,
      county,
      postalCode,
      country,
    ].whereType<String>().where((e) => e.trim().isNotEmpty).toList();

    return parts.join(', ');
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  SupplierAddress copyWith({
    String? country,
    String? county,
    String? city,
    String? postalCode,
    String? street,
    String? building,
    String? landmark,
  }) {
    return SupplierAddress(
      country: country ?? this.country,
      county: county ?? this.county,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      street: street ?? this.street,
      building: building ?? this.building,
      landmark: landmark ?? this.landmark,
    );
  }
}
