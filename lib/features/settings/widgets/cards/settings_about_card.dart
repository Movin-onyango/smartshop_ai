import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsAboutCard
/// ---------------------------------------------------------------------------
///
/// Displays application information.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class SettingsAboutCard extends StatelessWidget {
  const SettingsAboutCard({
    super.key,
    required this.appName,
    required this.version,
    this.buildNumber,
    this.copyright,
  });

  final String appName;

  final String version;

  final String? buildNumber;

  final String? copyright;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.info_outline,
              size: 42,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 16),

            Text(
              appName,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Version $version',
              style: theme.textTheme.bodyMedium,
            ),

            if (buildNumber != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Build $buildNumber',
                  style: theme.textTheme.bodySmall,
                ),
              ),

            if (copyright != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  copyright!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}