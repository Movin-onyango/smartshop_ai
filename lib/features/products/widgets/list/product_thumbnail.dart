import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      child: Text(
        product.name.isNotEmpty
            ? product.name[0].toUpperCase()
            : '?',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }
}