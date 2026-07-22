/// Product validation utilities.
///
/// Centralizes all validation rules used throughout the
/// Product Management module.
class ProductValidator {
  ProductValidator._();

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required.';
    }

    if (value.trim().length < 2) {
      return 'Product name is too short.';
    }

    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a category.';
    }

    return null;
  }

  static String? validateBuyingPrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Buying price is required.';
    }

    final price = double.tryParse(value);

    if (price == null) {
      return 'Enter a valid number.';
    }

    if (price <= 0) {
      return 'Buying price must be greater than zero.';
    }

    return null;
  }

  static String? validateSellingPrice(
    String? value,
    double buyingPrice,
  ) {
    if (value == null || value.trim().isEmpty) {
      return 'Selling price is required.';
    }

    final price = double.tryParse(value);

    if (price == null) {
      return 'Enter a valid number.';
    }

    if (price < buyingPrice) {
      return 'Selling price cannot be lower than buying price.';
    }

    return null;
  }

  static String? validateQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Quantity is required.';
    }

    final quantity = int.tryParse(value);

    if (quantity == null) {
      return 'Enter a valid quantity.';
    }

    if (quantity < 0) {
      return 'Quantity cannot be negative.';
    }

    return null;
  }

  static String? validateSupplier(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Supplier is required.';
    }

    return null;
  }

  static String? validateBarcode(String? value) {
    if (value == null || value.trim().isEmpty) {
      // Barcode is optional.
      return null;
    }

    if (value.length < 6) {
      return 'Barcode is too short.';
    }

    return null;
  }

  static String? validateExpiryDate(DateTime? expiryDate) {
    if (expiryDate == null) {
      // Expiry date is optional.
      return null;
    }

    final today = DateTime.now();

    final normalizedToday = DateTime(
      today.year,
      today.month,
      today.day,
    );

    final normalizedExpiry = DateTime(
      expiryDate.year,
      expiryDate.month,
      expiryDate.day,
    );

    if (normalizedExpiry.isBefore(normalizedToday)) {
      return 'Expiry date cannot be in the past.';
    }

    return null;
  }
}