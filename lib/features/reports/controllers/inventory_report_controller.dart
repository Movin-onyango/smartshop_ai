import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// InventoryReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing inventory report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class InventoryReportController extends ReportController {
  const InventoryReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

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

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Inventory Report',
        subtitle: 'Inventory levels and stock valuation.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Product',
        'Quantity',
        'Reorder Level',
        'Stock Value',
        'Status',
      ],
      rows: tableRows,
      summary: {
        'Total Stock': totalStock.toString(),
        'Low Stock Items': lowStock.toString(),
        'Stock Value': stockValue.toStringAsFixed(2),
      },
    );
  }
}