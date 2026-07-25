import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// CustomerSection
/// ---------------------------------------------------------------------------
///
/// Displays customer information.
///
/// Responsibilities:
/// • Customer name
/// • Customer ID
/// • Walk-in customer support
/// ---------------------------------------------------------------------------
class CustomerSection extends StatelessWidget {
  const CustomerSection({super.key, required this.sale});

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer', style: theme.textTheme.titleLarge),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(Icons.person, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sale.hasCustomer
                            ? sale.customerName!
                            : 'Walk-in Customer',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        sale.hasCustomer
                            ? 'Customer ID: ${sale.customerId ?? "Not Available"}'
                            : 'No customer information',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
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
