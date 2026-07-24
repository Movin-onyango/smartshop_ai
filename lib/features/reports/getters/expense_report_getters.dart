import '../repositories/expense_report_repository.dart';
import 'base/base_report_getters.dart';
import 'base/report_formatter.dart';
/// ---------------------------------------------------------------------------
/// ExpenseReportGetters
/// ---------------------------------------------------------------------------
///
/// Transforms expense data into report-friendly formats.
/// ---------------------------------------------------------------------------
class ExpenseReportGetters extends BaseReportGetters {
  const ExpenseReportGetters();

  static List<List<String>> tableRows(
    ExpenseReportRepository repository,
  ) {
    return repository
        .getAllExpenses()
        .map(
          (expense) => [
            expense.title,
            expense.category.name,
            ReportFormatter.currency(expense.amount),
            expense.status.name,
          ],
        )
        .toList();
  }

  static double totalExpenses(
    ExpenseReportRepository repository,
  ) {
    return repository
        .getAllExpenses()
        .fold(
          0.0,
          (sum, expense) => sum + expense.amount,
        );
  }

  static int expenseCount(
    ExpenseReportRepository repository,
  ) {
    return repository
        .getAllExpenses()
        .length;
  }

  static double averageExpense(
    ExpenseReportRepository repository,
  ) {
    final expenses = repository.getAllExpenses();

    if (expenses.isEmpty) {
      return 0.0;
    }

    return totalExpenses(repository) /
        expenses.length;
  }
}