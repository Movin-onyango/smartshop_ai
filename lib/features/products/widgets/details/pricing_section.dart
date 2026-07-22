import 'package:flutter/material.dart';
import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';
import '/features/dashboard/widgets/section_header.dart';

import 'detail_tile.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({
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
            const SectionHeader(title: 'Pricing'),

            const SizedBox(height: 16),

            DetailTile(
              label: 'Buying Price',
              value: 'KES ${product.buyingPrice.toStringAsFixed(2)}',
              icon: Icons.shopping_cart_outlined,
            ),

            DetailTile(
              label: 'Selling Price',
              value: 'KES ${product.sellingPrice.toStringAsFixed(2)}',
              icon: Icons.sell_outlined,
            ),

            DetailTile(
              label: 'Discount',
              value: '${product.discount.toStringAsFixed(0)}%',
              icon: Icons.discount_outlined,
            ),

            DetailTile(
              label: 'Profit',
              value: 'KES ${product.profit.toStringAsFixed(2)}',
              icon: Icons.trending_up,
            ),

            DetailTile(
              label: 'Margin',
              value: '${product.margin.toStringAsFixed(1)}%',
              icon: Icons.percent,
            ),
          ],
        ),
      ),
    );
  }
}