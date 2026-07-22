class Product {
  const Product({
    this.id,
    required this.name,
    required this.category,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.quantity,
    required this.reorderLevel,
    this.barcode,
    this.description,
    this.expiryDate,
    this.trackExpiry = false,
    this.lowStockAlerts = true,
    this.discount = 0,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;

  final String name;

  final String category;

  final String? barcode;

  final String? description;

  final double buyingPrice;

  final double sellingPrice;

  final double discount;

  final int quantity;

  final int reorderLevel;

  final DateTime? expiryDate;

  final bool trackExpiry;

  final bool lowStockAlerts;

  final String? imageUrl;

  final DateTime? createdAt;

  final DateTime? updatedAt;
}