import 'package:flutter/foundation.dart';

import 'supplier_address.dart';
import 'supplier_statistics.dart';

/// ---------------------------------------------------------------------------
/// Supplier
/// ---------------------------------------------------------------------------
///
/// Represents a supplier/vendor in SmartShop AI.
///
/// Suppliers provide inventory through purchase orders and
/// stock replenishment.
/// ---------------------------------------------------------------------------
@immutable
class Supplier {
  const Supplier({
    this.id,

    required this.name,

    this.contactPerson,

    this.phone,

    this.email,

    this.address,

    this.taxNumber,

    this.paymentTerms,

    this.notes,

    this.creditLimit = 0,

    this.currentBalance = 0,

    this.statistics,

    this.createdAt,

    this.updatedAt,
  });

  //--------------------------------------------------------------------------
  // Identity
  //--------------------------------------------------------------------------

  final String? id;

  final String name;

  final String? contactPerson;

  //--------------------------------------------------------------------------
  // Contact
  //--------------------------------------------------------------------------

  final String? phone;

  final String? email;

  //--------------------------------------------------------------------------
  // Address
  //--------------------------------------------------------------------------

  final SupplierAddress? address;

  //--------------------------------------------------------------------------
  // Business
  //--------------------------------------------------------------------------

  final String? taxNumber;

  final String? paymentTerms;

  //--------------------------------------------------------------------------
  // Financial
  //--------------------------------------------------------------------------

  final double creditLimit;

  final double currentBalance;

  //--------------------------------------------------------------------------
  // Statistics
  //--------------------------------------------------------------------------

  final SupplierStatistics? statistics;

  //--------------------------------------------------------------------------
  // Notes
  //--------------------------------------------------------------------------

  final String? notes;

  //--------------------------------------------------------------------------
  // Metadata
  //--------------------------------------------------------------------------

  final DateTime? createdAt;

  final DateTime? updatedAt;

  //--------------------------------------------------------------------------
  // Computed Properties
  //--------------------------------------------------------------------------

  bool get hasPhone =>
      phone != null && phone!.trim().isNotEmpty;

  bool get hasEmail =>
      email != null && email!.trim().isNotEmpty;

  bool get hasAddress =>
      address != null;

  bool get hasOutstandingBalance =>
      currentBalance > 0;

  bool get hasCredit =>
      creditLimit > 0;

  double get availableCredit =>
      creditLimit - currentBalance;

  bool get isOverLimit =>
      currentBalance > creditLimit;

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Supplier copyWith({
    String? id,
    String? name,
    String? contactPerson,
    String? phone,
    String? email,
    SupplierAddress? address,
    String? taxNumber,
    String? paymentTerms,
    String? notes,
    double? creditLimit,
    double? currentBalance,
    SupplierStatistics? statistics,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Supplier(
      id: id ?? this.id,
      name: name ?? this.name,
      contactPerson:
          contactPerson ?? this.contactPerson,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      taxNumber:
          taxNumber ?? this.taxNumber,
      paymentTerms:
          paymentTerms ?? this.paymentTerms,
      notes: notes ?? this.notes,
      creditLimit:
          creditLimit ?? this.creditLimit,
      currentBalance:
          currentBalance ?? this.currentBalance,
      statistics:
          statistics ?? this.statistics,
      createdAt:
          createdAt ?? this.createdAt,
      updatedAt:
          updatedAt ?? this.updatedAt,
    );
  }
}