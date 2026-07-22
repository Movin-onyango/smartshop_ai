import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// CustomerSearchBar
/// ---------------------------------------------------------------------------
///
/// Reusable search widget for the Customer module.
///
/// Used by:
/// • Customer List Screen
/// • Customer Picker
/// • Customer Search
/// • Sales Customer Selection
/// ---------------------------------------------------------------------------
class CustomerSearchBar extends StatelessWidget {
  const CustomerSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search customers...',
  });

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}