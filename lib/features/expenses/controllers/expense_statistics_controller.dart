import '../models/expense.dart';
import '../models/expense_statistics.dart';
import '../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpenseStatisticsController
/// ---------------------------------------------------------------------------
///
/// Calculates dashboard statistics from all expenses.
/// ---------------------------------------------------------------------------
class ExpenseStatisticsController {
  const ExpenseStatisticsController();

  ExpenseStatistics calculate(List<Expense> expenses) {
    if (expenses.isEmpty) {
      return const ExpenseStatistics();
    }

    final totalExpenses = expenses.length;

    final draftExpenses = expenses
        .where((expense) => expense.status == ExpenseStatus.draft)
        .length;

    final pendingExpenses = expenses
        .where((expense) => expense.status == ExpenseStatus.pending)
        .length;

    final approvedExpenses = expenses
        .where((expense) => expense.status == ExpenseStatus.approved)
        .length;

    final paidExpenses = expenses
        .where((expense) => expense.status == ExpenseStatus.paid)
        .length;

    final cancelledExpenses = expenses
        .where((expense) => expense.status == ExpenseStatus.cancelled)
        .length;

    final totalAmount = expenses.fold(
      0.0,
      (sum, expense) => sum + expense.totalAmount,
    );

    final paidAmount = expenses
        .where((expense) => expense.status == ExpenseStatus.paid)
        .fold(0.0, (sum, expense) => sum + expense.totalAmount);

    final pendingAmount = expenses
        .where((expense) => expense.status == ExpenseStatus.pending)
        .fold(0.0, (sum, expense) => sum + expense.totalAmount);

    final averageExpense = totalAmount / totalExpenses;

    final highestExpense = expenses
        .map((expense) => expense.totalAmount)
        .reduce((a, b) => a > b ? a : b);

    final now = DateTime.now();

    final monthlyTotal = expenses
        .where(
          (expense) =>
              expense.expenseDate.year == now.year &&
              expense.expenseDate.month == now.month,
        )
        .fold(0.0, (sum, expense) => sum + expense.totalAmount);

    return ExpenseStatistics(
      totalExpenses: totalExpenses,
      draftExpenses: draftExpenses,
      pendingExpenses: pendingExpenses,
      approvedExpenses: approvedExpenses,
      paidExpenses: paidExpenses,
      cancelledExpenses: cancelledExpenses,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      pendingAmount: pendingAmount,
      averageExpense: averageExpense,
      highestExpense: highestExpense,
      monthlyTotal: monthlyTotal,
    );
  }
}
