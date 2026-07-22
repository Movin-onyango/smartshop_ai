import 'package:flutter/material.dart';

import '../../models/sale_item.dart';

/// ---------------------------------------------------------------------------
/// CartItemTile
/// ---------------------------------------------------------------------------
///
/// Displays a single item in the shopping cart.
///
/// Responsibilities:
/// • Product information
/// • Quantity controls
/// • Line subtotal
/// • Remove item
/// ---------------------------------------------------------------------------
class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final SaleItem item;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            /// Product Name + Remove Button
            Row(
              children: [

                Expanded(
                  child: Text(
                    item.product.name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                IconButton(
                  tooltip: 'Remove',
                  icon: const Icon(Icons.delete_outline),
                  color: theme.colorScheme.error,
                  onPressed: onRemove,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Unit Price: '
              'KSh ${item.unitPrice.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            /// Quantity Controls
            Row(
              children: [

                IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                  ),
                  onPressed: onDecrease,
                ),

                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      '${item.quantity}',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                  ),
                  onPressed: onIncrease,
                ),

                const Spacer(),

                Text(
                  'KSh ${item.subtotal.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            if (item.discount > 0) ...[
              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Discount: '
                  'KSh ${item.discount.toStringAsFixed(2)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}