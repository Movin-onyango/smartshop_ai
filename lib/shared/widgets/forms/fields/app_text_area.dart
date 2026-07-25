import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppTextArea
/// ---------------------------------------------------------------------------
///
/// Standard multi-line text input for SmartShop AI.
///
/// Used by:
/// • Product Description
/// • Product Notes
/// • Supplier Notes
/// • Customer Notes
/// • Expense Description
/// • Sales Remarks
///
/// ---------------------------------------------------------------------------
class AppTextArea extends StatelessWidget {
  const AppTextArea({
    super.key,
    required this.controller,
    required this.label,

    this.hint,
    this.icon,
    this.validator,
    this.onChanged,
    this.minLines = 4,
    this.maxLines = 6,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
    this.helperText,
  });

  final TextEditingController controller;

  final String label;

  final String? hint;

  final IconData? icon;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;

  final int minLines;

  final int maxLines;

  final bool enabled;

  final bool readOnly;

  final bool autofocus;

  final int? maxLength;

  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      validator: validator,

      onChanged: onChanged,

      enabled: enabled,

      readOnly: readOnly,

      autofocus: autofocus,

      minLines: minLines,

      maxLines: maxLines,

      maxLength: maxLength,

      keyboardType: TextInputType.multiline,

      textInputAction: TextInputAction.newline,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        helperText: helperText,

        alignLabelWithHint: true,

        prefixIcon: icon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Icon(icon),
              ),
      ),
    );
  }
}
