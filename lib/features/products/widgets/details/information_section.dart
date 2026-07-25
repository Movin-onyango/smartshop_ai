import 'package:flutter/material.dart';

import '../../models/product.dart';
import '/features/dashboard/widgets/section_header.dart';
import 'detail_tile.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'Product Information'),
            const SizedBox(height: 16),

            DetailTile(
              label: 'Name',
              value: product.name,
              icon: Icons.inventory_2_outlined,
            ),

            DetailTile(
              label: 'Category',
              value: product.category,
              icon: Icons.category_outlined,
            ),

            DetailTile(
              label: 'Barcode',
              value: product.barcode ?? '-',
              icon: Icons.qr_code,
            ),

            DetailTile(
              label: 'Description',
              value: product.description ?? '-',
              icon: Icons.description_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
