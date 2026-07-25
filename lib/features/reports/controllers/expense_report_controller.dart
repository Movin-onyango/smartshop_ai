import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// ExpenseReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing expense report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class ExpenseReportController extends ReportController {
  const ExpenseReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      ExpenseReportGetters.tableRows(
        repository.expenses,
      );

  double get totalExpenses =>
      ExpenseReportGetters.totalExpenses(
        repository.expenses,
      );

  int get expenseCount =>
      ExpenseReportGetters.expenseCount(
        repository.expenses,
      );

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Expense Report',
        subtitle: 'Business expenses and operational costs.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Expense',
        'Category',
        'Amount',
        'Date',
      ],
      rows: tableRows,
      summary: {
        'Total Expenses':
            totalExpenses.toStringAsFixed(2),
        'Transactions':
            expenseCount.toString(),
      },
    );
  }
}