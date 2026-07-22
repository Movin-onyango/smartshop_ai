import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppDropdownField(type T)
/// ---------------------------------------------------------------------------
///
/// Generic dropdown field for SmartShop AI.
///
/// Used by:
/// • Product Categories
/// • Suppliers
/// • Payment Methods
/// • User Roles
/// • Customer Types
/// • Expense Categories
/// • Units of Measure
///
/// ---------------------------------------------------------------------------
class AppDropdownField<T> extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,

    this.value,
    this.hint,
    this.icon,
    this.validator,
    this.enabled = true,
    this.isExpanded = true,
  });

  final String label;

  final T? value;

  final List<DropdownMenuItem<T>> items;

  final ValueChanged<T?> onChanged;

  final String? hint;

  final IconData? icon;

  final String? Function(T?)? validator;

  final bool enabled;

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,

      items: items,

      onChanged: enabled ? onChanged : null,

      validator: validator,

      isExpanded: isExpanded,

      decoration: InputDecoration(
        labelText: label,

        hintText: hint,

        prefixIcon: icon == null
            ? null
            : Icon(icon),
      ),
    );
  }
}