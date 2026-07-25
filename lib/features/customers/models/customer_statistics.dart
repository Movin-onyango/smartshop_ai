import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// CustomerStatistics
/// ---------------------------------------------------------------------------
///
/// Stores customer purchasing and credit analytics.
///
/// This model intentionally contains only computed business data.
/// Customer identity and contact information belong in Customer.
/// ---------------------------------------------------------------------------
@immutable
class CustomerStatistics {
  const CustomerStatistics({
    this.totalPurchases = 0,
    this.totalSpent = 0,
    this.currentBalance = 0,
    this.lastPurchaseDate,
  });

  //---------------------------------------------------------------------------
  // Purchase Statistics
  //---------------------------------------------------------------------------

  final int totalPurchases;

  final double totalSpent;

  //---------------------------------------------------------------------------
  // Credit
  //---------------------------------------------------------------------------

  final double currentBalance;

  //---------------------------------------------------------------------------
  // Activity
  //---------------------------------------------------------------------------

  final DateTime? lastPurchaseDate;

  //---------------------------------------------------------------------------
  // Computed Values
  //---------------------------------------------------------------------------

  bool get hasPurchases => totalPurchases > 0;

  bool get hasOutstandingBalance => currentBalance > 0;

  double get averagePurchaseValue {
    if (totalPurchases == 0) {
      return 0;
    }

    return totalSpent / totalPurchases;
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  CustomerStatistics copyWith({
    int? totalPurchases,
    double? totalSpent,
    double? currentBalance,
    DateTime? lastPurchaseDate,
  }) {
    return CustomerStatistics(
      totalPurchases: totalPurchases ?? this.totalPurchases,
      totalSpent: totalSpent ?? this.totalSpent,
      currentBalance: currentBalance ?? this.currentBalance,
      lastPurchaseDate: lastPurchaseDate ?? this.lastPurchaseDate,
    );
  }
}
