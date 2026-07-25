import 'package:flutter/material.dart';

import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';

class ProductPriceSummary extends StatelessWidget {
  const ProductPriceSummary({super.key, required this.product});

  final Product product;

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row('Buying', 'KES ${product.buyingPrice.toStringAsFixed(2)}'),
        _row('Selling', 'KES ${product.sellingPrice.toStringAsFixed(2)}'),
        _row('Profit', 'KES ${product.profit.toStringAsFixed(2)}'),
        _row('Margin', '${product.margin.toStringAsFixed(1)}%'),
      ],
    );
  }
}
