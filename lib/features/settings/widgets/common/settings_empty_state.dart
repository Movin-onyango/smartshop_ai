import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsEmptyState
/// ---------------------------------------------------------------------------
///
/// Displayed when there are no settings or data available.
/// ---------------------------------------------------------------------------
class SettingsEmptyState extends StatelessWidget {
  const SettingsEmptyState({
    super.key,
    this.title = 'Nothing to display',
    this.message = 'No settings available.',
    this.icon = Icons.settings_outlined,
  });

  final String title;

  final String message;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 72,
              color: Colors.grey,
            ),

            const SizedBox(height: 20),

            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}