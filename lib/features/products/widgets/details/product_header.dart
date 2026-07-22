import 'package:flutter/material.dart';

import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';
import 'status_chip.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              product.category,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (product.isLowStock)
                  const StatusChip(
                    label: 'Low Stock',
                    color: Colors.orange,
                  ),

                if (product.hasExpired)
                  const StatusChip(
                    label: 'Expired',
                    color: Colors.red,
                  ),

                if (!product.isLowStock && !product.hasExpired)
                  const StatusChip(
                    label: 'Healthy',
                    color: Colors.green,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}