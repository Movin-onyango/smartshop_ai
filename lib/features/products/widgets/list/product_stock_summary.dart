import 'package:flutter/material.dart';

import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';

class ProductStockSummary extends StatelessWidget {
  const ProductStockSummary({
    super.key,
    required this.product,
  });

  final Product product;

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _row(
          'Quantity',
          product.quantity.toString(),
        ),
        _row(
          'Reorder',
          product.reorderLevel.toString(),
        ),
        _row(
          'Stock Value',
          'KES ${product.stockValue.toStringAsFixed(2)}',
        ),
      ],
    );
  }
}