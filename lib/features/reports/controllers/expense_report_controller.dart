import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// ExpenseReportController
/// ---------------------------------------------------------------------------
class ExpenseReportController extends ReportController {
  const ExpenseReportController(super.repository);

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
}