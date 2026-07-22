import 'package:flutter/foundation.dart';

import 'customer_statistics.dart';
import 'loyalty_account.dart';

/// ---------------------------------------------------------------------------
/// Customer
/// ---------------------------------------------------------------------------
///
/// Represents a customer in SmartShop AI.
/// ---------------------------------------------------------------------------
@immutable
class Customer {
  const Customer({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.notes,

    this.creditLimit = 0,

    CustomerStatistics? statistics,
    LoyaltyAccount? loyaltyAccount,

    this.createdAt,
    this.updatedAt,
  })  : statistics =
            statistics ??
            const CustomerStatistics(),
        loyaltyAccount = loyaltyAccount;

  //---------------------------------------------------------------------------
  // Identity
  //---------------------------------------------------------------------------

  final String? id;

  final String name;

  final String? phone;

  final String? email;

  //---------------------------------------------------------------------------
  // Contact
  //---------------------------------------------------------------------------

  final String? address;

  final String? notes;

  //---------------------------------------------------------------------------
  // Credit
  //---------------------------------------------------------------------------

  final double creditLimit;

  //---------------------------------------------------------------------------
  // Related Models
  //---------------------------------------------------------------------------

  final CustomerStatistics statistics;

  final LoyaltyAccount? loyaltyAccount;

  //---------------------------------------------------------------------------
  // Metadata
  //---------------------------------------------------------------------------

  final DateTime? createdAt;

  final DateTime? updatedAt;

  //---------------------------------------------------------------------------
  // Convenience Getters
  //---------------------------------------------------------------------------

  bool get hasPhone =>
      phone != null &&
      phone!.trim().isNotEmpty;

  bool get hasEmail =>
      email != null &&
      email!.trim().isNotEmpty;

  bool get hasAddress =>
      address != null &&
      address!.trim().isNotEmpty;

  bool get hasCredit =>
      creditLimit > 0;

  double get currentBalance =>
      statistics.currentBalance;

  double get availableCredit =>
      creditLimit - statistics.currentBalance;

  bool get isOverLimit =>
      statistics.currentBalance >
      creditLimit;

  int get totalPurchases =>
      statistics.totalPurchases;

  double get totalSpent =>
      statistics.totalSpent;

  DateTime? get lastPurchaseDate =>
      statistics.lastPurchaseDate;

  //---------------------------------------------------------------------------
  // Loyalty Helpers
  //---------------------------------------------------------------------------

  bool get hasLoyalty =>
      loyaltyAccount != null;

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? notes,
    double? creditLimit,
    CustomerStatistics? statistics,
    LoyaltyAccount? loyaltyAccount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      creditLimit:
          creditLimit ?? this.creditLimit,
      statistics:
          statistics ?? this.statistics,
      loyaltyAccount:
          loyaltyAccount ?? this.loyaltyAccount,
      createdAt:
          createdAt ?? this.createdAt,
      updatedAt:
          updatedAt ?? this.updatedAt,
    );
  }
}