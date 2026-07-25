import 'package:flutter/material.dart';

import '../widgets/dialogs/discard_changes_dialog.dart';

class NavigationGuard {
  NavigationGuard._();

  static Future<bool> confirmDiscard(
    BuildContext context,
    bool hasUnsavedChanges,
  ) async {
    if (!hasUnsavedChanges) return true;

    bool shouldLeave = false;

    await showDialog(
      context: context,
      builder: (_) => DiscardChangesDialog(
        onDiscard: () {
          shouldLeave = true;
        },
      ),
    );

    return shouldLeave;
  }
}
