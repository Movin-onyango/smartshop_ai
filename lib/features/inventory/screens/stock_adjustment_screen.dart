import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../providers/inventory_provider.dart';

/// ---------------------------------------------------------------------------
/// StockAdjustmentScreen
/// ---------------------------------------------------------------------------
///
/// Allows increasing or decreasing stock.
///
/// Responsibilities:
/// • Display current stock
/// • Increase stock
/// • Decrease stock
/// • Save changes
/// ---------------------------------------------------------------------------
class StockAdjustmentScreen extends StatefulWidget {
  const StockAdjustmentScreen({super.key, required this.inventoryId});

  final String inventoryId;

  @override
  State<StockAdjustmentScreen> createState() => _StockAdjustmentScreenState();
}

class _StockAdjustmentScreenState extends State<StockAdjustmentScreen> {
  final _quantityController = TextEditingController();

  bool _increase = true;

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _save() {
    final provider = context.read<InventoryProvider>();

    final quantity = int.tryParse(_quantityController.text) ?? 0;

    if (quantity <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter a valid quantity.')));
      return;
    }

    if (_increase) {
      provider.increaseStock(widget.inventoryId, quantity);
    } else {
      provider.decreaseStock(widget.inventoryId, quantity);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Inventory updated successfully.')),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InventoryProvider>();

    final item = provider.findById(widget.inventoryId);

    if (item == null) {
      return const Scaffold(
        body: Center(child: Text('Inventory item not found')),
      );
    }

    return SmartScaffold(
      title: 'Adjust Stock',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.product.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              'Current Stock: ${item.quantity}',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 24),

            SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                  value: true,
                  icon: Icon(Icons.add),
                  label: Text('Increase'),
                ),
                ButtonSegment(
                  value: false,
                  icon: Icon(Icons.remove),
                  label: Text('Decrease'),
                ),
              ],
              selected: {_increase},
              onSelectionChanged: (value) {
                setState(() {
                  _increase = value.first;
                });
              },
            ),

            const SizedBox(height: 24),

            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Save Adjustment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
