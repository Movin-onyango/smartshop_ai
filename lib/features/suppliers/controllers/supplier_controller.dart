//import 'package:flutter/foundation.dart';

import '../models/supplier.dart';
import '../providers/supplier_provider.dart';

/// ---------------------------------------------------------------------------
/// SupplierController
/// ---------------------------------------------------------------------------
///
/// Business logic wrapper around SupplierProvider.
///
/// The UI should communicate with this controller rather than
/// accessing the provider directly whenever business logic is needed.
/// ---------------------------------------------------------------------------
class SupplierController {
  SupplierController({required SupplierProvider provider})
    : _provider = provider;

  final SupplierProvider _provider;

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  List<Supplier> get suppliers => _provider.suppliers;

  bool get isLoading => _provider.isLoading;

  int get totalSuppliers => _provider.totalSuppliers;

  double get totalCreditLimit => _provider.totalCreditLimit;

  double get totalOutstandingBalance => _provider.totalOutstandingBalance;

  int get suppliersWithBalance => _provider.suppliersWithBalance;

  int get suppliersWithoutBalance => _provider.suppliersWithoutBalance;

  //--------------------------------------------------------------------------
  // Loading
  //--------------------------------------------------------------------------

  void loadSuppliers() {
    _provider.loadSuppliers();
  }

  void refresh() {
    _provider.refresh();
  }

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  void addSupplier(Supplier supplier) {
    _provider.addSupplier(supplier);
  }

  void updateSupplier(Supplier supplier) {
    _provider.updateSupplier(supplier);
  }

  void deleteSupplier(String id) {
    _provider.deleteSupplier(id);
  }

  //--------------------------------------------------------------------------
  // Lookup
  //--------------------------------------------------------------------------

  Supplier? findById(String id) {
    return _provider.findById(id);
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  List<Supplier> search(String query) {
    return _provider.search(query);
  }
}
