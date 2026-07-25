import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductFilterBar extends StatelessWidget {
  const ProductFilterBar({super.key});

  static const _categories = [
    'All',
    'Dairy',
    'Bakery',
    'Groceries',
    'Drinks',
    'Snacks',
    'Cleaning',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.map((category) {
              final selected = provider.selectedCategory == category;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) {
                    provider.filterProducts(category);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
