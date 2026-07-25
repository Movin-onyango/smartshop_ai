import 'package:flutter/material.dart';

import '../../models/customer.dart';
import 'customer_status_badges.dart';

/// ---------------------------------------------------------------------------
/// CustomerListItem
/// ---------------------------------------------------------------------------
///
/// Reusable customer tile used in:
/// • Customer List
/// • Customer Search
/// • Customer Picker
/// ---------------------------------------------------------------------------
class CustomerListItem extends StatelessWidget {
  const CustomerListItem({super.key, required this.customer, this.onTap});

  final Customer customer;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Text(
                      customer.name.isEmpty
                          ? '?'
                          : customer.name[0].toUpperCase(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(customer.name, style: theme.textTheme.titleMedium),

                        if ((customer.phone ?? '').isNotEmpty)
                          Text(
                            customer.phone!,
                            style: theme.textTheme.bodyMedium,
                          ),

                        if ((customer.email ?? '').isNotEmpty)
                          Text(
                            customer.email!,
                            style: theme.textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),

                  const Icon(Icons.chevron_right),
                ],
              ),

              if ((customer.address ?? '').isNotEmpty) ...[
                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        customer.address!,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 16),

              CustomerStatusBadges(customer: customer),

              const SizedBox(height: 16),

              const Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Purchases', style: theme.textTheme.labelMedium),
                      Text(
                        customer.totalPurchases.toString(),
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Spent', style: theme.textTheme.labelMedium),
                      Text(
                        'KES ${customer.totalSpent.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Balance', style: theme.textTheme.labelMedium),
                      Text(
                        'KES ${customer.currentBalance.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
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
