import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseTotalsCard
/// ---------------------------------------------------------------------------
///
/// Displays purchase totals.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseTotalsCard extends StatelessWidget {
  const PurchaseTotalsCard({
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
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------

            Text(
              'Order Summary',
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Totals
            //------------------------------------------------------------------

            _TotalRow(
              label: 'Subtotal',
              value: controller.subtotal,
            ),

            const SizedBox(height: 12),

            _TotalRow(
              label: 'Discount',
              value: controller.totalDiscount,
            ),

            const SizedBox(height: 12),

            _TotalRow(
              label: 'Tax',
              value: controller.totalTax,
            ),

            const Divider(height: 32),

            _TotalRow(
              label: 'Grand Total',
              value: controller.grandTotal,
              isGrandTotal: true,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Total Row
/// ---------------------------------------------------------------------------
class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    this.isGrandTotal = false,
  });

  final String label;
  final double value;
  final bool isGrandTotal;

  @override
  Widget build(BuildContext context) {
    final style = isGrandTotal
        ? Theme.of(context).textTheme.titleLarge
        : Theme.of(context).textTheme.bodyLarge;

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