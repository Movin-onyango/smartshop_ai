import '../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierFilterController
/// ---------------------------------------------------------------------------
///
/// Handles filtering suppliers.
/// ---------------------------------------------------------------------------
class SupplierFilterController {
  bool showOnlyWithBalance = false;

  bool showOnlyWithoutBalance = false;

  bool showOnlyOverLimit = false;

  bool showOnlyWithCredit = false;

  //---------------------------------------------------------------------------
  // Filtering
  //---------------------------------------------------------------------------

  List<Supplier> filter(List<Supplier> suppliers) {
    return suppliers.where((supplier) {
      if (showOnlyWithBalance && supplier.currentBalance <= 0) {
        return false;
      }

      if (showOnlyWithoutBalance && supplier.currentBalance > 0) {
        return false;
      }

      if (showOnlyOverLimit && !supplier.isOverLimit) {
        return false;
      }

      if (showOnlyWithCredit && !supplier.hasCredit) {
        return false;
      }

      return true;
    }).toList();
  }

  //---------------------------------------------------------------------------
  // Utilities
  //---------------------------------------------------------------------------

  void clear() {
    showOnlyWithBalance = false;
    showOnlyWithoutBalance = false;
    showOnlyOverLimit = false;
    showOnlyWithCredit = false;
  }
}
