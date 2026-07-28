import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsColorTile
/// ---------------------------------------------------------------------------
///
/// A reusable tile for selecting and displaying colors.
///
/// Used for:
/// • Brand Color
/// • Accent Color
/// • Receipt Theme Color
/// • Primary App Color
/// ---------------------------------------------------------------------------
class SettingsColorTile extends StatelessWidget {
  const SettingsColorTile({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    this.subtitle,
    this.leading,
    this.enabled = true,
  });

  final String title;

  final String? subtitle;

  final IconData? leading;

  final Color color;

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
            : Icon(leading),
        title: Text(title),
        subtitle: subtitle == null
            ? null
            : Text(subtitle!),
        trailing: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade400,
            ),
          ),
        ),
        onTap: enabled ? onTap : null,
      ),
    );
  }
}