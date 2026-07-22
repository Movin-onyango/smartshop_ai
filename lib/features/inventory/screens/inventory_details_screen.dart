import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../providers/inventory_provider.dart';

/// ---------------------------------------------------------------------------
/// InventoryDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays complete inventory information for a single item.
///
/// Responsibilities:
/// • Display product information
/// • Display stock information
/// • Display inventory value
/// • Navigate to Stock Adjustment
/// ---------------------------------------------------------------------------
class InventoryDetailsScreen extends StatelessWidget {
  const InventoryDetailsScreen({
    super.key,
    required this.inventoryId,
  });

  final String inventoryId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventoryProvider>();
    final item = provider.findById(inventoryId);

    if (item == null) {
      return const Scaffold(
        body: Center(
          child: Text('Inventory item not found'),
        ),
      );
    }

    return SmartScaffold(
      title: item.product.name,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            context.push(
              '${AppRoutes.inventory}/${item.id}/adjust',
            );
          },
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      child: Icon(
                        Icons.inventory_2_outlined,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge,
                          ),

                          const SizedBox(height: 6),

                          Text(
                            item.product.category,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    _infoRow(
                      'Current Stock',
                      '${item.quantity}',
                    ),

                    _infoRow(
                      'Reorder Level',
                      '${item.reorderLevel}',
                    ),

                    _infoRow(
                      'Buying Price',
                      'KSh ${item.product.buyingPrice.toStringAsFixed(2)}',
                    ),

                    _infoRow(
                      'Selling Price',
                      'KSh ${item.product.sellingPrice.toStringAsFixed(2)}',
                    ),

                    _infoRow(
                      'Stock Value',
                      'KSh ${item.stockValue.toStringAsFixed(2)}',
                    ),

                    _infoRow(
                      'Retail Value',
                      'KSh ${item.retailValue.toStringAsFixed(2)}',
                    ),

                    _infoRow(
                      'Expected Profit',
                      'KSh ${item.expectedProfit.toStringAsFixed(2)}',
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  context.push(
                    '${AppRoutes.inventory}/${item.id}/adjust',
                  );
                },
                icon: const Icon(Icons.edit_note),
                label: const Text(
                  'Adjust Stock',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}