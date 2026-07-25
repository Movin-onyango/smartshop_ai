import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// Credit Summary
/// ---------------------------------------------------------------------------
///
/// Displays the customer's credit information.
/// ---------------------------------------------------------------------------
class CreditSummary extends StatelessWidget {
  const CreditSummary({super.key, required this.customer});

  final Customer customer;

  Widget _summaryTile(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(value, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            _summaryTile(
              context,
              title: 'Credit Limit',
              value: 'KES ${customer.creditLimit.toStringAsFixed(2)}',
              icon: Icons.credit_card,
            ),

            _summaryTile(
              context,
              title: 'Outstanding Balance',
              value: 'KES ${customer.currentBalance.toStringAsFixed(2)}',
              icon: Icons.account_balance_wallet,
            ),

            _summaryTile(
              context,
              title: 'Available Credit',
              value: 'KES ${customer.availableCredit.toStringAsFixed(2)}',
              icon: Icons.savings,
            ),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: customer.creditLimit == 0
                  ? 0
                  : (customer.currentBalance / customer.creditLimit).clamp(
                      0.0,
                      1.0,
                    ),
            ),

            const SizedBox(height: 12),

            Text(
              customer.creditLimit == 0
                  ? 'Credit not enabled for this customer.'
                  : customer.isOverLimit
                  ? 'Customer has exceeded the credit limit.'
                  : 'Customer is within the credit limit.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
