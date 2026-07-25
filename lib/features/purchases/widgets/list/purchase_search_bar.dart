import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseSearchBar
/// ---------------------------------------------------------------------------
///
/// Search field for filtering purchases.
///
/// Used by:
/// • PurchaseListScreen
/// ---------------------------------------------------------------------------
class PurchaseSearchBar extends StatelessWidget {
  const PurchaseSearchBar({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search purchases...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
