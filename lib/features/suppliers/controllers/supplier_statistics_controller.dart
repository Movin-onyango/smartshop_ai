import '../models/supplier.dart';
import '../models/supplier_statistics.dart';

/// ---------------------------------------------------------------------------
/// SupplierStatisticsController
/// ---------------------------------------------------------------------------
///
/// Calculates supplier KPIs used by:
/// • Dashboard
/// • Supplier List
/// • Supplier Details
/// • Reports
/// ---------------------------------------------------------------------------
class SupplierStatisticsController {
  const SupplierStatisticsController();

  //--------------------------------------------------------------------------
  // Aggregate Statistics
  //--------------------------------------------------------------------------

  SupplierStatistics calculate(
    List<Supplier> suppliers,
  ) {
    int totalOrders = 0;
    int completedOrders = 0;
    int pendingOrders = 0;
    int cancelledOrders = 0;

    double totalPurchased = 0;
    double outstandingBalance = 0;

    DateTime? lastOrderDate;

    for (final supplier in suppliers) {
      final stats = supplier.statistics;

      if (stats == null) continue;

      totalOrders += stats.totalOrders;
      completedOrders += stats.completedOrders;
      pendingOrders += stats.pendingOrders;
      cancelledOrders += stats.cancelledOrders;

      totalPurchased += stats.totalPurchased;
      outstandingBalance +=
          stats.outstandingBalance;

      if (stats.lastOrderDate != null) {
        if (lastOrderDate == null ||
            stats.lastOrderDate!
                .isAfter(lastOrderDate)) {
          lastOrderDate =
              stats.lastOrderDate;
        }
      }
    }

    final double  averageOrderValue =
        totalOrders == 0
            ? 0
            : totalPurchased / totalOrders;

    return SupplierStatistics(
      totalOrders: totalOrders,
      completedOrders: completedOrders,
      pendingOrders: pendingOrders,
      cancelledOrders: cancelledOrders,
      totalPurchased: totalPurchased,
      averageOrderValue: averageOrderValue,
      outstandingBalance:
          outstandingBalance,
      lastOrderDate: lastOrderDate,
    );
  }

  //--------------------------------------------------------------------------
  // Dashboard KPIs
  //--------------------------------------------------------------------------

  int totalSuppliers(
    List<Supplier> suppliers,
  ) {
    return suppliers.length;
  }

  int activeSuppliers(
    List<Supplier> suppliers,
  ) {
    return suppliers.where(
      (supplier) =>
          (supplier.statistics?.totalOrders ?? 0) >
          0,
    ).length;
  }

  int suppliersWithBalance(
    List<Supplier> suppliers,
  ) {
    return suppliers.where(
      (supplier) =>
          supplier.currentBalance > 0,
    ).length;
  }

  double totalOutstandingBalance(
    List<Supplier> suppliers,
  ) {
    return suppliers.fold(
      0,
      (sum, supplier) =>
          sum + supplier.currentBalance,
    );
  }

  double totalCreditLimit(
    List<Supplier> suppliers,
  ) {
    return suppliers.fold(
      0,
      (sum, supplier) =>
          sum + supplier.creditLimit,
    );
  }

  double totalPurchases(
    List<Supplier> suppliers,
  ) {
    return suppliers.fold(
      0,
      (sum, supplier) =>
          sum +
          (supplier.statistics
                  ?.totalPurchased ??
              0),
    );
  }
}