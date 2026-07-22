import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseActions
/// ---------------------------------------------------------------------------
///
/// Action buttons displayed on the Purchase Details screen.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseActions extends StatelessWidget {
  const PurchaseActions({
    super.key,
    required this.onEdit,
    required this.onReceive,
    required this.onDelete,
    this.canReceive = true,
    this.canEdit = true,
    this.canDelete = true,
  });

  final VoidCallback onEdit;

  final VoidCallback onReceive;

  final VoidCallback onDelete;

  final bool canReceive;

  final bool canEdit;

  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------

            Text(
              'Actions',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Edit Purchase
            //------------------------------------------------------------------

            FilledButton.icon(
              onPressed:
                  canEdit ? onEdit : null,
              icon: const Icon(
                Icons.edit,
              ),
              label: const Text(
                'Edit Purchase',
              ),
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Receive Purchase
            //------------------------------------------------------------------

            FilledButton.tonalIcon(
              onPressed:
                  canReceive
                      ? onReceive
                      : null,
              icon: const Icon(
                Icons.inventory_2,
              ),
              label: const Text(
                'Receive Purchase',
              ),
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Delete Purchase
            //------------------------------------------------------------------

            OutlinedButton.icon(
              onPressed:
                  canDelete
                      ? onDelete
                      : null,
              icon: const Icon(
                Icons.delete_outline,
              ),
              label: const Text(
                'Delete Purchase',
              ),
            ),
          ],
        ),
      ),
    );
  }
}