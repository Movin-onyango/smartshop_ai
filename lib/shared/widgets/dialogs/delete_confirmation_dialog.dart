import 'package:flutter/material.dart';

import 'confirmation_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    required this.itemName,
    required this.onDelete,
  });

  final String itemName;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: 'Delete Product',
      icon: Icons.delete_outline,
      message:
          'Are you sure you want to delete "$itemName"? This action cannot be undone.',
      confirmText: 'Delete',
      confirmButtonColor: Colors.red,
      onConfirm: onDelete,
    );
  }
}
