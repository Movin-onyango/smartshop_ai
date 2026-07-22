import '../models/product.dart';

extension ProductExtensions on Product {
  double get effectiveSellingPrice =>
      sellingPrice - ((sellingPrice * discount) / 100);

  double get profit =>
      effectiveSellingPrice - buyingPrice;

  double get margin =>
      effectiveSellingPrice == 0
          ? 0
          : (profit / effectiveSellingPrice) * 100;

  bool get isLowStock =>
      quantity <= reorderLevel;

  bool get hasExpired =>
      expiryDate != null &&
      expiryDate!.isBefore(DateTime.now());

  bool get expiresSoon {
    if (expiryDate == null) return false;

    return expiryDate!
            .difference(DateTime.now())
            .inDays <=
        30;
  }

  double get stockValue =>
      buyingPrice * quantity;
}