import 'package:flutter/material.dart';

import '../../controllers/sale_form_controller.dart';

/// ---------------------------------------------------------------------------
/// CartSummary
/// ---------------------------------------------------------------------------
///
/// Displays a live summary of the current cart.
///
/// Responsibilities:
/// • Total Items
/// • Total Quantity
/// • Gross Total
/// • Discount
/// • Net Total
/// • Expected Profit
/// ---------------------------------------------------------------------------
class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.controller});

  final SaleFormController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _summaryRow(context, 'Products', '${controller.itemCount}'),

            const SizedBox(height: 8),

            _summaryRow(context, 'Quantity', '${controller.totalQuantity}'),

            const Divider(height: 24),

            _summaryRow(
              context,
              'Gross Total',
              'KSh ${controller.grossTotal.toStringAsFixed(2)}',
            ),

            const SizedBox(height: 8),

            _summaryRow(
              context,
              'Discount',
              'KSh ${controller.totalDiscount.toStringAsFixed(2)}',
            ),

            const Divider(height: 24),

            _summaryRow(
              context,
              'Subtotal',
              'KSh ${controller.subtotal.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 8),

            _summaryRow(
              context,
              'Expected Profit',
              'KSh ${controller.totalProfit.toStringAsFixed(2)}',
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
        Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
        Text(
          value,
          style:
              valueStyle ??
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
