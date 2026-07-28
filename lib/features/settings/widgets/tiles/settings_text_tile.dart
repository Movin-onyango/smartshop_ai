import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsTextTile
/// ---------------------------------------------------------------------------
///
/// A reusable tile for displaying editable text-based settings.
///
/// Used for:
/// • Business Name
/// • Owner Name
/// • Phone Number
/// • Email Address
/// • Tax PIN
/// • Receipt Footer
/// • Backup Location
/// ---------------------------------------------------------------------------
class SettingsTextTile extends StatelessWidget {
  const SettingsTextTile({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.enabled = true,
    this.maxLines = 1,
  });

  final String title;

  final String value;

  final String? subtitle;

  final IconData? leading;

  final Widget? trailing;

  final VoidCallback? onTap;

  final bool enabled;

  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: ListTile(
        enabled: enabled,
        leading: leading == null
            ? null
            : Icon(
                leading,
              ),
        title: Text(
          title,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value.isEmpty ? 'Not set' : value,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: theme.textTheme.bodySmall,
              ),
            ],
          ],
        ),
        trailing: trailing ??
            const Icon(
              Icons.edit_outlined,
            ),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}