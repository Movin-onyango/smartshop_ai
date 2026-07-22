import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import 'purchase_item_card.dart';

class PurchaseItemsSection extends StatelessWidget {
  const PurchaseItemsSection({
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
            Text(
              'Purchased Items',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            if (purchase.items.isEmpty)
              const Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                  child: Text(
                    'No purchase items.',
                  ),
                ),
              )
            else
              ...purchase.items.map(
                (item) => Padding(
                  padding:
                      const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: PurchaseItemCard(
                    item: item,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ValueTile extends StatelessWidget {
  const ValueTile({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyLarge,
        ),
      ],
    );
  }
}