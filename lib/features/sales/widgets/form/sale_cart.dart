import 'package:flutter/material.dart';

import '../../models/sale_item.dart';

class SaleCart extends StatelessWidget {
  const SaleCart({
    super.key,
    required this.items,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final List<SaleItem> items;
  final ValueChanged<SaleItem> onIncrease;
  final ValueChanged<SaleItem> onDecrease;
  final ValueChanged<SaleItem> onRemove;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: const [
              Icon(Icons.shopping_cart_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No products added',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Select products above to start creating a sale.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Shopping Cart',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),

            const SizedBox(height: 16),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(child: Text(item.quantity.toString())),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          const SizedBox(height: 4),

                          Text('KSh ${item.unitPrice.toStringAsFixed(2)} each'),

                          const SizedBox(height: 8),

                          Text(
                            'Total: KSh ${item.subtotal.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        IconButton(
                          onPressed: () => onIncrease(item),
                          icon: const Icon(Icons.add_circle),
                        ),

                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        IconButton(
                          onPressed: () => onDecrease(item),
                          icon: const Icon(Icons.remove_circle),
                        ),
                      ],
                    ),

                    IconButton(
                      tooltip: 'Remove',
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => onRemove(item),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
