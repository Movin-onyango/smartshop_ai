import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

/// ---------------------------------------------------------------------------
/// StockTransferScreen
/// ---------------------------------------------------------------------------
///
/// Transfers stock between locations.
///
/// This is currently a UI placeholder. The actual transfer logic
/// will be implemented when warehouse/location management is added.
/// ---------------------------------------------------------------------------
class StockTransferScreen extends StatefulWidget {
  const StockTransferScreen({
    super.key,
    required this.inventoryId,
  });

  final String inventoryId;

  @override
  State<StockTransferScreen> createState() =>
      _StockTransferScreenState();
}

class _StockTransferScreenState
    extends State<StockTransferScreen> {
  final _quantityController = TextEditingController();

  String? _sourceLocation;
  String? _destinationLocation;

  final List<String> _locations = const [
    'Main Store',
    'Warehouse',
    'Branch A',
    'Branch B',
  ];

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  void _transferStock() {
    final quantity =
        int.tryParse(_quantityController.text) ?? 0;

    if (_sourceLocation == null ||
        _destinationLocation == null ||
        quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Complete all required fields.',
          ),
        ),
      );
      return;
    }

    if (_sourceLocation == _destinationLocation) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Source and destination cannot be the same.',
          ),
        ),
      );
      return;
    }

    // TODO:
    // Implement repository/provider transfer logic.

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Stock transferred successfully.',
        ),
      ),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Transfer Stock',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              initialValue: _sourceLocation,
              decoration: const InputDecoration(
                labelText: 'From',
                border: OutlineInputBorder(),
              ),
              items: _locations
                  .map(
                    (location) => DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _sourceLocation = value;
                });
              },
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: _destinationLocation,
              decoration: const InputDecoration(
                labelText: 'To',
                border: OutlineInputBorder(),
              ),
              items: _locations
                  .map(
                    (location) => DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _destinationLocation = value;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _transferStock,
                icon: const Icon(Icons.swap_horiz),
                label: const Text(
                  'Transfer Stock',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}