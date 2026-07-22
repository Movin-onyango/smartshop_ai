import 'package:flutter/material.dart';

import '/features/products/extensions/product_extensions.dart';
import '../../models/product.dart';
import '/features/dashboard/widgets/section_header.dart';
import 'detail_tile.dart';

class InventorySection extends StatelessWidget {
  const InventorySection({
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
            const SectionHeader(title: 'Inventory'),

            const SizedBox(height: 16),

            DetailTile(
              label: 'Quantity',
              value: product.quantity.toString(),
              icon: Icons.inventory,
            ),

            DetailTile(
              label: 'Reorder Level',
              value: product.reorderLevel.toString(),
              icon: Icons.warning_amber_outlined,
            ),

            DetailTile(
              label: 'Stock Value',
              value: 'KES ${product.stockValue.toStringAsFixed(2)}',
              icon: Icons.payments_outlined,
            ),

            DetailTile(
              label: 'Expiry Date',
              value: product.expiryDate == null
                  ? '-'
                  : product.expiryDate!
                      .toIso8601String()
                      .split('T')
                      .first,
              icon: Icons.calendar_today_outlined,
            ),

            DetailTile(
              label: 'Track Expiry',
              value: product.trackExpiry ? 'Yes' : 'No',
              icon: Icons.event_available,
            ),

            DetailTile(
              label: 'Low Stock Alerts',
              value: product.lowStockAlerts ? 'Enabled' : 'Disabled',
              icon: Icons.notifications_active_outlined,
            ),
          ],
        ),
      ),
    );
  }
}