import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseFormActions
/// ---------------------------------------------------------------------------
///
/// Bottom action buttons for the purchase form.
///
/// Used by:
/// • PurchaseForm
/// ---------------------------------------------------------------------------
class PurchaseFormActions extends StatelessWidget {
  const PurchaseFormActions({
    super.key,
    required this.isEditing,
    required this.isSaving,
    required this.onSave,
    required this.onCancel,
  });

  final bool isEditing;

  final bool isSaving;

  final VoidCallback onSave;

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //----------------------------------------------------------------------
        // Cancel
        //----------------------------------------------------------------------
        Expanded(
          child: OutlinedButton.icon(
            onPressed: isSaving ? null : onCancel,
            icon: const Icon(Icons.close),
            label: const Text('Cancel'),
          ),
        ),

        const SizedBox(width: 16),

        //----------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------
        Expanded(
          child: FilledButton.icon(
            onPressed: isSaving ? null : onSave,
            icon: isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isEditing ? Icons.save : Icons.add),
            label: Text(isEditing ? 'Update Purchase' : 'Create Purchase'),
          ),
        ),
      ],
    );
  }
}
