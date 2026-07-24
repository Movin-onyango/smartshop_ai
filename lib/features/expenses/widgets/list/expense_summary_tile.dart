import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ExpenseSummaryTile
/// ---------------------------------------------------------------------------
///
/// Reusable KPI tile.
///
/// Used by:
/// • ExpenseListScreen
/// • ExpenseDashboardScreen
/// ---------------------------------------------------------------------------
class ExpenseSummaryTile extends StatelessWidget {
  const ExpenseSummaryTile({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;

  final String value;

  final String subtitle;

  final IconData icon;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: Padding(
        padding:
            const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor:
                  color.withValues (alpha :.12),
              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ],
              ),
            ),

            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}