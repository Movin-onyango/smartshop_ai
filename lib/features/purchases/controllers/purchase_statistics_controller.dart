import '../models/purchase.dart';
import '../models/purchase_statistics.dart';
import '../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseStatisticsController
/// ---------------------------------------------------------------------------
///
/// Calculates purchase KPIs used by:
/// • Dashboard
/// • Purchase List
/// • Purchase Details
/// • Reports
/// ---------------------------------------------------------------------------
class PurchaseStatisticsController {
  const PurchaseStatisticsController();

  //---------------------------------------------------------------------------
  // Aggregate Statistics
  //---------------------------------------------------------------------------

  PurchaseStatistics calculate(List<Purchase> purchases) {
    int totalPurchases = purchases.length;
    int pendingPurchases = 0;
    int receivedPurchases = 0;
    int cancelledPurchases = 0;

    int totalItemsPurchased = 0;

    double totalQuantityPurchased = 0;
    double totalSpent = 0;
    double totalTax = 0;
    double totalDiscount = 0;
    double outstandingAmount = 0;

    DateTime? lastPurchaseDate;

    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.received:
          receivedPurchases++;
          break;

        case PurchaseStatus.cancelled:
          cancelledPurchases++;
          break;

        case PurchaseStatus.draft:
        case PurchaseStatus.pendingApproval:
        case PurchaseStatus.ordered:
        case PurchaseStatus.partial:
          pendingPurchases++;
          break;
      }

      totalItemsPurchased += purchase.totalItems;
      totalQuantityPurchased += purchase.totalQuantity;
      totalSpent += purchase.grandTotal;
      totalTax += purchase.totalTax;
      totalDiscount += purchase.totalDiscount;

      if (purchase.status != PurchaseStatus.received) {
        outstandingAmount += purchase.grandTotal;
      }

      if (lastPurchaseDate == null ||
          purchase.orderDate.isAfter(lastPurchaseDate)) {
        lastPurchaseDate = purchase.orderDate;
      }
    }

    final double averagePurchaseValue = totalPurchases == 0
        ? 0.0
        : totalSpent / totalPurchases;

    return PurchaseStatistics(
      totalPurchases: totalPurchases,
      pendingPurchases: pendingPurchases,
      receivedPurchases: receivedPurchases,
      cancelledPurchases: cancelledPurchases,
      totalItemsPurchased: totalItemsPurchased,
      totalQuantityPurchased: totalQuantityPurchased,
      totalSpent: totalSpent,
      averagePurchaseValue: averagePurchaseValue,
      totalTax: totalTax,
      totalDiscount: totalDiscount,
      outstandingAmount: outstandingAmount,
      lastPurchaseDate: lastPurchaseDate,
    );
  }

  //---------------------------------------------------------------------------
  // Dashboard KPIs
  //---------------------------------------------------------------------------

  int totalPurchases(List<Purchase> purchases) {
    return purchases.length;
  }

  int pendingPurchases(List<Purchase> purchases) {
    return purchases
        .where(
          (purchase) =>
              purchase.status != PurchaseStatus.received &&
              purchase.status != PurchaseStatus.cancelled,
        )
        .length;
  }

  int completedPurchases(List<Purchase> purchases) {
    return purchases
        .where((purchase) => purchase.status == PurchaseStatus.received)
        .length;
  }

  double totalSpent(List<Purchase> purchases) {
    return purchases.fold(0.0, (sum, purchase) => sum + purchase.grandTotal);
  }

  double outstandingAmount(List<Purchase> purchases) {
    return purchases.fold(0.0, (sum, purchase) {
      if (purchase.status == PurchaseStatus.received) {
        return sum;
      }

      return sum + purchase.grandTotal;
    });
  }

  double averagePurchaseValue(List<Purchase> purchases) {
    if (purchases.isEmpty) {
      return 0.0;
    }

    return totalSpent(purchases) / purchases.length;
  }
}
