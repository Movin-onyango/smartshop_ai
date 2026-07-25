import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// CustomerNotes
/// ---------------------------------------------------------------------------
///
/// Displays notes associated with a customer.
///
/// Displays:
/// • Customer Notes
/// • Additional Remarks
///
/// Reused by:
/// • Customer Details
/// • CRM
/// • Sales
/// • Future AI Insights
/// ---------------------------------------------------------------------------
class CustomerNotes extends StatelessWidget {
  const CustomerNotes({super.key, required this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final notes = customer.notes?.trim() ?? '';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Notes',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            if (notes.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: const [
                    Icon(Icons.sticky_note_2_outlined, size: 42),

                    SizedBox(height: 12),

                    Text('No notes available.', textAlign: TextAlign.center),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  notes,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
