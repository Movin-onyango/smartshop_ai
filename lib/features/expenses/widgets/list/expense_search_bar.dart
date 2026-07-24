import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ExpenseSearchBar
/// ---------------------------------------------------------------------------
///
/// Search field for filtering expenses.
///
/// Used by:
/// • ExpenseListScreen
/// ---------------------------------------------------------------------------
class ExpenseSearchBar extends StatelessWidget {
  const ExpenseSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;

  final ValueChanged<String> onChanged;

  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: 'Search expenses...',
      leading: const Icon(Icons.search),
      trailing: [
        if (controller.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller.clear();
              onClear();
            },
          ),
      ],
      onChanged: onChanged,
    );
  }
}