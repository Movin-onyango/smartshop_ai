import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'product_action_buttons.dart';
import 'product_price_summary.dart';
import 'product_status_badges.dart';
import 'product_stock_summary.dart';
import 'product_thumbnail.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
    required this.product,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  final Product product;
  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ProductThumbnail(product: product),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      const SizedBox(height: 4),

                      Text(product.category),

                      if (product.barcode != null &&
                          product.barcode!.isNotEmpty)
                        Text(
                          product.barcode!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Divider(),

            ProductPriceSummary(product: product),

            const Divider(),

            ProductStockSummary(product: product),

            const SizedBox(height: 12),

            ProductStatusBadges(product: product),

            const Divider(),

            ProductActionButtons(
              onView: onView,
              onEdit: onEdit,
              onDelete: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
