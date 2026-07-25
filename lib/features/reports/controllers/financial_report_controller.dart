import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// FinancialReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing financial report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class FinancialReportController extends ReportController {
  const FinancialReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      FinancialReportGetters.tableRows(
        repository.financial,
      );

  double get revenue =>
      FinancialReportGetters.totalRevenue(
        repository.financial,
      );

  double get expenses =>
      FinancialReportGetters.totalExpenses(
        repository.financial,
      );

  double get purchases =>
      FinancialReportGetters.totalPurchases(
        repository.financial,
      );

  double get netProfit =>
      FinancialReportGetters.netProfit(
        repository.financial,
      );

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Financial Report',
        subtitle: 'Overall business financial performance.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Metric',
        'Value',
      ],
      rows: tableRows,
      summary: {
        'Revenue': revenue.toStringAsFixed(2),
        'Expenses': expenses.toStringAsFixed(2),
        'Purchases': purchases.toStringAsFixed(2),
        'Net Profit': netProfit.toStringAsFixed(2),
      },
    );
  }
}