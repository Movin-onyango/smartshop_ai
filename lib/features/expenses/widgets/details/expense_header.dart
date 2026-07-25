import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpenseHeader
/// ---------------------------------------------------------------------------
///
/// Displays the primary expense information.
///
/// Used by:
/// • ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
class ExpenseHeader extends StatelessWidget {
  const ExpenseHeader({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expense.title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        expense.expenseNumber,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),

                Chip(label: Text(expense.status.label)),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.payments, size: 20),

                const SizedBox(width: 8),

                Text(
                  'KES ${expense.totalAmount.toStringAsFixed(2)}',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
