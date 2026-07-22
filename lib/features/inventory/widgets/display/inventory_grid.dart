import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/router/app_routes.dart';
import '../../providers/inventory_provider.dart';
import 'empty_inventory.dart';
import 'inventory_card.dart';

/// ---------------------------------------------------------------------------
/// InventoryGrid
/// ---------------------------------------------------------------------------
///
/// Displays all inventory items in a responsive grid.
///
/// Layout:
/// • Mobile  -> 1 column
/// • Tablet  -> 2 columns
/// • Desktop -> 3–4 columns
/// ---------------------------------------------------------------------------
class InventoryGrid extends StatelessWidget {
  const InventoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final inventory = provider.inventory;

        if (inventory.isEmpty) {
          return const EmptyInventory();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int columns = 1;

            if (constraints.maxWidth >= 1200) {
              columns = 4;
            } else if (constraints.maxWidth >= 900) {
              columns = 3;
            } else if (constraints.maxWidth >= 600) {
              columns = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: inventory.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index) {
                final item = inventory[index];

                return InventoryCard(
                  item: item,
                  onTap: () {
                    context.push(
                      '${AppRoutes.inventory}/${item.id}',
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}