import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppSectionTitle
/// ---------------------------------------------------------------------------
///
/// Standard title widget for form sections.
///
/// Used by:
/// • Products
/// • Suppliers
/// • Customers
/// • Sales
/// • Expenses
/// • Settings
///
/// Supports an optional subtitle for additional context.
/// ---------------------------------------------------------------------------
class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              if (subtitle != null) ...[
                const SizedBox(height: 6),

                Text(
                  subtitle!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),

        if (trailing != null) ...[
          const SizedBox(width: 16),
          trailing!,
        ],
      ],
    );
  }
}