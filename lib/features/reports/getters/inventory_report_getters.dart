import '../repositories/inventory_report_repository.dart';
import 'base/base_report_getters.dart';
import 'base/report_formatter.dart';

/// ---------------------------------------------------------------------------
/// InventoryReportGetters
/// ---------------------------------------------------------------------------
///
/// Transforms inventory data into report-friendly formats.
/// ---------------------------------------------------------------------------
class InventoryReportGetters extends BaseReportGetters {
  const InventoryReportGetters();

  static List<List<String>> tableRows(InventoryReportRepository repository) {
    return repository
        .getAllProducts()
        .map(
          (product) => [
            product.name,
            ReportFormatter.integer(product.quantity),
            ReportFormatter.integer(product.reorderLevel),
            ReportFormatter.currency(product.buyingPrice * product.quantity),
            product.quantity <= product.reorderLevel ? 'Low Stock' : 'In Stock',
          ],
        )
        .toList();
  }

  static int totalStock(InventoryReportRepository repository) {
    return repository.getAllProducts().fold(
      0,
      (sum, product) => sum + product.quantity,
    );
  }

  static int lowStock(InventoryReportRepository repository) {
    return repository
        .getAllProducts()
        .where((product) => product.quantity <= product.reorderLevel)
        .length;
  }

  static double stockValue(InventoryReportRepository repository) {
    return repository.getAllProducts().fold(
      0.0,
      (sum, product) => sum + (product.buyingPrice * product.quantity),
    );
  }
}
