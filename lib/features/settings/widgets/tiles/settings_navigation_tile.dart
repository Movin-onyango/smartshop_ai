import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsNavigationTile
/// ---------------------------------------------------------------------------
///
/// A reusable navigation tile used throughout the Settings module.
///
/// Used for:
/// • Business Settings
/// • Currency Settings
/// • Tax Settings
/// • Appearance
/// • Backup
/// • Security
/// ---------------------------------------------------------------------------
class SettingsNavigationTile extends StatelessWidget {
  const SettingsNavigationTile({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.enabled = true,
  });

  final String title;

  final String? subtitle;

  final IconData? leading;

  final Widget? trailing;

  final VoidCallback? onTap;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
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
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
              ),
        trailing: trailing ??
            const Icon(
              Icons.chevron_right,
            ),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}