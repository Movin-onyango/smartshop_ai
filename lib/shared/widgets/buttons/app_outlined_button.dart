import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';

/// Secondary outlined button.
class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (icon != null) {
      child = Row(
        mainAxisSize:
            expand ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          AppSpacing.gapHorizontalSM,
          Text(label),
        ],
      );
    } else {
      child = Text(label);
    }

    final button = OutlinedButton(
      onPressed: onPressed,
      child: child,
    );

    if (!expand) {
      return button;
    }

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }
}