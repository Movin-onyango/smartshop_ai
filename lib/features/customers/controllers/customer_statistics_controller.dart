import 'package:flutter/foundation.dart';

import '../models/customer.dart';
import '../models/customer_statistics.dart';

/// ---------------------------------------------------------------------------
/// CustomerStatisticsController
/// ---------------------------------------------------------------------------
///
/// Calculates business statistics for customers.
///
/// Responsibilities:
/// • Customer totals
/// • Credit totals
/// • Loyalty totals
/// • Purchase analytics
/// ---------------------------------------------------------------------------
class CustomerStatisticsController extends ChangeNotifier {
  List<Customer> _customers = [];

  CustomerStatisticsController({
    List<Customer>? customers,
  }) {
    if (customers != null) {
      loadCustomers(customers);
    }
  }

  //--------------------------------------------------------------------------
  // Initialization
  //--------------------------------------------------------------------------

  void loadCustomers(
    List<Customer> customers,
  ) {
    _customers = List.from(customers);
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Basic Counts
  //--------------------------------------------------------------------------

  int get totalCustomers =>
      _customers.length;

  int get customersWithCredit =>
      _customers
          .where(
            (customer) =>
                customer.creditLimit > 0,
          )
          .length;

  int get loyaltyMembers =>
      _customers
          .where(
            (customer) =>
                customer.loyaltyAccount != null,
          )
          .length;

  int get customersWithPurchases =>
      _customers
          .where(
            (customer) =>
                customer.totalPurchases > 0,
          )
          .length;

  //--------------------------------------------------------------------------
  // Purchase Statistics
  //--------------------------------------------------------------------------

  int get totalPurchases =>
      _customers.fold(
        0,
        (sum, customer) =>
            sum + customer.totalPurchases,
      );

  double get totalRevenue =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.totalSpent,
      );

  double get averageCustomerValue {
    if (_customers.isEmpty) {
      return 0;
    }

    return totalRevenue /
        _customers.length;
  }

  //--------------------------------------------------------------------------
  // Credit
  //--------------------------------------------------------------------------

  double get totalCreditLimit =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.creditLimit,
      );

  double get outstandingBalance =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum +
            customer.currentBalance,
      );

  //--------------------------------------------------------------------------
  // Loyalty
  //--------------------------------------------------------------------------

  int get totalLoyaltyPoints =>
      _customers.fold(
        0,
        (sum, customer) =>
            sum +
            (customer
                    .loyaltyAccount
                    ?.points ??
                0),
      );

  //--------------------------------------------------------------------------
  // Dashboard Model
  //--------------------------------------------------------------------------

  CustomerStatistics summary() {
    return CustomerStatistics(
      totalPurchases:
          totalPurchases,
      totalSpent:
          totalRevenue,
      currentBalance:
          outstandingBalance,
      lastPurchaseDate: _customers
          .where(
            (c) =>
                c.lastPurchaseDate !=
                null,
          )
          .map(
            (c) =>
                c.lastPurchaseDate!,
          )
          .fold<DateTime?>(
            null,
            (latest, date) {
              if (latest == null) {
                return date;
              }

              return date.isAfter(latest)
                  ? date
                  : latest;
            },
          ),
    );
  }

  //--------------------------------------------------------------------------
  // Refresh
  //--------------------------------------------------------------------------

  void refresh(
    List<Customer> customers,
  ) {
    loadCustomers(customers);
  }

  void clear() {
    _customers.clear();
    notifyListeners();
  }
}