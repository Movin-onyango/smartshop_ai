import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsDangerCard
/// ---------------------------------------------------------------------------
///
/// Displays destructive or irreversible actions.
///
/// Used for:
/// • Reset Settings
/// • Delete Backups
/// • Factory Reset
/// • Clear Database
/// • Remove Business Logo
/// ---------------------------------------------------------------------------
class SettingsDangerCard extends StatelessWidget {
  const SettingsDangerCard({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
    this.icon = Icons.warning_rounded,
    this.color = Colors.red,
  });

  final String title;

  final String message;

  final String buttonText;

  final VoidCallback onPressed;

  final IconData icon;

  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      color: color.withValues(alpha: .06),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: color.withValues(alpha: .15),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              message,
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 24),

            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: onPressed,
                style: FilledButton.styleFrom(
                  backgroundColor: color,
                ),
                icon: const Icon(Icons.delete_forever),
                label: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}