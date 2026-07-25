import 'package:flutter/material.dart';

import '../../models/purchase_item.dart';
import 'purchase_value_tile.dart';

class PurchaseItemCard extends StatelessWidget {
  const PurchaseItemCard({super.key, required this.item});

  final PurchaseItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.productName,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: PurchaseValueTile(
                  label: 'Ordered',
                  value: item.quantity.toStringAsFixed(2),
                ),
              ),
              Expanded(
                child: PurchaseValueTile(
                  label: 'Received',
                  value: item.receivedQuantity.toStringAsFixed(2),
                ),
              ),
              Expanded(
                child: PurchaseValueTile(
                  label: 'Remaining',
                  value: item.remainingQuantity.toStringAsFixed(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: PurchaseValueTile(
                  label: 'Unit Cost',
                  value: item.unitCost.toStringAsFixed(2),
                ),
              ),
              Expanded(
                child: PurchaseValueTile(
                  label: 'Discount',
                  value: '${item.discount.toStringAsFixed(1)}%',
                ),
              ),
              Expanded(
                child: PurchaseValueTile(
                  label: 'Tax',
                  value: '${item.tax.toStringAsFixed(1)}%',
                ),
              ),
            ],
          ),

          const Divider(height: 28),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Line Total: ${item.total.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
