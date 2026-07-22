import 'package:flutter/material.dart';

import '../../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryStatisticsSection
/// ---------------------------------------------------------------------------
///
/// Displays summary statistics for a category.
///
/// Responsibilities:
/// • Number of Products
/// • Total Stock
/// • Stock Value
/// • Average Selling Price
/// ---------------------------------------------------------------------------
class CategoryStatisticsSection extends StatelessWidget {
  const CategoryStatisticsSection({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _StatisticTile(
                    title: 'Products',
                    value: '--',
                    icon: Icons.inventory_2_outlined,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _StatisticTile(
                    title: 'Total Stock',
                    value: '--',
                    icon: Icons.warehouse_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: _StatisticTile(
                    title: 'Stock Value',
                    value: 'KES --',
                    icon: Icons.payments_outlined,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _StatisticTile(
                    title: 'Avg. Selling Price',
                    value: 'KES --',
                    icon: Icons.sell_outlined,
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
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon),

          const SizedBox(height: 12),

          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}