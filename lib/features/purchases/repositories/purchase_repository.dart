import '../models/purchase.dart';
import '../models/purchase_item.dart';
import '../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// This will later be replaced with:
/// • SQLite
/// • REST API
/// • Firebase
/// ---------------------------------------------------------------------------
class PurchaseRepository {
  PurchaseRepository._();

  static final List<Purchase> _purchases = [
    Purchase(
      id: '1',
      purchaseNumber: 'PO-000001',
      supplierId: '1',
      supplierName: 'Fresh Foods Ltd',

      orderDate: DateTime.now().subtract(const Duration(days: 7)),

      expectedDeliveryDate: DateTime.now().subtract(const Duration(days: 3)),

      receivedDate: DateTime.now().subtract(const Duration(days: 2)),

      status: PurchaseStatus.received,

      notes: 'Weekly inventory restock.',

      createdAt: DateTime.now().subtract(const Duration(days: 7)),

      updatedAt: DateTime.now().subtract(const Duration(days: 2)),

      items: [
        PurchaseItem(
          id: '1',
          productId: '1',
          productName: 'Brookside Milk 500ml',
          quantity: 100,
          receivedQuantity: 100,
          unitCost: 55,
          tax: 16,
        ),

        PurchaseItem(
          id: '2',
          productId: '2',
          productName: 'White Bread',
          quantity: 80,
          receivedQuantity: 80,
          unitCost: 42,
          tax: 16,
        ),
      ],
    ),

    Purchase(
      id: '2',
      purchaseNumber: 'PO-000002',

      supplierId: '2',
      supplierName: 'City Wholesalers',

      orderDate: DateTime.now().subtract(const Duration(days: 1)),

      expectedDeliveryDate: DateTime.now().add(const Duration(days: 2)),

      status: PurchaseStatus.ordered,

      notes: 'Monthly grocery stock.',

      createdAt: DateTime.now().subtract(const Duration(days: 1)),

      updatedAt: DateTime.now().subtract(const Duration(days: 1)),

      items: [
        PurchaseItem(
          id: '3',
          productId: '3',
          productName: 'Cooking Oil 1L',
          quantity: 50,
          receivedQuantity: 0,
          unitCost: 180,
          tax: 16,
        ),
      ],
    ),
  ];

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  static List<Purchase> getAll() {
    return List.unmodifiable(_purchases);
  }

  static Purchase? findById(String id) {
    try {
      return _purchases.firstWhere((purchase) => purchase.id == id);
    } catch (_) {
      return null;
    }
  }

  static void add(Purchase purchase) {
    _purchases.add(
      purchase.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  static void update(Purchase purchase) {
    final index = _purchases.indexWhere((element) => element.id == purchase.id);

    if (index == -1) return;

    _purchases[index] = purchase.copyWith(updatedAt: DateTime.now());
  }

  static void delete(String id) {
    _purchases.removeWhere((purchase) => purchase.id == id);
  }
}
