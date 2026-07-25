import 'package:flutter/foundation.dart';

import '../../suppliers/models/supplier.dart';
import '/features/suppliers/repositories/supplier_repository.dart';

/// ---------------------------------------------------------------------------
/// SupplierProvider
/// ---------------------------------------------------------------------------
///
/// Manages supplier state for the application.
///
/// This provider wraps the repository and exposes data to the UI.
/// ---------------------------------------------------------------------------
class SupplierProvider extends ChangeNotifier {
  List<Supplier> _suppliers = [];

  bool _isLoading = false;

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  List<Supplier> get suppliers => List.unmodifiable(_suppliers);

  bool get isLoading => _isLoading;

  int get totalSuppliers => _suppliers.length;

  //--------------------------------------------------------------------------
  // Loading
  //--------------------------------------------------------------------------

  void loadSuppliers() {
    _isLoading = true;
    notifyListeners();

    _suppliers = SupplierRepository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    loadSuppliers();
  }

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  Future<void> addSupplier(Supplier supplier) async {
    SupplierRepository.add(supplier);

    loadSuppliers();
  }

  Future<void> updateSupplier(Supplier supplier) async {
    SupplierRepository.update(supplier);

    loadSuppliers();
  }

  Future<void> deleteSupplier(String id) async {
    SupplierRepository.delete(id);

    loadSuppliers();
  }

  //--------------------------------------------------------------------------
  // Lookup
  //--------------------------------------------------------------------------

  Supplier? findById(String id) {
    try {
      return _suppliers.firstWhere((supplier) => supplier.id == id);
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  List<Supplier> search(String query) {
    return SupplierRepository.search(query);
  }

  //--------------------------------------------------------------------------
  // Statistics
  //--------------------------------------------------------------------------

  double get totalOutstandingBalance {
    return _suppliers.fold(0, (sum, supplier) => sum + supplier.currentBalance);
  }

  double get totalCreditLimit {
    return _suppliers.fold(0, (sum, supplier) => sum + supplier.creditLimit);
  }

  int get suppliersWithBalance {
    return _suppliers.where((supplier) => supplier.currentBalance > 0).length;
  }

  int get suppliersWithoutBalance {
    return _suppliers.where((supplier) => supplier.currentBalance == 0).length;
  }
}
