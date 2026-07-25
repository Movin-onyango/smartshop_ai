import 'package:flutter/material.dart';

import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';
import '../details/status_chip.dart';

class ProductStatusBadges extends StatelessWidget {
  const ProductStatusBadges({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (product.isLowStock)
          const StatusChip(label: 'Low Stock', color: Colors.orange),

        if (product.hasExpired)
          const StatusChip(label: 'Expired', color: Colors.red),

        if (product.expiresSoon && !product.hasExpired)
          const StatusChip(label: 'Expires Soon', color: Colors.amber),

        if (!product.isLowStock && !product.hasExpired && !product.expiresSoon)
          const StatusChip(label: 'Healthy', color: Colors.green),
      ],
    );
  }
}
