import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierActionButtons
/// ---------------------------------------------------------------------------
///
/// Action buttons displayed at the bottom of the Supplier Details screen.
///
/// Actions:
/// • Edit Supplier
/// • Delete Supplier
/// ---------------------------------------------------------------------------
class SupplierActionButtons extends StatelessWidget {
  const SupplierActionButtons({
    super.key,
    required this.supplier,
    this.onDelete,
  });

  final Supplier supplier;

  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //----------------------------------------------------------------------
        // Edit
        //----------------------------------------------------------------------
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              context.push(AppRoutes.editSupplier(supplier.id!));
            },
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit'),
          ),
        ),

        const SizedBox(width: 16),

        //----------------------------------------------------------------------
        // Delete
        //----------------------------------------------------------------------
        Expanded(
          child: FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              final delete = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Supplier'),
                    content: Text(
                      'Delete "${supplier.name}"?\n\n'
                      'This action cannot be undone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Cancel'),
                      ),

                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );

              if (delete == true) {
                onDelete?.call();
              }
            },
            icon: const Icon(Icons.delete_outline),
            label: const Text('Delete'),
          ),
        ),
      ],
    );
  }
}
