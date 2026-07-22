import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import 'purchase_value_tile.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSummarySection
/// ---------------------------------------------------------------------------
///
/// Displays the financial summary of a purchase.
///
/// Used by:
/// • PurchaseDetailsScreen
/// • Purchase Reports
/// • Print Preview
/// ---------------------------------------------------------------------------
class PurchaseSummarySection extends StatelessWidget {
  const PurchaseSummarySection({
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

            const SizedBox(height: 24),

            PurchaseValueTile(
              label: 'Subtotal',
              value:
                  purchase.subtotal.toStringAsFixed(
                2,
              ),
            ),

            const SizedBox(height: 16),

            PurchaseValueTile(
              label: 'Discount',
              value: purchase.totalDiscount
                  .toStringAsFixed(2),
            ),

            const SizedBox(height: 16),

            PurchaseValueTile(
              label: 'Taxable Amount',
              value: purchase.taxableAmount
                  .toStringAsFixed(2),
            ),

            const SizedBox(height: 16),

            PurchaseValueTile(
              label: 'Tax',
              value: purchase.totalTax
                  .toStringAsFixed(2),
            ),

            const Divider(height: 32),

            PurchaseValueTile(
              label: 'Grand Total',
              value: purchase.grandTotal
                  .toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}