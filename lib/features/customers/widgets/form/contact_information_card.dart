import 'package:flutter/material.dart';

import '../../controllers/customer_form_controller.dart';

/// ---------------------------------------------------------------------------
/// ContactInformationCard
/// ---------------------------------------------------------------------------
///
/// Customer contact and address.
/// ---------------------------------------------------------------------------
class ContactInformationCard extends StatelessWidget {
  const ContactInformationCard({super.key, required this.controller});

  final CustomerFormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            TextFormField(
              controller: controller.addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_on),
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: controller.notesController,
              decoration: const InputDecoration(
                labelText: 'Additional Contact Notes',
                prefixIcon: Icon(Icons.note),
                alignLabelWithHint: true,
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
