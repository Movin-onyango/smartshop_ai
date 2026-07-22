import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// PurchaseNotesSection
/// ---------------------------------------------------------------------------
///
/// Displays purchase notes.
///
/// Used by:
/// • PurchaseDetailsScreen
/// • Purchase Reports
/// • Print Preview
/// ---------------------------------------------------------------------------
class PurchaseNotesSection extends StatelessWidget {
  const PurchaseNotesSection({
    super.key,
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    final notes = purchase.notes?.trim();

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
            // Notes
            //------------------------------------------------------------------

            if (notes == null ||
                notes.isEmpty)
              const _EmptyNotes()
            else
              SelectableText(
                notes,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge,
              ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Empty Notes
/// ---------------------------------------------------------------------------
class _EmptyNotes extends StatelessWidget {
  const _EmptyNotes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [
          Icon(
            Icons.notes_outlined,
            color: Theme.of(context)
                .colorScheme
                .outline,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              'No notes were provided for this purchase.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}