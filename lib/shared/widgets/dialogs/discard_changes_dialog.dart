import 'package:flutter/material.dart';

import 'confirmation_dialog.dart';

class DiscardChangesDialog extends StatelessWidget {
  const DiscardChangesDialog({
    super.key,
    required this.onDiscard,
  });

  final VoidCallback onDiscard;

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: 'Discard Changes?',
      icon: Icons.warning_amber_outlined,
      message:
          'You have unsaved changes. Do you want to discard them?',
      confirmText: 'Discard',
      confirmButtonColor: Colors.orange,
      onConfirm: onDiscard,
    );
  }
}