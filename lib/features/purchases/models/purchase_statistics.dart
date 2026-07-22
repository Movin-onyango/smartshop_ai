/// ---------------------------------------------------------------------------
/// PurchaseStatistics
/// ---------------------------------------------------------------------------
///
/// Aggregated purchase KPIs used throughout the application.
///
/// Used by:
/// • Dashboard
/// • Purchase List
/// • Purchase Details
/// • Reports
/// ---------------------------------------------------------------------------
class PurchaseStatistics {
  const PurchaseStatistics({
    this.totalPurchases = 0,
    this.pendingPurchases = 0,
    this.receivedPurchases = 0,
    this.cancelledPurchases = 0,
    this.totalItemsPurchased = 0,
    this.totalQuantityPurchased = 0,
    this.totalSpent = 0,
    this.averagePurchaseValue = 0,
    this.totalTax = 0,
    this.totalDiscount = 0,
    this.outstandingAmount = 0,
    this.lastPurchaseDate,
  });

  //---------------------------------------------------------------------------
  // Purchase Counts
  //---------------------------------------------------------------------------

  final int totalPurchases;

  final int pendingPurchases;

  final int receivedPurchases;

  final int cancelledPurchases;

  //---------------------------------------------------------------------------
  // Item Statistics
  //---------------------------------------------------------------------------

  final int totalItemsPurchased;

  final double totalQuantityPurchased;

  //---------------------------------------------------------------------------
  // Financial Statistics
  //---------------------------------------------------------------------------

  final double totalSpent;

  final double averagePurchaseValue;

  final double totalTax;

  final double totalDiscount;

  final double outstandingAmount;

  //---------------------------------------------------------------------------
  // Dates
  //---------------------------------------------------------------------------

  final DateTime? lastPurchaseDate;

  //---------------------------------------------------------------------------
  // Derived KPIs
  //---------------------------------------------------------------------------

  int get completedPurchases =>
      receivedPurchases;

  int get openPurchases =>
      pendingPurchases;

  double get completionRate {
    if (totalPurchases == 0) {
      return 0;
    }

    return receivedPurchases /
        totalPurchases;
  }

  double get cancellationRate {
    if (totalPurchases == 0) {
      return 0;
    }

    return cancelledPurchases /
        totalPurchases;
  }

  //---------------------------------------------------------------------------
  // Copy
  //---------------------------------------------------------------------------

  PurchaseStatistics copyWith({
    int? totalPurchases,
    int? pendingPurchases,
    int? receivedPurchases,
    int? cancelledPurchases,
    int? totalItemsPurchased,
    double? totalQuantityPurchased,
    double? totalSpent,
    double? averagePurchaseValue,
    double? totalTax,
    double? totalDiscount,
    double? outstandingAmount,
    DateTime? lastPurchaseDate,
  }) {
    return PurchaseStatistics(
      totalPurchases:
          totalPurchases ??
              this.totalPurchases,
      pendingPurchases:
          pendingPurchases ??
              this.pendingPurchases,
      receivedPurchases:
          receivedPurchases ??
              this.receivedPurchases,
      cancelledPurchases:
          cancelledPurchases ??
              this.cancelledPurchases,
      totalItemsPurchased:
          totalItemsPurchased ??
              this.totalItemsPurchased,
      totalQuantityPurchased:
          totalQuantityPurchased ??
              this.totalQuantityPurchased,
      totalSpent:
          totalSpent ??
              this.totalSpent,
      averagePurchaseValue:
          averagePurchaseValue ??
              this.averagePurchaseValue,
      totalTax:
          totalTax ??
              this.totalTax,
      totalDiscount:
          totalDiscount ??
              this.totalDiscount,
      outstandingAmount:
          outstandingAmount ??
              this.outstandingAmount,
      lastPurchaseDate:
          lastPurchaseDate ??
              this.lastPurchaseDate,
    );
  }
}