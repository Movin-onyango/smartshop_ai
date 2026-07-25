import 'package:flutter/material.dart';

import '../../providers/purchase_provider.dart';

/// ---------------------------------------------------------------------------
/// PurchaseStatisticsCard
/// ---------------------------------------------------------------------------
///
/// Displays purchase KPIs.
///
/// Used by:
/// • PurchaseListScreen
/// ---------------------------------------------------------------------------
class PurchaseStatisticsCard extends StatelessWidget {
  const PurchaseStatisticsCard({super.key, required this.provider});

  final PurchaseProvider provider;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------------------------------------------
            // Title
            //------------------------------------------------------------------
            Text(
              'Purchase Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _StatisticTile(
                    title: 'Total',
                    value: provider.totalPurchases.toString(),
                    icon: Icons.receipt_long,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatisticTile(
                    title: 'Pending',
                    value: provider.pendingPurchases.toString(),
                    icon: Icons.schedule,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _StatisticTile(
                    title: 'Received',
                    value: provider.receivedPurchases.toString(),
                    icon: Icons.inventory,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatisticTile(
                    title: 'Spent',
                    value: provider.totalSpent.toStringAsFixed(2),
                    icon: Icons.payments,
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

/// ---------------------------------------------------------------------------
/// _StatisticTile
/// ---------------------------------------------------------------------------
class _StatisticTile extends StatelessWidget {
  const _StatisticTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon),

          const SizedBox(height: 8),

          Text(value, style: Theme.of(context).textTheme.headlineSmall),

          const SizedBox(height: 4),

          Text(title, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
