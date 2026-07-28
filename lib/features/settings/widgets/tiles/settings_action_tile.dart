import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsActionTile
/// ---------------------------------------------------------------------------
///
/// A reusable action tile used for executing settings actions.
///
/// Examples:
/// • Backup Now
/// • Restore Backup
/// • Export Settings
/// • Import Settings
/// • Reset Settings
/// • Check for Updates
/// • Clear Cache
/// ---------------------------------------------------------------------------
class SettingsActionTile extends StatelessWidget {
  const SettingsActionTile({
    super.key,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.trailing,
    this.textColor,
    this.enabled = true,
  });

  final String title;

  final String? subtitle;

  final IconData? leading;

  final Widget? trailing;

  final VoidCallback? onTap;

  final Color? textColor;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = textColor ??
        (enabled
            ? theme.colorScheme.primary
            : theme.disabledColor);

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
                color: color,
              ),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
            ),
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: color,
            ),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}