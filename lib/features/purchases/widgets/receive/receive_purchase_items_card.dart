import 'package:flutter/material.dart';

import '../../models/purchase_item.dart';

/// ---------------------------------------------------------------------------
/// ReceivePurchaseItemsCard
/// ---------------------------------------------------------------------------
///
/// Displays all purchase items and allows entering the
/// quantity received for each.
///
/// Used by:
/// • ReceivePurchaseScreen
/// ---------------------------------------------------------------------------
class ReceivePurchaseItemsCard extends StatelessWidget {
  const ReceivePurchaseItemsCard({
    super.key,
    required this.items,
    required this.onQuantityChanged,
  });

  final List<PurchaseItem> items;

  final void Function(int index, double quantity) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items Received',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('No purchase items.'),
                ),
              ),

            ...List.generate(items.length, (index) {
              final item = items[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ReceiveItemTile(
                  item: item,
                  onChanged: (value) {
                    final quantity = double.tryParse(value) ?? 0;

                    onQuantityChanged(index, quantity);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Receive Item Tile
/// ---------------------------------------------------------------------------
class _ReceiveItemTile extends StatelessWidget {
  const _ReceiveItemTile({required this.item, required this.onChanged});

  final PurchaseItem item;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.productName, style: Theme.of(context).textTheme.titleMedium),

        const SizedBox(height: 6),

        Text('Ordered: ${item.quantity}'),

        Text('Already Received: ${item.receivedQuantity}'),

        Text('Remaining: ${item.remainingQuantity}'),

        const SizedBox(height: 12),

        TextFormField(
          initialValue: item.receivedQuantity.toString(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Receive Quantity',
            border: OutlineInputBorder(),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
