class SalesReport {
  const SalesReport({
    required this.totalSales,
    required this.totalOrders,
    required this.averageOrder,
    required this.profit,
  });

  final double totalSales;
  final int totalOrders;
  final double averageOrder;
  final double profit;
}