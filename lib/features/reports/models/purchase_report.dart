class PurchaseReport {
  const PurchaseReport({
    required this.totalPurchases,
    required this.totalOrders,
    required this.averagePurchase,
  });

  final double totalPurchases;
  final int totalOrders;
  final double averagePurchase;
}