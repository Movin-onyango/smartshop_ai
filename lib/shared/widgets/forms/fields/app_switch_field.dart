import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppSwitchField
/// ---------------------------------------------------------------------------
///
/// Standard switch/toggle field for SmartShop AI.
///
/// Used by:
/// • Track Expiry
/// • Active Product
/// • Allow Discounts
/// • Notify Low Stock
/// • Enable Notifications
/// • Auto Backup
/// • Dark Mode
///
/// ---------------------------------------------------------------------------
class AppSwitchField extends StatelessWidget {
  const AppSwitchField({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,

    this.subtitle,
    this.enabled = true,
    this.secondary,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  });

  final String title;

  final String? subtitle;

  final bool value;

  final ValueChanged<bool> onChanged;

  final bool enabled;

  final Widget? secondary;

  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SwitchListTile(
      value: value,

      onChanged: enabled ? onChanged : null,

      contentPadding: contentPadding,

      secondary: secondary,

      title: Text(
        title,
        style: theme.textTheme.titleMedium,
      ),

      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              style: theme.textTheme.bodyMedium,
            ),

      activeThumbColor: theme.colorScheme.primary,
    );
  }
}