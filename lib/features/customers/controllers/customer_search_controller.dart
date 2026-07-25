import 'package:flutter/foundation.dart';

import '../models/customer.dart';

/// ---------------------------------------------------------------------------
/// CustomerSearchController
/// ---------------------------------------------------------------------------
///
/// Handles customer searching.
///
/// Responsibilities:
/// • Search customers
/// • Maintain filtered list
/// ---------------------------------------------------------------------------
class CustomerSearchController extends ChangeNotifier {
  List<Customer> _allCustomers = [];

  List<Customer> _filteredCustomers = [];

  String _query = '';

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  String get query => _query;

  List<Customer> get filteredCustomers => List.unmodifiable(_filteredCustomers);

  bool get isSearching => _query.trim().isNotEmpty;

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadCustomers(List<Customer> customers) {
    _allCustomers = List.from(customers);
    _filteredCustomers = List.from(customers);

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  void search(String value) {
    _query = value.trim();

    if (_query.isEmpty) {
      _filteredCustomers = List.from(_allCustomers);

      notifyListeners();
      return;
    }

    final q = _query.toLowerCase();

    _filteredCustomers = _allCustomers.where((customer) {
      return customer.name.toLowerCase().contains(q) ||
          (customer.phone ?? '').toLowerCase().contains(q) ||
          (customer.email ?? '').toLowerCase().contains(q) ||
          (customer.address ?? '').toLowerCase().contains(q);
    }).toList();

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Reset
  //---------------------------------------------------------------------------

  void clear() {
    _query = '';
    _filteredCustomers = List.from(_allCustomers);

    notifyListeners();
  }
}
