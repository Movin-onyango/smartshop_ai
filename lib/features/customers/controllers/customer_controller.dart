import 'package:flutter/foundation.dart';

import '../models/customer.dart';
import '../repositories/customer_repository.dart';

/// ---------------------------------------------------------------------------
/// CustomerController
/// ---------------------------------------------------------------------------
///
/// Coordinates customer operations.
///
/// Responsibilities:
/// • Load customers
/// • CRUD
/// • Refresh UI
/// ---------------------------------------------------------------------------
class CustomerController extends ChangeNotifier {
  final List<Customer> _customers = [];

  bool _isLoading = false;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<Customer> get customers => List.unmodifiable(_customers);

  bool get isLoading => _isLoading;

  bool get isEmpty => _customers.isEmpty;

  bool get isNotEmpty => _customers.isNotEmpty;

  int get customerCount => _customers.length;

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadCustomers() {
    _customers
      ..clear()
      ..addAll(CustomerRepository.getAll());

    notifyListeners();
  }

  Future<void> refresh() async {
    loadCustomers();
  }

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  void addCustomer(Customer customer) {
    CustomerRepository.add(customer);
    loadCustomers();
  }

  void updateCustomer(Customer customer) {
    CustomerRepository.update(customer);
    loadCustomers();
  }

  void deleteCustomer(String id) {
    CustomerRepository.delete(id);
    loadCustomers();
  }

  //---------------------------------------------------------------------------
  // Lookup
  //---------------------------------------------------------------------------

  Customer? findById(String id) {
    try {
      return _customers.firstWhere((customer) => customer.id == id);
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Loading
  //---------------------------------------------------------------------------

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Dashboard Helpers
  //---------------------------------------------------------------------------

  int get customersWithCredit =>
      _customers.where((customer) => customer.creditLimit > 0).length;

  int get loyaltyMembers =>
      _customers.where((customer) => customer.loyaltyAccount != null).length;

  double get totalCustomerSales =>
      _customers.fold(0.0, (sum, customer) => sum + customer.totalSpent);

  double get outstandingCredit =>
      _customers.fold(0.0, (sum, customer) => sum + customer.currentBalance);
}
