import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsDropdownTile
/// ---------------------------------------------------------------------------
///
/// A reusable dropdown tile for selecting a value from a list.
///
/// Used for:
/// • Currency
/// • Theme
/// • Language
/// • Tax Rate
/// • Backup Frequency
/// • Receipt Paper Size
/// ---------------------------------------------------------------------------
class SettingsDropdownTile<T> extends StatelessWidget {
  const SettingsDropdownTile({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
    this.subtitle,
    this.leading,
    this.enabled = true,
  });

  final String title;

  final String? subtitle;

  final IconData? leading;

  final T value;

  final List<DropdownMenuItem<T>> items;

  final ValueChanged<T?>? onChanged;

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
        trailing: SizedBox(
          width: 180,
          child: DropdownButtonFormField<T>(
            initialValue: value,
            items: items,
            onChanged: enabled ? onChanged : null,
            isExpanded: true,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}