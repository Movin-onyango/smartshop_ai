import '../../expenses/models/expense.dart';
import '../../expenses/repositories/expense_repository.dart';

class ExpenseReportRepository {
  const ExpenseReportRepository();

  List<Expense> getAllExpenses() {
    return ExpenseRepository.getAll();
  }
}
