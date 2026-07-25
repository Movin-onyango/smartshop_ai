import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing purchase report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class PurchaseReportController extends ReportController {
  const PurchaseReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      PurchaseReportGetters.tableRows(
        repository.purchases,
      );

  double get totalPurchases =>
      PurchaseReportGetters.totalPurchases(
        repository.purchases,
      );

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Purchase Report',
        subtitle: 'Supplier purchases and procurement summary.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Supplier',
        'Items',
        'Grand Total',
        'Status',
      ],
      rows: tableRows,
      summary: {
        'Total Purchases': totalPurchases.toStringAsFixed(2),
      },
    );
  }
}