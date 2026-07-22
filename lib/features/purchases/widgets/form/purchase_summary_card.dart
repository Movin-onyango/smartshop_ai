import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSummaryCard
/// ---------------------------------------------------------------------------
///
/// Displays the financial summary of a purchase.
///
/// Used by:
/// • Create Purchase
/// • Edit Purchase
/// ---------------------------------------------------------------------------
class PurchaseSummaryCard extends StatelessWidget {
  const PurchaseSummaryCard({
    super.key,
    required this.controller,
  });

  final PurchaseFormController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Purchase Summary',
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _SummaryRow(
              label: 'Subtotal',
              value: controller.subtotal,
            ),

            const SizedBox(height: 12),

            _SummaryRow(
              label: 'Discount',
              value: controller.totalDiscount,
            ),

            const SizedBox(height: 12),

            _SummaryRow(
              label: 'Tax',
              value: controller.totalTax,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Divider(),
            ),

            _SummaryRow(
              label: 'Grand Total',
              value: controller.grandTotal,
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Summary Row
/// ---------------------------------------------------------------------------
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  final String label;
  final double value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final style = isTotal
        ? Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
              fontWeight:
                  FontWeight.bold,
            )
        : Theme.of(context)
            .textTheme
            .bodyLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: style,
          ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: style,
        ),
      ],
    );
  }
}