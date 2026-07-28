import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsSaveButton
/// ---------------------------------------------------------------------------
///
/// Primary save button used across all settings screens.
/// ---------------------------------------------------------------------------
class SettingsSaveButton extends StatelessWidget {
  const SettingsSaveButton({
    super.key,
    required this.onPressed,
    this.text = 'Save Changes',
    this.icon = Icons.save,
  });

  final VoidCallback? onPressed;

  final String text;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }
}