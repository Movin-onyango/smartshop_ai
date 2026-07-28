import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsPageHeader
/// ---------------------------------------------------------------------------
///
/// Standard page header for all Settings screens.
/// ---------------------------------------------------------------------------
class SettingsPageHeader extends StatelessWidget {
  const SettingsPageHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          if (subtitle != null) ...[
            const SizedBox(height: 8),

            Text(
              subtitle!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}