import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsHeaderCard
/// ---------------------------------------------------------------------------
///
/// Displays the business summary at the top of the Settings page.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class SettingsHeaderCard extends StatelessWidget {
  const SettingsHeaderCard({
    super.key,
    required this.businessName,
    required this.ownerName,
    required this.phone,
    this.logo,
  });

  final String businessName;
  final String ownerName;
  final String phone;
  final ImageProvider<Object>? logo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: logo,
              child: logo == null
                  ? const Icon(
                      Icons.store,
                      size: 32,
                    )
                  : null,
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    businessName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  if (ownerName.isNotEmpty)
                    Text(
                      ownerName,
                      style: theme.textTheme.bodyMedium,
                    ),

                  if (phone.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        phone,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Icon(
              Icons.settings,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}