import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSummary
/// ---------------------------------------------------------------------------
///
/// Displays customer purchase statistics.
/// ---------------------------------------------------------------------------
class PurchaseSummary extends StatelessWidget {
  const PurchaseSummary({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
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

            const SizedBox(height: 24),

            ListTile(
              contentPadding:
                  EdgeInsets.zero,
              leading: const Icon(
                Icons.shopping_cart,
              ),
              title: const Text(
                'Total Purchases',
              ),
              trailing: Text(
                customer.totalPurchases
                    .toString(),
              ),
            ),

            ListTile(
              contentPadding:
                  EdgeInsets.zero,
              leading: const Icon(
                Icons.payments,
              ),
              title: const Text(
                'Total Spent',
              ),
              trailing: Text(
                'KES ${customer.totalSpent.toStringAsFixed(2)}',
              ),
            ),

            ListTile(
              contentPadding:
                  EdgeInsets.zero,
              leading: const Icon(
                Icons.bar_chart,
              ),
              title: const Text(
                'Average Purchase',
              ),
              trailing: Text(
                customer.totalPurchases == 0
                    ? 'KES 0.00'
                    : 'KES ${(customer.totalSpent / customer.totalPurchases).toStringAsFixed(2)}',
              ),
            ),

            if (customer.lastPurchaseDate != null)
              ListTile(
                contentPadding:
                    EdgeInsets.zero,
                leading: const Icon(
                  Icons.calendar_today,
                ),
                title: const Text(
                  'Last Purchase',
                ),
                trailing: Text(
                  '${customer.lastPurchaseDate!.day}/${customer.lastPurchaseDate!.month}/${customer.lastPurchaseDate!.year}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}