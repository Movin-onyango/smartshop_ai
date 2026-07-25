import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';
import '../../models/purchase_item.dart';

/// ---------------------------------------------------------------------------
/// PurchaseItemsCard
/// ---------------------------------------------------------------------------
///
/// Purchase line items.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseItemsCard extends StatelessWidget {
  const PurchaseItemsCard({
    super.key,
    required this.controller,
    required this.onAddItem,
    required this.onEditItem,
  });

  final PurchaseFormController controller;

  final VoidCallback onAddItem;

  final void Function(int index, PurchaseItem item) onEditItem;

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
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Purchase Items',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                FilledButton.icon(
                  onPressed: onAddItem,
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Empty State
            //------------------------------------------------------------------
            if (controller.items.isEmpty)
              const _EmptyItems()
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.items.length,
                separatorBuilder: (_, _) => const Divider(height: 24),
                itemBuilder: (context, index) {
                  final item = controller.items[index];

                  return _PurchaseItemTile(
                    item: item,
                    onEdit: () => onEditItem(index, item),
                    onDelete: () {
                      controller.removeItem(item);
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Purchase Item Tile
/// ---------------------------------------------------------------------------
class _PurchaseItemTile extends StatelessWidget {
  const _PurchaseItemTile({
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  final PurchaseItem item;

  final VoidCallback onEdit;

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      title: Text(
        item.productName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Qty: ${item.quantity}'),
            Text('Unit Cost: ${item.unitCost.toStringAsFixed(2)}'),
            Text('Discount: ${item.discount.toStringAsFixed(1)}%'),
            Text('Tax: ${item.tax.toStringAsFixed(1)}%'),
          ],
        ),
      ),

      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.total.toStringAsFixed(2),
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.edit), onPressed: onEdit),

              IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
            ],
          ),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Empty Items
/// ---------------------------------------------------------------------------
class _EmptyItems extends StatelessWidget {
  const _EmptyItems();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: 16),

            Text(
              'No items added',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 8),

            Text(
              'Tap "Add Item" to begin.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
