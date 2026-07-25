import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// BalanceSummary
/// ---------------------------------------------------------------------------
///
/// Displays supplier financial information.
///
/// Used by:
/// • Supplier Details Screen
/// ---------------------------------------------------------------------------
class BalanceSummary extends StatelessWidget {
  const BalanceSummary({super.key, required this.supplier});

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Financial Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _BalanceTile(
              title: 'Current Balance',
              value: supplier.currentBalance,
              icon: Icons.account_balance_wallet_outlined,
            ),

            const Divider(),

            _BalanceTile(
              title: 'Credit Limit',
              value: supplier.creditLimit,
              icon: Icons.credit_score_outlined,
            ),

            const Divider(),

            _BalanceTile(
              title: 'Available Credit',
              value: supplier.availableCredit,
              icon: Icons.savings_outlined,
            ),

            const SizedBox(height: 24),

            if (supplier.isOverLimit)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.red.shade300),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red.shade700,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        'Supplier has exceeded the credit limit.',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green.shade700,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        'Supplier account is within the credit limit.',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Balance Tile
/// ---------------------------------------------------------------------------
class _BalanceTile extends StatelessWidget {
  const _BalanceTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final double value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(
        value.toStringAsFixed(2),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
