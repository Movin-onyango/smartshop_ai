import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SupplierFormActions
/// ---------------------------------------------------------------------------
///
/// Form action buttons.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class SupplierFormActions extends StatelessWidget {
  const SupplierFormActions({
    super.key,
    required this.onSave,
    this.onCancel,
    this.saveLabel = 'Save Supplier',
  });

  final VoidCallback onSave;

  final VoidCallback? onCancel;

  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //----------------------------------------------------------------------
        // Cancel
        //----------------------------------------------------------------------
        if (onCancel != null)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onCancel,
              icon: const Icon(Icons.close),
              label: const Text('Cancel'),
            ),
          ),

        if (onCancel != null) const SizedBox(width: 16),

        //----------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------
        Expanded(
          flex: 2,
          child: FilledButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.save_outlined),
            label: Text(saveLabel),
          ),
        ),
      ],
    );
  }
}
