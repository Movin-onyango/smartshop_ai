import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// Loyalty Summary
/// ---------------------------------------------------------------------------
///
/// Displays loyalty account information.
/// ---------------------------------------------------------------------------
class LoyaltySummary extends StatelessWidget {
  const LoyaltySummary({super.key, required this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final loyalty = customer.loyaltyAccount;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Loyalty Program',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            if (loyalty == null) ...[
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    'Customer is not enrolled in the loyalty program.',
                  ),
                ),
              ),
            ] else ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.badge),
                title: const Text('Account Number'),
                trailing: Text(loyalty.accountNumber ?? '-'),
              ),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.stars),
                title: const Text('Points'),
                trailing: Text(loyalty.points.toString()),
              ),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.workspace_premium),
                title: const Text('Tier'),
                trailing: Chip(label: Text(loyalty.tier.name.toUpperCase())),
              ),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.trending_up),
                title: const Text('Total Points Earned'),
                trailing: Text(loyalty.totalPointsEarned.toString()),
              ),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.redeem),
                title: const Text('Points Redeemed'),
                trailing: Text(loyalty.totalPointsRedeemed.toString()),
              ),

              if (loyalty.joinedAt != null)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Member Since'),
                  trailing: Text(
                    '${loyalty.joinedAt!.day}/${loyalty.joinedAt!.month}/${loyalty.joinedAt!.year}',
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
