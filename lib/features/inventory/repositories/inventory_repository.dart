import '../../products/repositories/product_repository.dart';
import '../models/inventory_item.dart';

/// ---------------------------------------------------------------------------
/// InventoryRepository
/// -----------///
/// Temporary in-memory repository.
///
/// The inventory is initialized from the ProductRepository so that
/// every product automatically has an inventory record.
///
/// This can later be replaced by:
/// • SQLite
/// • REST API
/// • PostgreSQL
/// ---------------------------------------------------------------------------
class InventoryRepository {
  InventoryRepository._();

  static final List<InventoryItem> _inventory = ProductRepository.getAll()
      .map(
        (product) => InventoryItem(
          id: product.id ?? DateTime.now().toIso8601String(),
          product: product,
          quantity: product.quantity,
          reorderLevel: product.reorderLevel,
          lastUpdated: DateTime.now(),
        ),
      )
      .toList();

  //--------------------------------------------------------------------------
  // Read
  //--------------------------------------------------------------------------

  static List<InventoryItem> getAll() => List.unmodifiable(_inventory);

  static InventoryItem? getById(String id) {
    try {
      return _inventory.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Update Stock
  //--------------------------------------------------------------------------

  static void update(InventoryItem item) {
    final index = _inventory.indexWhere((i) => i.id == item.id);

    if (index != -1) {
      _inventory[index] = item;
    }
  }

  //--------------------------------------------------------------------------
  // Stock Adjustment
  //--------------------------------------------------------------------------

  static void increaseStock(String id, int quantity) {
    final item = getById(id);

    if (item == null) return;

    update(
      item.copyWith(
        quantity: item.quantity + quantity,
        lastUpdated: DateTime.now(),
      ),
    );
  }

  static void decreaseStock(String id, int quantity) {
    final item = getById(id);

    if (item == null) return;

    final newQuantity = item.quantity - quantity;

    update(
      item.copyWith(
        quantity: newQuantity < 0 ? 0 : newQuantity,
        lastUpdated: DateTime.now(),
      ),
    );
  }
}
