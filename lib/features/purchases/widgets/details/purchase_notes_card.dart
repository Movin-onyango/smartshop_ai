import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// PurchaseNotesCard
/// ---------------------------------------------------------------------------
///
/// Displays purchase notes.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseNotesCard extends StatelessWidget {
  const PurchaseNotesCard({
    super.key,
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    if (purchase.notes == null ||
        purchase.notes!.trim().isEmpty) {
      return const SizedBox.shrink();
    }

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

            Row(
              children: [
                const Icon(
                  Icons.notes,
                ),

                const SizedBox(width: 12),

                Text(
                  'Notes',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,
                ),
              ],
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Notes
            //------------------------------------------------------------------

            SelectableText(
              purchase.notes!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}