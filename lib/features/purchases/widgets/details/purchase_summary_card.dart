import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSummaryCard
/// ---------------------------------------------------------------------------
///
/// Displays purchase totals.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseSummaryCard extends StatelessWidget {
  const PurchaseSummaryCard({
    super.key,
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
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
              'Purchase Summary',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Totals
            //------------------------------------------------------------------

            _SummaryRow(
              label: 'Items',
              value:
                  purchase.totalItems.toString(),
            ),

            _SummaryRow(
              label: 'Quantity',
              value: purchase.totalQuantity
                  .toStringAsFixed(2),
            ),

            const Divider(),

            _SummaryRow(
              label: 'Subtotal',
              value: purchase.subtotal
                  .toStringAsFixed(2),
            ),

            _SummaryRow(
              label: 'Discount',
              value: purchase.totalDiscount
                  .toStringAsFixed(2),
            ),

            _SummaryRow(
              label: 'Taxable Amount',
              value: purchase.taxableAmount
                  .toStringAsFixed(2),
            ),

            _SummaryRow(
              label: 'Tax',
              value: purchase.totalTax
                  .toStringAsFixed(2),
            ),

            const Divider(),

            _SummaryRow(
              label: 'Grand Total',
              value: purchase.grandTotal
                  .toStringAsFixed(2),
              bold: true,
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// _SummaryRow
/// ---------------------------------------------------------------------------
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight:
          bold ? FontWeight.bold : FontWeight.normal,
      fontSize: bold ? 16 : 14,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: style,
            ),
          ),
          Text(
            value,
            style: style,
          ),
        ],
      ),
    );
  }
}