import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ReceivePurchaseActions
/// ---------------------------------------------------------------------------
///
/// Action buttons for the Receive Purchase screen.
///
/// Used by:
/// • ReceivePurchaseScreen
/// ---------------------------------------------------------------------------
class ReceivePurchaseActions extends StatelessWidget {
  const ReceivePurchaseActions({
    super.key,
    required this.isSaving,
    required this.onSave,
    required this.onCancel,
  });

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
          child: OutlinedButton(
            onPressed: isSaving ? null : onCancel,
            child: const Text('Cancel'),
          ),
        ),

        const SizedBox(width: 16),

        //----------------------------------------------------------------------
        // Receive Purchase
        //----------------------------------------------------------------------
        Expanded(
          flex: 2,
          child: FilledButton(
            onPressed: isSaving ? null : onSave,
            child: isSaving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Receive Purchase'),
          ),
        ),
      ],
    );
  }
}
