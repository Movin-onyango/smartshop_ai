import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppTextField
/// ---------------------------------------------------------------------------
///
/// Standard text field for SmartShop AI.
///
/// Used by:
/// • Product Name
/// • Supplier Name
/// • Customer Name
/// • Email
/// • Barcode
/// • Username
/// • Shop Name
/// • Search (optional)
///
/// ---------------------------------------------------------------------------
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,

    this.hint,
    this.icon,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixText,
    this.autofocus = false,
  });

  final TextEditingController controller;

  final String label;

  final String? hint;

  final IconData? icon;

  final String? Function(String?)? validator;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onTap;

  final bool readOnly;

  final bool enabled;

  final int maxLines;

  final int? minLines;

  final bool obscureText;

  final Widget? suffixIcon;

  final String? prefixText;

  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      validator: validator,

      keyboardType: keyboardType,

      textInputAction: textInputAction,

      onChanged: onChanged,

      onTap: onTap,

      readOnly: readOnly,

      enabled: enabled,

      maxLines: maxLines,

      minLines: minLines,

      obscureText: obscureText,

      autofocus: autofocus,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        prefixIcon: icon == null ? null : Icon(icon),

        prefixText: prefixText,

        suffixIcon: suffixIcon,
      ),
    );
  }
}
