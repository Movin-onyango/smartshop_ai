import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseNotesCard
/// ---------------------------------------------------------------------------
///
/// Additional notes for a purchase.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseNotesCard extends StatelessWidget {
  const PurchaseNotesCard({
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
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------

            Text(
              'Notes',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Notes Field
            //------------------------------------------------------------------

            TextFormField(
              controller:
                  controller.notesController,
              maxLines: 5,
              minLines: 3,
              textCapitalization:
                  TextCapitalization.sentences,
              decoration:
                  const InputDecoration(
                labelText: 'Purchase Notes',
                hintText:
                    'Add any additional information about this purchase...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 80,
                  ),
                  child: Icon(
                    Icons.notes,
                  ),
                ),
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              'Notes are optional and can include delivery instructions, supplier remarks, or internal comments.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}