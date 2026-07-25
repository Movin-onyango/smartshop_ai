import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ExpenseActions
/// ---------------------------------------------------------------------------
///
/// Form action buttons.
///
/// Used by:
/// • AddExpenseScreen
/// • EditExpenseScreen
/// ---------------------------------------------------------------------------
class ExpenseActions extends StatelessWidget {
  const ExpenseActions({
    super.key,
    required this.isLoading,
    required this.isEditing,
    required this.onSave,
    required this.onCancel,
  });

  final bool isLoading;

  final bool isEditing;

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
          child: OutlinedButton(
            onPressed: isLoading ? null : onCancel,
            child: const Text('Cancel'),
          ),
        ),

        const SizedBox(width: 16),

        //----------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------
        Expanded(
          flex: 2,
          child: FilledButton.icon(
            onPressed: isLoading ? null : onSave,
            icon: isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(isEditing ? Icons.save : Icons.add),
            label: Text(isEditing ? 'Update Expense' : 'Save Expense'),
          ),
        ),
      ],
    );
  }
}
