import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ClearNotificationsDialog
/// ---------------------------------------------------------------------------
///
/// Confirmation dialog before clearing all notifications.
///
/// Used by:
/// • NotificationsScreen
/// ---------------------------------------------------------------------------
class ClearNotificationsDialog extends StatelessWidget {
  const ClearNotificationsDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Clear Notifications',
      ),
      content: const Text(
        'Are you sure you want to permanently clear all notifications? '
        'This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
          ),
        ),
        FilledButton.icon(
          onPressed: () {
            Navigator.of(context).pop();

            onConfirm();
          },
          icon: const Icon(
            Icons.delete_forever,
          ),
          label: const Text(
            'Clear',
          ),
        ),
      ],
    );
  }

  /// -------------------------------------------------------------------------
  /// Helper
  /// -------------------------------------------------------------------------
  ///
  /// Displays the dialog.
  /// -------------------------------------------------------------------------
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => ClearNotificationsDialog(
        onConfirm: onConfirm,
      ),
    );
  }
}