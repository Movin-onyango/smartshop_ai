import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// SaleHeader
/// ---------------------------------------------------------------------------
///
/// Displays the main sale information.
///
/// Responsibilities:
/// • Invoice Number
/// • Sale Date
/// • Total Amount
/// • Payment Method
/// ---------------------------------------------------------------------------
class SaleHeader extends StatelessWidget {
  const SaleHeader({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            CircleAvatar(
              radius: 34,
              backgroundColor:
                  theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.receipt_long,
                size: 34,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              sale.invoiceNumber,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            Text(
              _formatDate(sale.saleDate),
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [

                  Text(
                    'Total Sale',
                    style: theme.textTheme.labelLarge,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'KSh ${sale.subtotal.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [

                Expanded(
                  child: _InfoCard(
                    title: 'Items',
                    value: '${sale.totalQuantity}',
                    icon: Icons.shopping_cart,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: _InfoCard(
                    title: 'Payment',
                    value: _paymentMethodLabel(
                      sale.payment.method.name,
                    ),
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

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} '
        '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }

  static String _paymentMethodLabel(String method) {
    switch (method) {
      case 'mpesa':
        return 'M-Pesa';
      case 'bankTransfer':
        return 'Bank';
      case 'credit':
        return 'Credit';
      case 'card':
        return 'Card';
      case 'mixed':
        return 'Mixed';
      default:
        return 'Cash';
    }
  }
}

/// ---------------------------------------------------------------------------
/// _InfoCard
/// ---------------------------------------------------------------------------
class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        child: Column(
          children: [

            Icon(
              icon,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: theme.textTheme.labelMedium,
            ),

            const SizedBox(height: 6),

            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );
  }
}