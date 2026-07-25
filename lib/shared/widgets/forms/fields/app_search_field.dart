import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppSearchField
/// ---------------------------------------------------------------------------
///
/// Standard search field for SmartShop AI.
///
/// Used by:
/// • Products
/// • Customers
/// • Suppliers
/// • Inventory
/// • Sales
/// • Expenses
/// • Reports
///
/// ---------------------------------------------------------------------------
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.controller,
    required this.onChanged,

    this.hint = 'Search...',
    this.onClear,
    this.onSubmitted,
    this.autofocus = false,
    this.enabled = true,
    this.showClearButton = true,
  });

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  final ValueChanged<String>? onSubmitted;

  final VoidCallback? onClear;

  final String hint;

  final bool autofocus;

  final bool enabled;

  final bool showClearButton;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      autofocus: autofocus,

      enabled: enabled,

      textInputAction: TextInputAction.search,

      onChanged: onChanged,

      onSubmitted: onSubmitted,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: const Icon(Icons.search),

        suffixIcon: showClearButton
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                  onClear?.call();
                },
              )
            : null,
      ),
    );
  }
}
