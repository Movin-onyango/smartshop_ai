import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// SaleItemsSection
/// ---------------------------------------------------------------------------
///
/// Displays all products included in a sale.
///
/// Responsibilities:
/// • Product name
/// • Quantity
/// • Unit price
/// • Discount
/// • Line total
/// ---------------------------------------------------------------------------
class SaleItemsSection extends StatelessWidget {
  const SaleItemsSection({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Items Purchased',
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            ...sale.items.map(
              (item) => Padding(
                padding:
                    const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding:
                      const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.colorScheme
                        .surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.product.name,
                              style: theme
                                  .textTheme
                                  .titleMedium,
                            ),
                          ),

                          Text(
                            'x${item.quantity}',
                            style: theme
                                .textTheme
                                .titleMedium,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      _row(
                        context,
                        'Unit Price',
                        'KSh ${item.unitPrice.toStringAsFixed(2)}',
                      ),

                      if (item.discount > 0)
                        _row(
                          context,
                          'Discount',
                          'KSh ${item.discount.toStringAsFixed(2)}',
                        ),

                      const Divider(),

                      _row(
                        context,
                        'Subtotal',
                        'KSh ${item.subtotal.toStringAsFixed(2)}',
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    bool isBold = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          Text(
            value,
            style: isBold
                ? theme.textTheme.titleMedium
                    ?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                : theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}