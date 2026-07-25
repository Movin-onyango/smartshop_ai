import 'package:flutter/material.dart';

import '../../models/expense.dart';

/// ---------------------------------------------------------------------------
/// ExpensePaymentSection
/// ---------------------------------------------------------------------------
///
/// Displays the financial details of an expense.
///
/// Used by:
/// • ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
class ExpensePaymentSection extends StatelessWidget {
  const ExpensePaymentSection({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _AmountRow(title: 'Amount', value: expense.amount),

            const Divider(),

            _AmountRow(title: 'Tax', value: expense.taxAmount),

            const Divider(),

            _AmountRow(
              title: 'Total',
              value: expense.totalAmount,
              isTotal: true,
            ),

            const SizedBox(height: 24),

            _InfoRow(
              icon: Icons.account_balance_wallet,
              title: 'Payment Method',
              value: expense.paymentMethod ?? 'Not specified',
            ),

            const Divider(),

            _InfoRow(
              icon: Icons.verified,
              title: 'Status',
              value: expense.status.name,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Amount Row
/// ---------------------------------------------------------------------------
class _AmountRow extends StatelessWidget {
  const _AmountRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  final String title;
  final double value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final style = isTotal
        ? Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text('KES ${value.toStringAsFixed(2)}', style: style),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Information Row
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20),

          const SizedBox(width: 12),

          Expanded(child: Text(title)),

          Text(value, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
