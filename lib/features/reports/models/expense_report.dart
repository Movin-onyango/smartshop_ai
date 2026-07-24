class ExpenseReport {
  const ExpenseReport({
    required this.totalExpenses,
    required this.totalTransactions,
    required this.averageExpense,
  });

  final double totalExpenses;
  final int totalTransactions;
  final double averageExpense;
}