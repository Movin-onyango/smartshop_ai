import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SaleTotalsCard
/// ---------------------------------------------------------------------------
///
/// Displays the running totals for the current sale.
///
/// Responsibilities:
/// • Gross Total
/// • Discount
/// • Subtotal
/// • Expected Profit
/// ---------------------------------------------------------------------------
class SaleTotalsCard extends StatelessWidget {
  const SaleTotalsCard({
    super.key,
    required this.grossTotal,
    required this.discount,
    required this.subtotal,
    required this.profit,
  });

  final double grossTotal;
  final double discount;
  final double subtotal;
  final double profit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sale Totals', style: theme.textTheme.titleLarge),

            const SizedBox(height: 20),

            _buildRow(context, 'Gross Total', grossTotal),

            const SizedBox(height: 10),

            _buildRow(context, 'Discount', discount, valueColor: Colors.red),

            const Divider(height: 32),

            _buildRow(
              context,
              'Subtotal',
              subtotal,
              isBold: true,
              valueColor: theme.colorScheme.primary,
            ),

            const SizedBox(height: 12),

            _buildRow(
              context,
              'Expected Profit',
              profit,
              isBold: true,
              valueColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    String label,
    double value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Text(label, style: theme.textTheme.bodyLarge)),
        Text(
          'KSh ${value.toStringAsFixed(2)}',
          style:
              (isBold ? theme.textTheme.titleMedium : theme.textTheme.bodyLarge)
                  ?.copyWith(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                    color: valueColor,
                  ),
        ),
      ],
    );
  }
}
