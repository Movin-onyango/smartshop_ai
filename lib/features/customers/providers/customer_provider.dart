import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../repositories/customer_repository.dart';

/// ---------------------------------------------------------------------------
/// CustomerProvider
/// ---------------------------------------------------------------------------
///
/// State management for customers.
///
/// Responsibilities:
/// • Load customers
/// • CRUD
/// • Search
/// • Statistics
/// ---------------------------------------------------------------------------
class CustomerProvider extends ChangeNotifier {
  final List<Customer> _customers = [];

  bool _isLoading = false;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<Customer> get customers =>
      List.unmodifiable(_customers);

  bool get isLoading =>
      _isLoading;

  int get customerCount =>
      _customers.length;

  //---------------------------------------------------------------------------
  // Loading
  //---------------------------------------------------------------------------

  void loadCustomers() {
    _customers
      ..clear()
      ..addAll(
        CustomerRepository.getAll(),
      );

    notifyListeners();
  }

  Future<void> refresh() async {
    loadCustomers();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
      return _customers.firstWhere(
        (customer) => customer.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  List<Customer> search(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      return customers;
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

  //---------------------------------------------------------------------------
  // Dashboard Helpers
  //---------------------------------------------------------------------------

  int get creditCustomers =>
      _customers
          .where(
            (c) => c.creditLimit > 0,
          )
          .length;

  int get loyaltyMembers =>
      _customers
          .where(
            (c) => c.loyaltyAccount != null,
          )
          .length;

  double get totalSales =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.totalSpent,
      );

  double get outstandingCredit =>
      _customers.fold(
        0.0,
        (sum, customer) =>
            sum + customer.currentBalance,
      );
}