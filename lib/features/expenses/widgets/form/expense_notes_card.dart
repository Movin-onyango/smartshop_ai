import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ExpenseNotesCard
/// ---------------------------------------------------------------------------
///
/// Additional notes for an expense.
///
/// Used by:
/// • AddExpenseScreen
/// • EditExpenseScreen
/// ---------------------------------------------------------------------------
class ExpenseNotesCard extends StatelessWidget {
  const ExpenseNotesCard({super.key, required this.notesController});

  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notes', style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 20),

            TextFormField(
              controller: notesController,
              maxLines: 5,
              minLines: 4,
              maxLength: 500,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Additional Notes',
                hintText:
                    'Enter any additional information about this expense...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 90),
                  child: Icon(Icons.notes),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
