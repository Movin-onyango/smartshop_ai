import 'package:flutter/material.dart';

import '../../models/inventory_item.dart';

/// ---------------------------------------------------------------------------
/// InventoryCard
/// ---------------------------------------------------------------------------
///
/// Displays an inventory summary.
///
/// Responsibilities:
/// • Product information
/// • Current stock
/// • Stock value
/// • Inventory status
/// • Navigate to inventory details
/// ---------------------------------------------------------------------------
class InventoryCard extends StatelessWidget {
  const InventoryCard({super.key, required this.item, this.onTap});

  final InventoryItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    String status;

    if (item.isOutOfStock) {
      status = 'Out of Stock';
      statusColor = Colors.red;
    } else if (item.isLowStock) {
      status = 'Low Stock';
      statusColor = Colors.orange;
    } else {
      status = 'In Stock';
      statusColor = Colors.green;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    child: const Icon(Icons.inventory_2_outlined),
                  ),

                  const Spacer(),

                  Chip(
                    label: Text(status),
                    backgroundColor: statusColor.withValues(alpha: 0.15),
                    labelStyle: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                item.product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 6),

              Text(
                item.product.category,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const Spacer(),

              const Divider(),

              Row(
                children: [
                  const Icon(Icons.inventory, size: 18),

                  const SizedBox(width: 8),

                  Text(
                    'Qty: ${item.quantity}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Icon(Icons.payments_outlined, size: 18),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      'Stock Value: KSh ${item.stockValue.toStringAsFixed(2)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
