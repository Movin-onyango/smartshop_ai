import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';
import '../../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseInformationCard
/// ---------------------------------------------------------------------------
///
/// Purchase header information.
///
/// Used by:
/// • Create Purchase
/// • Edit Purchase
/// ---------------------------------------------------------------------------
class PurchaseInformationCard extends StatelessWidget {
  const PurchaseInformationCard({
    super.key,
    required this.controller,
  });

  final PurchaseFormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              'Purchase Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Supplier
            //------------------------------------------------------------------

            TextFormField(
              controller:
                  controller.supplierController,
              readOnly: true,
              decoration:
                  const InputDecoration(
                labelText: 'Supplier',
                hintText:
                    'Select supplier',
                prefixIcon: Icon(
                  Icons.local_shipping,
                ),
                border:
                    OutlineInputBorder(),
              ),
              validator: (value) {
                if (controller.supplierId ==
                    null) {
                  return 'Supplier is required';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Order Date
            //------------------------------------------------------------------

            ListTile(
              leading: const Icon(
                Icons.calendar_today,
              ),
              title:
                  const Text('Order Date'),
              subtitle: Text(
                controller.orderDate
                    .toLocal()
                    .toString()
                    .split(' ')
                    .first,
              ),
              trailing: const Icon(
                Icons.edit_calendar,
              ),
              onTap: () async {
                final date =
                    await showDatePicker(
                  context: context,
                  initialDate:
                      controller.orderDate,
                  firstDate:
                      DateTime(2020),
                  lastDate:
                      DateTime(2100),
                );

                if (date != null) {
                  controller
                      .setOrderDate(date);
                }
              },
            ),

            const Divider(),

            //------------------------------------------------------------------
            // Expected Delivery
            //------------------------------------------------------------------

            ListTile(
              leading: const Icon(
                Icons.local_shipping,
              ),
              title: const Text(
                'Expected Delivery',
              ),
              subtitle: Text(
                controller
                            .expectedDeliveryDate ==
                        null
                    ? 'Not selected'
                    : controller
                        .expectedDeliveryDate!
                        .toLocal()
                        .toString()
                        .split(' ')
                        .first,
              ),
              trailing: const Icon(
                Icons.edit_calendar,
              ),
              onTap: () async {
                final date =
                    await showDatePicker(
                  context: context,
                  initialDate:
                      controller
                              .expectedDeliveryDate ??
                          DateTime.now(),
                  firstDate:
                      DateTime(2020),
                  lastDate:
                      DateTime(2100),
                );

                if (date != null) {
                  controller
                      .setExpectedDeliveryDate(
                    date,
                  );
                }
              },
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Status
            //------------------------------------------------------------------

            DropdownButtonFormField<
                PurchaseStatus>(
              initialValue: controller.status,
              decoration:
                  const InputDecoration(
                labelText: 'Status',
                border:
                    OutlineInputBorder(),
              ),
              items:
                  PurchaseStatus.values
                      .map(
                        (status) =>
                            DropdownMenuItem(
                          value: status,
                          child: Text(
                            status.label,
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (value) {
                if (value != null) {
                  controller
                      .setStatus(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}