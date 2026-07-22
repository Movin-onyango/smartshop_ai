import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// NotesSection
/// ---------------------------------------------------------------------------
///
/// Displays supplier notes.
///
/// Used by:
/// • Supplier Details Screen
/// ---------------------------------------------------------------------------
class NotesSection extends StatelessWidget {
  const NotesSection({
    super.key,
    required this.supplier,
  });

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    final notes = supplier.notes;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              'Notes',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            if (notes == null ||
                notes.trim().isEmpty)
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest,
                  borderRadius:
                      BorderRadius.circular(12),
                ),
                child: const Text(
                  'No notes available.',
                ),
              )
            else
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest,
                  borderRadius:
                      BorderRadius.circular(12),
                ),
                child: Text(
                  notes,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge,
                ),
              ),
          ],
        ),
      ),
    );
  }
}