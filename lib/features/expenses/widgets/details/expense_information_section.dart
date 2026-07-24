import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../models/expense_category.dart';

/// ExpenseInformationSection
/// ---------------------------------------------------------------------------
///
/// Displays the general information of an expense.
///
/// Used by:
/// • ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
class ExpenseInformationSection extends StatelessWidget {
  const ExpenseInformationSection({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Expense Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            _InfoRow(
              icon: Icons.category,
              title: 'Category',
              value: expense.category.label,
            ),

            const Divider(),

            _InfoRow(
              icon: Icons.store,
              title: 'Vendor',
              value:
                  expense.vendor?.isNotEmpty == true
                      ? expense.vendor!
                      : 'Not specified',
            ),

            const Divider(),

            _InfoRow(
              icon: Icons.calendar_today,
              title: 'Expense Date',
              value:
                  '${expense.expenseDate.day}/${expense.expenseDate.month}/${expense.expenseDate.year}',
            ),

            if (expense.dueDate != null) ...[
              const Divider(),

              _InfoRow(
                icon: Icons.event,
                title: 'Due Date',
                value:
                    '${expense.dueDate!.day}/${expense.dueDate!.month}/${expense.dueDate!.year}',
              ),
            ],

            const Divider(),

            _InfoRow(
              icon: Icons.confirmation_number,
              title: 'Expense No.',
              value: expense.expenseNumber,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Info Row
/// ---------------------------------------------------------------------------
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ),

          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}