import '../models/supplier.dart';
import '../models/supplier_address.dart';
import '../models/supplier_statistics.dart';

/// ---------------------------------------------------------------------------
/// SupplierRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// This will later be replaced by SQLite / Drift / Supabase / API.
/// ---------------------------------------------------------------------------
class SupplierRepository {
  SupplierRepository._();

  static final List<Supplier> _suppliers = [
    Supplier(
      id: '1',
      name: 'MovoFeeds Ltd',
      contactPerson: 'John Mwangi',
      phone: '+254712345678',
      email: 'sales@movofeeds.co.ke',
      taxNumber: 'PIN123456',
      paymentTerms: '30 Days',
      creditLimit: 500000,
      currentBalance: 125000,
      notes: 'Main animal feeds supplier.',
      address: const SupplierAddress(
        country: 'Kenya',
        county: 'Nyeri',
        city: 'Nyeri',
        street: 'Industrial Area',
      ),
      statistics: const SupplierStatistics(
        totalOrders: 48,
        completedOrders: 45,
        pendingOrders: 2,
        cancelledOrders: 1,
        totalPurchased: 2450000,
        averageOrderValue: 51041.67,
        outstandingBalance: 125000,
      ),
    ),

    Supplier(
      id: '2',
      name: 'Brookside Dairy',
      contactPerson: 'Mary Wanjiku',
      phone: '+254700111222',
      email: 'orders@brookside.co.ke',
      paymentTerms: '14 Days',
      creditLimit: 250000,
      currentBalance: 35000,
      notes: 'Dairy products supplier.',
      address: const SupplierAddress(
        country: 'Kenya',
        county: 'Kiambu',
        city: 'Ruiru',
      ),
      statistics: const SupplierStatistics(
        totalOrders: 20,
        completedOrders: 20,
        pendingOrders: 0,
        cancelledOrders: 0,
        totalPurchased: 820000,
        averageOrderValue: 41000,
        outstandingBalance: 35000,
      ),
    ),

    Supplier(
      id: '3',
      name: 'Bidco Africa',
      contactPerson: 'James Otieno',
      phone: '+254733123456',
      email: 'trade@bidcoafrica.com',
      paymentTerms: 'Cash',
      notes: 'Cooking oil and household products.',
      address: const SupplierAddress(
        country: 'Kenya',
        county: 'Nairobi',
        city: 'Nairobi',
      ),
      statistics: const SupplierStatistics(
        totalOrders: 15,
        completedOrders: 15,
        pendingOrders: 0,
        cancelledOrders: 0,
        totalPurchased: 615000,
        averageOrderValue: 41000,
      ),
    ),
  ];

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  static List<Supplier> getAll() => List.unmodifiable(_suppliers);

  static Supplier? findById(String id) {
    try {
      return _suppliers.firstWhere((supplier) => supplier.id == id);
    } catch (_) {
      return null;
    }
  }

  static void add(Supplier supplier) {
    _suppliers.add(supplier);
  }

  static void update(Supplier supplier) {
    final index = _suppliers.indexWhere((item) => item.id == supplier.id);

    if (index != -1) {
      _suppliers[index] = supplier;
    }
  }

  static void delete(String id) {
    _suppliers.removeWhere((supplier) => supplier.id == id);
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  static List<Supplier> search(String query) {
    if (query.trim().isEmpty) {
      return getAll();
    }

    final q = query.toLowerCase();

    return _suppliers.where((supplier) {
      return supplier.name.toLowerCase().contains(q) ||
          (supplier.contactPerson?.toLowerCase().contains(q) ?? false) ||
          (supplier.phone?.toLowerCase().contains(q) ?? false) ||
          (supplier.email?.toLowerCase().contains(q) ?? false);
    }).toList();
  }
}
