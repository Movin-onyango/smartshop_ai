import 'package:flutter/material.dart';

import '../../models/expense.dart';

/// ---------------------------------------------------------------------------
/// ExpenseNotesSection
/// ---------------------------------------------------------------------------
///
/// Displays notes and remarks for an expense.
///
/// Used by:
/// • ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
class ExpenseNotesSection extends StatelessWidget {
  const ExpenseNotesSection({
    super.key,
    required this.expense,
  });

  final Expense expense;

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
              'Notes',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            if (expense.notes == null ||
                expense.notes!.trim().isEmpty)
              const Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.sticky_note_2_outlined,
                        size: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'No notes available.',
                      ),
                    ],
                  ),
                ),
              )
            else
              SelectableText(
                expense.notes!,
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