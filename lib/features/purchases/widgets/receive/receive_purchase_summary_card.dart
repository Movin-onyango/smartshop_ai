import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import '../../models/purchase_item.dart';

/// ---------------------------------------------------------------------------
/// ReceivePurchaseSummaryCard
/// ---------------------------------------------------------------------------
///
/// Displays a summary of the purchase receipt.
///
/// Used by:
/// • ReceivePurchaseScreen
/// ---------------------------------------------------------------------------
class ReceivePurchaseSummaryCard extends StatelessWidget {
  const ReceivePurchaseSummaryCard({
    super.key,
    required this.purchase,
    required this.items,
  });

  final Purchase purchase;

  final List<PurchaseItem> items;

  double get _orderedQuantity {
    return items.fold(0.0, (sum, item) => sum + item.quantity);
  }

  double get _receivedQuantity {
    return items.fold(0.0, (sum, item) => sum + item.receivedQuantity);
  }

  double get _remainingQuantity {
    return items.fold(0.0, (sum, item) => sum + item.remainingQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------
            Text(
              'Receipt Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _SummaryRow(
              label: 'Purchase Number',
              value: purchase.purchaseNumber,
            ),

            _SummaryRow(label: 'Supplier', value: purchase.supplierName),

            _SummaryRow(
              label: 'Ordered Quantity',
              value: _orderedQuantity.toStringAsFixed(2),
            ),

            _SummaryRow(
              label: 'Received Quantity',
              value: _receivedQuantity.toStringAsFixed(2),
            ),

            _SummaryRow(
              label: 'Remaining Quantity',
              value: _remainingQuantity.toStringAsFixed(2),
            ),

            const Divider(height: 32),

            _SummaryRow(
              label: 'Order Value',
              value: 'KES ${purchase.grandTotal.toStringAsFixed(2)}',
              isBold: true,
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
    this.isBold = false,
  });

  final String label;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final style = isBold
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value, style: style),
        ],
      ),
    );
  }
}
