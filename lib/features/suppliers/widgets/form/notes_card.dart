import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// NotesCard
/// ---------------------------------------------------------------------------
///
/// Supplier notes.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.notesController});

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
              minLines: 4,
              maxLines: 8,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Notes',
                hintText: 'Enter additional supplier information...',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 72),
                  child: Icon(Icons.notes_outlined),
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
