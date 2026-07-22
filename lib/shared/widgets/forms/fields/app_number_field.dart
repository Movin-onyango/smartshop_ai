import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ---------------------------------------------------------------------------
/// AppNumberField
/// ---------------------------------------------------------------------------
///
/// Standard numeric input for SmartShop AI.
///
/// Used by:
/// • Buying Price
/// • Selling Price
/// • Quantity
/// • Discount
/// • Expense Amount
/// • Tax
/// • Stock Adjustment
///
/// Supports:
/// • Integers
/// • Decimals
/// • Currency Prefix
/// • Prefix/Suffix Icons
/// ---------------------------------------------------------------------------
class AppNumberField extends StatelessWidget {
  const AppNumberField({
    super.key,
    required this.controller,
    required this.label,

    this.hint,
    this.icon,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.allowDecimal = true,
    this.prefixText,
    this.suffixText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
  });

  final TextEditingController controller;

  final String label;

  final String? hint;

  final IconData? icon;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;

  final bool allowDecimal;

  final String? prefixText;

  final String? suffixText;

  final bool enabled;

  final bool readOnly;

  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      keyboardType: TextInputType.numberWithOptions(
        decimal: allowDecimal,
      ),

      inputFormatters: [
        FilteringTextInputFormatter.allow(
          allowDecimal
              ? RegExp(r'^\d*\.?\d{0,2}')
              : RegExp(r'^\d*'),
        ),
      ],

      validator: validator,

      onChanged: onChanged,

      textInputAction: textInputAction,

      enabled: enabled,

      readOnly: readOnly,

      autofocus: autofocus,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        prefixIcon: icon == null
            ? null
            : Icon(icon),

        prefixText: prefixText,

        suffixText: suffixText,
      ),
    );
  }
}