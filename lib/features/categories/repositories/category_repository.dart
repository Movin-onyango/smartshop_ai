import '../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryRepository
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
class CategoryRepository {
  CategoryRepository._();

  static final List<Category> _categories = [
    Category(
      id: '1',
      name: 'Beverages',
      description: 'Milk, juice, soda and other drinks.',
      icon: 0xe57f, // Icons.local_drink
      color: 0xFF2196F3,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Category(
      id: '2',
      name: 'Groceries',
      description: 'Daily grocery products.',
      icon: 0xe56c, // Icons.shopping_basket
      color: 0xFF4CAF50,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Category(
      id: '3',
      name: 'Electronics',
      description: 'Phones, accessories and appliances.',
      icon: 0xe324, // Icons.devices
      color: 0xFF673AB7,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Category(
      id: '4',
      name: 'Cosmetics',
      description: 'Beauty and personal care products.',
      icon: 0xe3ab, // Icons.face
      color: 0xFFE91E63,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Category(
      id: '5',
      name: 'Stationery',
      description: 'Books, pens and office supplies.',
      icon: 0xe8b8, // Icons.edit
      color: 0xFFFF9800,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  //--------------------------------------------------------------------------
  // Read
  //--------------------------------------------------------------------------

  static List<Category> getAll() => List.unmodifiable(_categories);

  static Category? getById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Create
  //--------------------------------------------------------------------------

  static void add(Category category) {
    _categories.add(category);
  }

  //--------------------------------------------------------------------------
  // Update
  //--------------------------------------------------------------------------

  static void update(Category category) {
    final index = _categories.indexWhere((c) => c.id == category.id);

    if (index != -1) {
      _categories[index] = category;
    }
  }

  //--------------------------------------------------------------------------
  // Delete
  //--------------------------------------------------------------------------

  static void delete(String id) {
    _categories.removeWhere((category) => category.id == id);
  }
}
