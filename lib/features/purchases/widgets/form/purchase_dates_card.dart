import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';
import '../../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseDatesCard
/// ---------------------------------------------------------------------------
///
/// Purchase dates and status.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseDatesCard extends StatelessWidget {
  const PurchaseDatesCard({super.key, required this.controller});

  final PurchaseFormController controller;

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
            Text(
              'Order Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Order Date
            //------------------------------------------------------------------
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: const Text('Order Date'),
              subtitle: Text(_formatDate(controller.orderDate)),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: controller.orderDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  controller.setOrderDate(date);
                }
              },
            ),

            const Divider(),

            //------------------------------------------------------------------
            // Expected Delivery
            //------------------------------------------------------------------
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.local_shipping),
              title: const Text('Expected Delivery'),
              subtitle: Text(
                controller.expectedDeliveryDate == null
                    ? 'Not selected'
                    : _formatDate(controller.expectedDeliveryDate!),
              ),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate:
                      controller.expectedDeliveryDate ?? controller.orderDate,
                  firstDate: controller.orderDate,
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  controller.setExpectedDeliveryDate(date);
                }
              },
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Status
            //------------------------------------------------------------------
            DropdownButtonFormField<PurchaseStatus>(
              initialValue: controller.status,
              decoration: const InputDecoration(
                labelText: 'Purchase Status',
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(),
              ),
              items: PurchaseStatus.values
                  .map(
                    (status) => DropdownMenuItem(
                      value: status,
                      child: Text(_statusLabel(status)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.setStatus(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _statusLabel(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.draft:
        return 'Draft';
      case PurchaseStatus.pendingApproval:
        return 'Draft';

      case PurchaseStatus.ordered:
        return 'Ordered';

      case PurchaseStatus.partial:
        return 'Partially Received';

      case PurchaseStatus.received:
        return 'Received';

      case PurchaseStatus.cancelled:
        return 'Cancelled';
    }
  }
}
