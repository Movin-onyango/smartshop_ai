import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// CustomerFormActions
/// ---------------------------------------------------------------------------
///
/// Reusable form action buttons.
///
/// Used by:
/// • Add Customer
/// • Edit Customer
///
/// Responsibilities:
/// • Save customer
/// • Cancel changes
/// • Display loading state
/// ---------------------------------------------------------------------------
class CustomerFormActions extends StatelessWidget {
  const CustomerFormActions({
    super.key,
    required this.onSave,
    required this.onCancel,
    this.isLoading = false,
    this.saveLabel = 'Save Customer',
  });

  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final bool isLoading;
  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: isLoading ? null : onCancel,
            icon: const Icon(Icons.close),
            label: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text('Cancel'),
            ),
          ),
        ),

        const SizedBox(width: 16),

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
                : const Icon(Icons.save),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(saveLabel),
            ),
          ),
        ),
      ],
    );
  }
}
