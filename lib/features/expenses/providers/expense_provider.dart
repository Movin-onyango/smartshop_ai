import 'package:flutter/foundation.dart';

import '../controllers/expense_statistics_controller.dart';
import '../models/expense.dart';
import '../models/expense_statistics.dart';
import '../models/expense_status.dart';
import '../repositories/expense_repository.dart';
import '../models/expense_category.dart';

/// ---------------------------------------------------------------------------
/// ExpenseProvider
/// ---------------------------------------------------------------------------
///
/// State management for expenses.
///
/// Responsible for:
/// • Loading expenses
/// • CRUD operations
/// • Search & filtering
/// • Dashboard statistics
/// • Status updates
/// ---------------------------------------------------------------------------
class ExpenseProvider extends ChangeNotifier {
  final ExpenseStatisticsController _statisticsController =
      const ExpenseStatisticsController();

  List<Expense> _expenses = [];

  String _searchQuery = '';

  bool _isLoading = false;

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  List<Expense> get expenses => List.unmodifiable(_expenses);

  bool get isLoading => _isLoading;

  String get searchQuery => _searchQuery;

  List<Expense> get filteredExpenses {
    if (_searchQuery.trim().isEmpty) {
      return expenses;
    }

    final query = _searchQuery.toLowerCase();

    return _expenses.where((expense) {
      return expense.title.toLowerCase().contains(query) ||
          expense.expenseNumber.toLowerCase().contains(query) ||
          expense.category.label.toLowerCase().contains(query) ||
          (expense.vendor?.toLowerCase().contains(query) ?? false);
    }).toList();
  }

  ExpenseStatistics get statistics =>
      _statisticsController.calculate(_expenses);

  //--------------------------------------------------------------------------
  // Loading
  //--------------------------------------------------------------------------

  Future<void> loadExpenses() async {
    _isLoading = true;
    notifyListeners();

    _expenses = ExpenseRepository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadExpenses();
  }

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  Future<void> addExpense(Expense expense) async {
    ExpenseRepository.add(expense);

    await loadExpenses();
  }

  Future<void> updateExpense(Expense expense) async {
    ExpenseRepository.update(expense);

    await loadExpenses();
  }

  Future<void> deleteExpense(String id) async {
    ExpenseRepository.delete(id);

    await loadExpenses();
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  void search(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Lookup
  //--------------------------------------------------------------------------

  Expense? findById(String id) {
    try {
      return _expenses.firstWhere((expense) => expense.id == id);
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Status Actions
  //--------------------------------------------------------------------------

  Future<void> approveExpense(String id) async {
    final expense = findById(id);

    if (expense == null) return;

    await updateExpense(expense.copyWith(status: ExpenseStatus.approved));
  }

  Future<void> markAsPaid(String id) async {
    final expense = findById(id);

    if (expense == null) return;

    await updateExpense(
      expense.copyWith(status: ExpenseStatus.paid, paidDate: DateTime.now()),
    );
  }

  Future<void> cancelExpense(String id) async {
    final expense = findById(id);

    if (expense == null) return;

    await updateExpense(expense.copyWith(status: ExpenseStatus.cancelled));
  }

  //--------------------------------------------------------------------------
  // Dashboard KPIs
  //--------------------------------------------------------------------------

  int get totalExpenses => statistics.totalExpenses;

  int get draftExpenses => statistics.draftExpenses;

  int get pendingExpenses => statistics.pendingExpenses;

  int get approvedExpenses => statistics.approvedExpenses;

  int get paidExpenses => statistics.paidExpenses;

  int get cancelledExpenses => statistics.cancelledExpenses;

  double get totalAmount => statistics.totalAmount;

  double get paidAmount => statistics.paidAmount;

  double get pendingAmount => statistics.pendingAmount;

  double get averageExpense => statistics.averageExpense;

  double get highestExpense => statistics.highestExpense;

  double get monthlyTotal => statistics.monthlyTotal;
}
