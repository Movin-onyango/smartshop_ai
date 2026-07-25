import 'package:flutter/material.dart';

import '../../../core/theme/app_radius.dart';

/// ---------------------------------------------------------------------------
/// AppFormCard
/// ---------------------------------------------------------------------------
///
/// Standard card container used throughout SmartShop AI forms.
///
/// Used by:
/// • Product Form
/// • Supplier Form
/// • Customer Form
/// • Sales Form
/// • Expense Form
/// • Settings
///
/// Keeps all forms visually consistent.
///
/// ---------------------------------------------------------------------------
class AppFormCard extends StatelessWidget {
  const AppFormCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.margin = EdgeInsets.zero,
    this.elevation = 0,
    this.width,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double elevation;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      margin: margin,
      child: Card(
        elevation: elevation,
        color: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.35)),
        ),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
