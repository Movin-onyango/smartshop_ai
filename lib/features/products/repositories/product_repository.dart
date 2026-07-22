import '../models/product.dart';

/// ---------------------------------------------------------------------------
/// ProductRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// This will later be replaced by:
/// • SQLite
/// • REST API
/// • Firebase
/// • PostgreSQL
/// ---------------------------------------------------------------------------
class ProductRepository {
  ProductRepository._();

  static final List<Product> _products = [
    Product(
      id: '1',
      name: 'Brookside Milk 500ml',
      category: 'Beverages',
      buyingPrice: 55,
      sellingPrice: 70,
      quantity: 45,
      reorderLevel: 10,
      barcode: '100000001',
      description: 'Fresh milk',
      discount: 0,
      trackExpiry: true,
      expiryDate: DateTime.now().add(
        const Duration(days: 14),
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Product(
      id: '2',
      name: 'White Bread',
      category: 'Groceries',
      buyingPrice: 45,
      sellingPrice: 60,
      quantity: 8,
      reorderLevel: 10,
      barcode: '100000002',
      description: 'Sliced bread',
      trackExpiry: true,
      expiryDate: DateTime.now().add(
        const Duration(days: 4),
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Product(
      id: '3',
      name: 'Exercise Book',
      category: 'Stationery',
      buyingPrice: 35,
      sellingPrice: 50,
      quantity: 120,
      reorderLevel: 20,
      barcode: '100000003',
      description: '96 pages',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  /// Returns all products.
  static List<Product> getAll() =>
      List.unmodifiable(_products);

  /// Returns a product by id.
  static Product? getById(String id) {
    try {
      return _products.firstWhere(
        (product) => product.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  /// Adds a product.
  static void add(Product product) {
    _products.add(product);
  }

  /// Updates a product.
  static void update(Product product) {
    final index = _products.indexWhere(
      (p) => p.id == product.id,
    );

    if (index != -1) {
      _products[index] = product;
    }
  }

  /// Deletes a product.
  static void delete(String id) {
    _products.removeWhere(
      (product) => product.id == id,
    );
  }
}