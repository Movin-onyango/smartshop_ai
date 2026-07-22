import '../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierSearchController
/// ---------------------------------------------------------------------------
///
/// Handles supplier searching.
///
/// This controller performs client-side searching over an existing
/// supplier collection.
/// ---------------------------------------------------------------------------
class SupplierSearchController {
  String _query = '';

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  String get query => _query;

  bool get isSearching => _query.isNotEmpty;

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  void updateQuery(String value) {
    _query = value.trim();
  }

  List<Supplier> search(
    List<Supplier> suppliers,
  ) {
    if (_query.isEmpty) {
      return suppliers;
    }

    final search = _query.toLowerCase();

    return suppliers.where((supplier) {
      return supplier.name
              .toLowerCase()
              .contains(search) ||

          (supplier.contactPerson
                  ?.toLowerCase()
                  .contains(search) ??
              false) ||

          (supplier.phone
                  ?.toLowerCase()
                  .contains(search) ??
              false) ||

          (supplier.email
                  ?.toLowerCase()
                  .contains(search) ??
              false) ||

          (supplier.taxNumber
                  ?.toLowerCase()
                  .contains(search) ??
              false);
    }).toList();
  }

  //---------------------------------------------------------------------------
  // Utilities
  //---------------------------------------------------------------------------

  void clear() {
    _query = '';
  }
}