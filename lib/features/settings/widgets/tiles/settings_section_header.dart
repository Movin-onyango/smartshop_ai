import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsSectionHeader
/// ---------------------------------------------------------------------------
///
/// Reusable section header used throughout the Settings module.
///
/// Example:
/// Settings
/// ----------------------
/// Configure your business profile.
/// ---------------------------------------------------------------------------
class SettingsSectionHeader extends StatelessWidget {
  const SettingsSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.padding = const EdgeInsets.only(bottom: 16),
  });

  final String title;

  final String? subtitle;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          if (subtitle != null) ...[
            const SizedBox(height: 4),

            Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}