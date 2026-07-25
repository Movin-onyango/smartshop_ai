import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppFormActions
/// ---------------------------------------------------------------------------
///
/// Standard action buttons displayed at the bottom of forms.
///
/// Used by:
/// • Product Form
/// • Supplier Form
/// • Customer Form
/// • Sales Form
/// • Expense Form
/// • Settings
///
/// Provides:
/// • Primary action button
/// • Optional secondary action button
/// • Responsive layout
/// ---------------------------------------------------------------------------
class AppFormActions extends StatelessWidget {
  const AppFormActions({
    super.key,
    required this.primaryLabel,
    required this.primaryIcon,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.secondaryIcon,
    this.onSecondaryPressed,
    this.spacing = 16,
  });

  final String primaryLabel;
  final IconData primaryIcon;
  final VoidCallback onPrimaryPressed;

  final String? secondaryLabel;
  final IconData? secondaryIcon;
  final VoidCallback? onSecondaryPressed;

  final double spacing;

  @override
  Widget build(BuildContext context) {
    final hasSecondary =
        secondaryLabel != null &&
        secondaryIcon != null &&
        onSecondaryPressed != null;

    return Row(
      children: [
        if (hasSecondary)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onSecondaryPressed,
              icon: Icon(secondaryIcon),
              label: Text(secondaryLabel!),
            ),
          ),

        if (hasSecondary) SizedBox(width: spacing),

        Expanded(
          child: FilledButton.icon(
            onPressed: onPrimaryPressed,
            icon: Icon(primaryIcon),
            label: Text(primaryLabel),
          ),
        ),
      ],
    );
  }
}
