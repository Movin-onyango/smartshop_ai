import '../models/payment.dart';
import '../models/sale.dart';
import '../models/sale_item.dart';

import '../../products/repositories/product_repository.dart';

/// ---------------------------------------------------------------------------
/// SalesRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// Later this will be replaced by:
/// • SQLite
/// • PostgreSQL
/// • REST API
/// • Firebase
/// ---------------------------------------------------------------------------
class SalesRepository {
  SalesRepository._();

  static final List<Sale> _sales = [
    Sale(
      id: '1',
      invoiceNumber: 'INV-1001',
      saleDate: DateTime.now().subtract(
        const Duration(hours: 2),
      ),
      payment: const Payment(
        method: PaymentMethod.cash,
        amountPaid: 270,
      ),
      items: [
        SaleItem(
          id: '1',
          product: ProductRepository.getById('1')!,
          quantity: 2,
          unitPrice: 70,
        ),
        SaleItem(
          id: '2',
          product: ProductRepository.getById('2')!,
          quantity: 2,
          unitPrice: 60,
          discount: 10,
        ),
      ],
    ),
    Sale(
      id: '2',
      invoiceNumber: 'INV-1002',
      saleDate: DateTime.now().subtract(
        const Duration(days: 1),
      ),
      payment: const Payment(
        method: PaymentMethod.mpesa,
        amountPaid: 150,
        reference: 'SGL8H29JK',
      ),
      items: [
        SaleItem(
          id: '3',
          product: ProductRepository.getById('3')!,
          quantity: 3,
          unitPrice: 50,
        ),
      ],
    ),
  ];

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  static List<Sale> getAll() =>
      List.unmodifiable(_sales);

  static Sale? getById(String id) {
    try {
      return _sales.firstWhere(
        (sale) => sale.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  static void add(Sale sale) {
    _sales.add(sale);
  }

  static void update(Sale sale) {
    final index = _sales.indexWhere(
      (s) => s.id == sale.id,
    );

    if (index != -1) {
      _sales[index] = sale;
    }
  }

  static void delete(String id) {
    _sales.removeWhere(
      (sale) => sale.id == id,
    );
  }

  //---------------------------------------------------------------------------
  // Checkout API
  //---------------------------------------------------------------------------

  static Future<Sale> createSale(Sale sale) async {
    _sales.add(sale);
    return sale;
  }

  static Future<Sale?> getSale(String id) async {
    return getById(id);
  }

  static Future<List<Sale>> getAllSales() async {
    return getAll();
  }

  static Future<void> updateSale(Sale sale) async {
    update(sale);
  }

  static Future<void> deleteSale(String id) async {
    delete(id);
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  static List<Sale> search(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      return getAll();
    }

    return _sales.where((sale) {
      return sale.invoiceNumber
              .toLowerCase()
              .contains(q) ||
          (sale.customerName ?? '')
              .toLowerCase()
              .contains(q);
    }).toList();
  }

  //---------------------------------------------------------------------------
  // Statistics
  //---------------------------------------------------------------------------

  static double totalRevenue() {
    return _sales.fold(
      0,
      (sum, sale) => sum + sale.subtotal,
    );
  }

  static double totalProfit() {
    return _sales.fold(
      0,
      (sum, sale) => sum + sale.profit,
    );
  }

  static int totalTransactions() {
    return _sales.length;
  }
}