import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ExpenseActionButtons
/// ---------------------------------------------------------------------------
///
/// Action buttons displayed at the bottom of the expense details page.
///
/// Used by:
/// • ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
class ExpenseActionButtons extends StatelessWidget {
  const ExpenseActionButtons({
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.onShare,
    this.isDeleting = false,
  });

  final VoidCallback onEdit;

  final VoidCallback onDelete;

  final VoidCallback? onShare;

  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //----------------------------------------------------------------------
        // Edit
        //----------------------------------------------------------------------

        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
            label: const Text('Edit Expense'),
          ),
        ),

        const SizedBox(height: 12),

        //----------------------------------------------------------------------
        // Share
        //----------------------------------------------------------------------

        if (onShare != null)
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.share),
              label: const Text('Share / Export'),
            ),
          ),

        if (onShare != null)
          const SizedBox(height: 12),

        //----------------------------------------------------------------------
        // Delete
        //----------------------------------------------------------------------

        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed:
                isDeleting
                    ? null
                    : onDelete,
            icon: isDeleting
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child:
                        CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.delete),
            label: Text(
              isDeleting
                  ? 'Deleting...'
                  : 'Delete Expense',
            ),
          ),
        ),
      ],
    );
  }
}