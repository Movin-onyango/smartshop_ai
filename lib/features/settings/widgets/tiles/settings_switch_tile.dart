import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsSwitchTile
/// ---------------------------------------------------------------------------
///
/// A reusable switch tile for boolean settings.
///
/// Used for:
/// • Notifications
/// • Auto Backup
/// • Dark Mode
/// • Biometric Login
/// • VAT Enabled
/// • Receipt Printing
/// • Inventory Alerts
/// ---------------------------------------------------------------------------
class SettingsSwitchTile extends StatelessWidget {
  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.enabled = true,
  });

  final String title;

  final String? subtitle;

  final IconData? leading;

  final bool value;

  final ValueChanged<bool>? onChanged;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: SwitchListTile(
        secondary: leading == null
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
        value: value,
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}