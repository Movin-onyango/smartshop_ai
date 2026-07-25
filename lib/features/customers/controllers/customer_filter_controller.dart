import 'package:flutter/foundation.dart';

import '../models/customer.dart';

/// ---------------------------------------------------------------------------
/// CustomerFilterController
/// ---------------------------------------------------------------------------
///
/// Handles customer filtering.
///
/// Responsibilities:
/// • Credit customers
/// • Loyalty members
/// • Customers with purchases
/// • Customers with balances
/// ---------------------------------------------------------------------------
class CustomerFilterController extends ChangeNotifier {
  List<Customer> _customers = [];

  bool _creditOnly = false;

  bool _loyaltyOnly = false;

  bool _purchasedOnly = false;

  bool _balanceOnly = false;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  bool get creditOnly => _creditOnly;

  bool get loyaltyOnly => _loyaltyOnly;

  bool get purchasedOnly => _purchasedOnly;

  bool get balanceOnly => _balanceOnly;

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadCustomers(List<Customer> customers) {
    _customers = List.from(customers);
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Toggle Filters
  //---------------------------------------------------------------------------

  void setCreditOnly(bool value) {
    _creditOnly = value;
    notifyListeners();
  }

  void setLoyaltyOnly(bool value) {
    _loyaltyOnly = value;
    notifyListeners();
  }

  void setPurchasedOnly(bool value) {
    _purchasedOnly = value;
    notifyListeners();
  }

  void setBalanceOnly(bool value) {
    _balanceOnly = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Filtered Customers
  //---------------------------------------------------------------------------

  List<Customer> get filteredCustomers {
    return _customers.where((customer) {
      if (_creditOnly && customer.creditLimit <= 0) {
        return false;
      }

      if (_loyaltyOnly && customer.loyaltyAccount == null) {
        return false;
      }

      if (_purchasedOnly && customer.totalPurchases == 0) {
        return false;
      }

      if (_balanceOnly && customer.currentBalance <= 0) {
        return false;
      }

      return true;
    }).toList();
  }

  //---------------------------------------------------------------------------
  // Reset
  //---------------------------------------------------------------------------

  void clearFilters() {
    _creditOnly = false;
    _loyaltyOnly = false;
    _purchasedOnly = false;
    _balanceOnly = false;

    notifyListeners();
  }
}
