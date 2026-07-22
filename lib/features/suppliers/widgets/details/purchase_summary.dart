import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSummary
/// ---------------------------------------------------------------------------
///
/// Displays supplier purchasing statistics.
///
/// Used by:
/// • Supplier Details Screen
/// ---------------------------------------------------------------------------
class PurchaseSummary extends StatelessWidget {
  const PurchaseSummary({
    super.key,
    required this.supplier,
  });

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    final statistics = supplier.statistics;

    if (statistics == null) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              'Purchase Summary',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            Row(
              children: [

                Expanded(
                  child: _StatisticCard(
                    title: 'Orders',
                    value:
                        statistics.totalOrders.toString(),
                    icon: Icons.shopping_bag_outlined,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatisticCard(
                    title: 'Completed',
                    value: statistics
                        .completedOrders
                        .toString(),
                    icon: Icons.check_circle_outline,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: _StatisticCard(
                    title: 'Pending',
                    value: statistics
                        .pendingOrders
                        .toString(),
                    icon: Icons.schedule_outlined,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _StatisticCard(
                    title: 'Cancelled',
                    value: statistics
                        .cancelledOrders
                        .toString(),
                    icon: Icons.cancel_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Divider(),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.payments_outlined,
              ),
              title:
                  const Text('Total Purchases'),
              trailing: Text(
                statistics.totalPurchased
                    .toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.calculate_outlined,
              ),
              title: const Text(
                  'Average Order'),
              trailing: Text(
                statistics.averageOrderValue
                    .toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.calendar_month_outlined,
              ),
              title:
                  const Text('Last Order'),
              trailing: Text(
                statistics.lastOrderDate == null
                    ? '-'
                    : DateFormat(
                        'dd MMM yyyy',
                      ).format(
                        statistics
                            .lastOrderDate!,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Statistic Card
/// ---------------------------------------------------------------------------
class _StatisticCard extends StatelessWidget {
  const _StatisticCard({
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
      padding:
          const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest,
        borderRadius:
            BorderRadius.circular(12),
      ),
      child: Column(
        children: [

          Icon(icon),

          const SizedBox(height: 10),

          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headlineSmall,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall,
          ),
        ],
      ),
    );
  }
}