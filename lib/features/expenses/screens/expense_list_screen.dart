import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/expense_status.dart';
import '../providers/expense_provider.dart';

import '../widgets/list/expense_card.dart';
import '../widgets/list/expense_filter_bar.dart';
import '../widgets/list/expense_search_bar.dart';
import '../widgets/list/expense_summary_tile.dart';

/// ---------------------------------------------------------------------------
/// ExpenseListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all expenses.
///
/// Features:
/// • Search
/// • Filter
/// • Dashboard KPIs
/// • Pull to refresh
/// • Navigation
/// ---------------------------------------------------------------------------
class ExpenseListScreen extends StatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  State<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends State<ExpenseListScreen> {
  final searchController = TextEditingController();

  ExpenseStatus? selectedStatus;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExpenseProvider>().loadExpenses();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, provider, _) {
        //------------------------------------------------------------
        // Filtering
        //------------------------------------------------------------

        var expenses = provider.expenses;

        final query = searchController.text.trim().toLowerCase();

        if (query.isNotEmpty) {
          expenses = expenses
              .where(
                (expense) =>
                    expense.title.toLowerCase().contains(query) ||
                    expense.expenseNumber.toLowerCase().contains(query),
              )
              .toList();
        }

        if (selectedStatus != null) {
          expenses = expenses
              .where((expense) => expense.status == selectedStatus)
              .toList();
        }

        return SmartScaffold(
          title: 'Expenses',

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.push(AppRoutes.addExpense);
            },
            icon: const Icon(Icons.add),
            label: const Text('New Expense'),
          ),

          body: RefreshIndicator(
            onRefresh: provider.loadExpenses,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                //----------------------------------------------------
                // Search
                //----------------------------------------------------
                ExpenseSearchBar(
                  controller: searchController,
                  onChanged: (_) {
                    setState(() {});
                  },
                  onClear: () {
                    setState(() {});
                  },
                ),

                const SizedBox(height: 20),

                //----------------------------------------------------
                // Filter
                //----------------------------------------------------
                ExpenseFilterBar(
                  selectedStatus: selectedStatus,
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                //----------------------------------------------------
                // KPI Cards
                //----------------------------------------------------
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.2,
                  children: [
                    ExpenseSummaryTile(
                      title: 'Total',
                      value: provider.totalExpenses.toString(),
                      subtitle: 'Expenses',
                      icon: Icons.receipt_long,
                      color: Colors.blue,
                    ),

                    ExpenseSummaryTile(
                      title: 'Pending',
                      value: provider.pendingExpenses.toString(),
                      subtitle: 'Awaiting',
                      icon: Icons.schedule,
                      color: Colors.orange,
                    ),

                    ExpenseSummaryTile(
                      title: 'Paid',
                      value: provider.paidExpenses.toString(),
                      subtitle: 'Completed',
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),

                    ExpenseSummaryTile(
                      title: 'Spent',
                      value: provider.totalAmount.toStringAsFixed(2),
                      subtitle: 'KES',
                      icon: Icons.payments,
                      color: Colors.purple,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                //----------------------------------------------------
                // Expense List
                //----------------------------------------------------
                if (expenses.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Center(child: Text('No expenses found.')),
                  )
                else
                  ...expenses.map(
                    (expense) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ExpenseCard(
                        expense: expense,
                        onTap: () {
                          context.push(AppRoutes.expenseDetails(expense.id!));
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
