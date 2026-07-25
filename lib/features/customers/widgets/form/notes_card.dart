import 'package:flutter/material.dart';

import '../../controllers/customer_form_controller.dart';

/// ---------------------------------------------------------------------------
/// NotesCard
/// ---------------------------------------------------------------------------
///
/// Additional notes about the customer.
/// ---------------------------------------------------------------------------
class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.controller});

  final CustomerFormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 24),

            TextFormField(
              controller: controller.notesController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Customer Notes',
                hintText:
                    'Enter any additional information about this customer...',
                prefixIcon: Icon(Icons.sticky_note_2),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'These notes are for internal use only and will not appear on receipts.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
