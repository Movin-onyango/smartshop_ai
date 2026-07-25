import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// SalesReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing sales report data to the UI
/// and export engines.
/// ---------------------------------------------------------------------------
class SalesReportController extends ReportController {
  const SalesReportController(
    super.repository,
  );

  //---------------------------------------------------------------------------
  // Report Data
  //---------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      SalesReportGetters.tableRows(
        repository.sales,
      );

  double get totalSales =>
      SalesReportGetters.totalSales(
        repository.sales,
      );

  double get totalProfit =>
      SalesReportGetters.totalProfit(
        repository.sales,
      );

  //---------------------------------------------------------------------------
  // Export
  //---------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Sales Report',
        subtitle: 'Business sales performance.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Invoice',
        'Customer',
        'Quantity',
        'Total',
        'Profit',
      ],
      rows: tableRows,
      summary: {
        'Total Sales': totalSales.toStringAsFixed(2),
        'Total Profit': totalProfit.toStringAsFixed(2),
      },
    );
  }
}