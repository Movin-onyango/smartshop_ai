import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// InventoryReportController
/// ---------------------------------------------------------------------------
class InventoryReportController extends ReportController {
  const InventoryReportController(super.repository);

  List<List<String>> get tableRows =>
      InventoryReportGetters.tableRows(
        repository.inventory,
      );

  int get totalStock =>
      InventoryReportGetters.totalStock(
        repository.inventory,
      );

  int get lowStock =>
      InventoryReportGetters.lowStock(
        repository.inventory,
      );

  double get stockValue =>
      InventoryReportGetters.stockValue(
        repository.inventory,
      );
}