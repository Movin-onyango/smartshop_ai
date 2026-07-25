class InventoryReport {
  const InventoryReport({
    required this.stockValue,
    required this.totalProducts,
    required this.lowStock,
    required this.outOfStock,
  });

  final double stockValue;
  final int totalProducts;
  final int lowStock;
  final int outOfStock;
}
