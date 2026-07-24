import 'package:flutter/material.dart';

import '../../models/expense.dart';
import '../../models/expense_status.dart';
import '../../models/expense_category.dart';

/// ---------------------------------------------------------------------------
/// ExpenseCard
/// ---------------------------------------------------------------------------
///
/// Displays a single expense.
///
/// Used by:
/// • ExpenseListScreen
/// ---------------------------------------------------------------------------
class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
    this.onTap,
  });

  final Expense expense;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              //----------------------------------------------------------------
              // Header
              //----------------------------------------------------------------

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          expense.title,
                          style: theme
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                        ),

                        const SizedBox(
                          height: 4,
                        ),

                        Text(
                          expense.expenseNumber,
                          style: theme
                              .textTheme
                              .bodySmall,
                        ),
                      ],
                    ),
                  ),

                  _StatusChip(
                    status: expense.status,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              //----------------------------------------------------------------
              // Details
              //----------------------------------------------------------------

              _DetailRow(
                icon: Icons.category,
                label: 'Category',
                value:
                    expense.category.label,
              ),

              if (expense.vendor != null)
                _DetailRow(
                  icon: Icons.business,
                  label: 'Vendor',
                  value: expense.vendor!,
                ),

              _DetailRow(
                icon: Icons.calendar_today,
                label: 'Date',
                value:
                    '${expense.expenseDate.day}/${expense.expenseDate.month}/${expense.expenseDate.year}',
              ),

              const Divider(height: 24),

              //----------------------------------------------------------------
              // Amount
              //----------------------------------------------------------------

              Row(
                children: [
                  const Icon(
                    Icons.payments,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    'Amount',
                    style: theme
                        .textTheme
                        .bodyMedium,
                  ),

                  const Spacer(),

                  Text(
                    expense.amount
                        .toStringAsFixed(2),
                    style: theme
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Detail Row
/// ---------------------------------------------------------------------------
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;

  final String label;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
          ),

          const SizedBox(width: 8),

          Text('$label:'),

          const Spacer(),

          Text(value),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Status Chip
/// ---------------------------------------------------------------------------
class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.status,
  });

  final ExpenseStatus status;

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status) {
      case ExpenseStatus.draft:
        color = Colors.grey;
        break;

      case ExpenseStatus.pending:
        color = Colors.orange;
        break;

      case ExpenseStatus.approved:
        color = Colors.blue;
        break;

      case ExpenseStatus.paid:
        color = Colors.green;
        break;

      case ExpenseStatus.cancelled:
        color = Colors.red;
        break;
    }

    return Chip(
      label: Text(status.label),
      backgroundColor:
          color.withValues(alpha: .12),
      labelStyle: TextStyle(
        color: color,
        fontWeight:
            FontWeight.w600,
      ),
      side: BorderSide.none,
    );
  }
}