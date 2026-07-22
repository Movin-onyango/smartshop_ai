import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// SupplierStatistics
/// ---------------------------------------------------------------------------
///
/// Aggregated supplier performance statistics.
///
/// These values are calculated from purchase records and are
/// intended for reporting and dashboard purposes.
/// ---------------------------------------------------------------------------
@immutable
class SupplierStatistics {
  const SupplierStatistics({
    this.totalOrders = 0,
    this.completedOrders = 0,
    this.pendingOrders = 0,
    this.cancelledOrders = 0,
    this.totalPurchased = 0,
    this.averageOrderValue = 0,
    this.outstandingBalance = 0,
    this.lastOrderDate,
  });

  //--------------------------------------------------------------------------
  // Orders
  //--------------------------------------------------------------------------

  final int totalOrders;

  final int completedOrders;

  final int pendingOrders;

  final int cancelledOrders;

  //--------------------------------------------------------------------------
  // Financial
  //--------------------------------------------------------------------------

  final double totalPurchased;

  final double averageOrderValue;

  final double outstandingBalance;

  //--------------------------------------------------------------------------
  // Dates
  //--------------------------------------------------------------------------

  final DateTime? lastOrderDate;

  //--------------------------------------------------------------------------
  // Computed Properties
  //--------------------------------------------------------------------------

  bool get hasOrders => totalOrders > 0;

  bool get hasOutstandingBalance =>
      outstandingBalance > 0;

  double get completionRate {
    if (totalOrders == 0) {
      return 0;
    }

    return (completedOrders / totalOrders) * 100;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  SupplierStatistics copyWith({
    int? totalOrders,
    int? completedOrders,
    int? pendingOrders,
    int? cancelledOrders,
    double? totalPurchased,
    double? averageOrderValue,
    double? outstandingBalance,
    DateTime? lastOrderDate,
  }) {
    return SupplierStatistics(
      totalOrders:
          totalOrders ?? this.totalOrders,
      completedOrders:
          completedOrders ?? this.completedOrders,
      pendingOrders:
          pendingOrders ?? this.pendingOrders,
      cancelledOrders:
          cancelledOrders ?? this.cancelledOrders,
      totalPurchased:
          totalPurchased ?? this.totalPurchased,
      averageOrderValue:
          averageOrderValue ?? this.averageOrderValue,
      outstandingBalance:
          outstandingBalance ?? this.outstandingBalance,
      lastOrderDate:
          lastOrderDate ?? this.lastOrderDate,
    );
  }
}