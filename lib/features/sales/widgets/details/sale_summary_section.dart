import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// SaleSummarySection
/// ---------------------------------------------------------------------------
///
/// Displays the financial summary of a completed sale.
///
/// Responsibilities:
/// • Gross Total
/// • Total Discount
/// • Net Total
/// • Expected Profit
/// ---------------------------------------------------------------------------
class SaleSummarySection extends StatelessWidget {
  const SaleSummarySection({super.key, required this.sale});

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
            Text('Sale Summary', style: theme.textTheme.titleLarge),

            const SizedBox(height: 20),

            _summaryRow(
              context,
              'Gross Total',
              'KSh ${sale.grossTotal.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 10),

            _summaryRow(
              context,
              'Discount',
              'KSh ${sale.totalDiscount.toStringAsFixed(2)}',
            ),

            const Divider(height: 32),

            _summaryRow(
              context,
              'Net Total',
              'KSh ${sale.subtotal.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 12),

            _summaryRow(
              context,
              'Expected Profit',
              'KSh ${sale.totalProfit.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context,
    String label,
    String value, {
    TextStyle? valueStyle,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Text(label, style: theme.textTheme.bodyLarge)),
        Text(
          value,
          style:
              valueStyle ??
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
