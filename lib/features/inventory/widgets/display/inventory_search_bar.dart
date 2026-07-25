import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/inventory_provider.dart';

/// ---------------------------------------------------------------------------
/// InventorySearchBar
/// ---------------------------------------------------------------------------
///
/// Allows users to quickly search inventory by:
/// • Product name
/// • Category
///
/// The search updates the inventory list in real time.
/// ---------------------------------------------------------------------------
class InventorySearchBar extends StatelessWidget {
  const InventorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search inventory...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
      ),
      onChanged: (value) {
        context.read<InventoryProvider>().searchInventory(value);
      },
    );
  }
}
