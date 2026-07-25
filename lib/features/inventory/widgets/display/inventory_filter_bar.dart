import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/inventory_provider.dart';

/// ---------------------------------------------------------------------------
/// InventoryFilterBar
/// ---------------------------------------------------------------------------
///
/// Filters inventory by stock status.
/// ---------------------------------------------------------------------------
class InventoryFilterBar extends StatelessWidget {
  const InventoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(
      builder: (context, provider, child) {
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilterChip(
              label: const Text('All'),
              selected: provider.filter == InventoryFilter.all,
              onSelected: (_) {
                provider.setFilter(InventoryFilter.all);
              },
            ),

            FilterChip(
              label: const Text('Low Stock'),
              selected: provider.filter == InventoryFilter.lowStock,
              onSelected: (_) {
                provider.setFilter(InventoryFilter.lowStock);
              },
            ),

            FilterChip(
              label: const Text('Out of Stock'),
              selected: provider.filter == InventoryFilter.outOfStock,
              onSelected: (_) {
                provider.setFilter(InventoryFilter.outOfStock);
              },
            ),
          ],
        );
      },
    );
  }
}
