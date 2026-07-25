import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSupplierCard
/// ---------------------------------------------------------------------------
///
/// Supplier selection.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseSupplierCard extends StatelessWidget {
  const PurchaseSupplierCard({
    super.key,
    required this.controller,
    required this.onSelectSupplier,
  });

  final PurchaseFormController controller;

  final VoidCallback onSelectSupplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------
            Text('Supplier', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Supplier
            //------------------------------------------------------------------
            TextFormField(
              controller: controller.supplierController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Supplier',
                hintText: 'Select supplier',
                prefixIcon: const Icon(Icons.business),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onSelectSupplier,
                ),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (controller.supplierId == null) {
                  return 'Please select a supplier';
                }

                return null;
              },
              onTap: onSelectSupplier,
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Selected Supplier ID
            //------------------------------------------------------------------
            if (controller.supplierId != null)
              Text(
                'Supplier ID: ${controller.supplierId}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
