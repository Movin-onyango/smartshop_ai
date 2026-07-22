import '../models/customer.dart';
import '../models/customer_statistics.dart';
import '../models/loyalty_account.dart';

/// ---------------------------------------------------------------------------
/// CustomerRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// Later replace with:
/// • SQLite
/// • REST API
/// • PostgreSQL
/// ---------------------------------------------------------------------------
class CustomerRepository {
  CustomerRepository._();

  static final List<Customer> _customers = [
    Customer(
      id: '1',
      name: 'John Kamau',
      phone: '0712345678',
      email: 'john@example.com',
      address: 'Nyeri',
      creditLimit: 10000,

      statistics: CustomerStatistics(
        totalPurchases: 18,
        totalSpent: 52300,
        currentBalance: 2500,
        lastPurchaseDate: DateTime.now().subtract(
          const Duration(days: 2),
        ),
      ),

      loyaltyAccount: LoyaltyAccount(
        accountNumber: 'LOY-1001',
        points: 580,
        totalPointsEarned: 900,
        totalPointsRedeemed: 320,
        tier: LoyaltyTier.gold,
        joinedAt: DateTime.now().subtract(
          const Duration(days: 420),
        ),
      ),

      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Customer(
      id: '2',
      name: 'Mary Wanjiku',
      phone: '0723456789',
      email: 'mary@example.com',
      address: 'Nairobi',

      statistics: CustomerStatistics(
        totalPurchases: 7,
        totalSpent: 18450,
        currentBalance: 0,
        lastPurchaseDate: DateTime.now().subtract(
          const Duration(days: 7),
        ),
      ),

      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),

    Customer(
      id: '3',
      name: 'Peter Mwangi',
      phone: '0734567890',
      email: 'peter@example.com',
      address: 'Karatina',
      creditLimit: 5000,

      statistics: CustomerStatistics(
        totalPurchases: 11,
        totalSpent: 26700,
        currentBalance: 1200,
        lastPurchaseDate: DateTime.now().subtract(
          const Duration(days: 1),
        ),
      ),

      loyaltyAccount: LoyaltyAccount(
        accountNumber: 'LOY-1002',
        points: 145,
        totalPointsEarned: 200,
        totalPointsRedeemed: 55,
        tier: LoyaltyTier.silver,
        joinedAt: DateTime.now().subtract(
          const Duration(days: 180),
        ),
      ),

      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  //--------------------------------------------------------------------------
  // Read
  //--------------------------------------------------------------------------

  static List<Customer> getAll() =>
      List.unmodifiable(_customers);

  static Customer? getById(String id) {
    try {
      return _customers.firstWhere(
        (customer) => customer.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Create
  //--------------------------------------------------------------------------

  static void add(Customer customer) {
    _customers.add(customer);
  }

  //--------------------------------------------------------------------------
  // Update
  //--------------------------------------------------------------------------

  static void update(Customer customer) {
    final index = _customers.indexWhere(
      (c) => c.id == customer.id,
    );

    if (index != -1) {
      _customers[index] = customer;
    }
  }

  //--------------------------------------------------------------------------
  // Delete
  //--------------------------------------------------------------------------

  static void delete(String id) {
    _customers.removeWhere(
      (customer) => customer.id == id,
    );
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  static List<Customer> search(
    String query,
  ) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      return getAll();
    }

    return _customers.where((customer) {
      return customer.name
              .toLowerCase()
              .contains(q) ||
          (customer.phone ?? '')
              .toLowerCase()
              .contains(q) ||
          (customer.email ?? '')
              .toLowerCase()
              .contains(q);
    }).toList();
  }

  //--------------------------------------------------------------------------
  // Dashboard Statistics
  //--------------------------------------------------------------------------

  static int totalCustomers() =>
      _customers.length;

  static int customersWithCredit() =>
      _customers
          .where(
            (customer) =>
                customer.creditLimit > 0,
          )
          .length;

  static int loyaltyMembers() =>
      _customers
          .where(
            (customer) =>
                customer.loyaltyAccount != null,
          )
          .length;

  static double totalSales() =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.totalSpent,
      );

  static double outstandingCredit() =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.currentBalance,
      );
}