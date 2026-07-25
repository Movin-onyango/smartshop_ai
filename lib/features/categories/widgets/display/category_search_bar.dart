import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/features/categories/providers/category_provider.dart';

/// ---------------------------------------------------------------------------
/// CategorySearchBar
/// ---------------------------------------------------------------------------
///
/// Searches categories by:
/// • Name
/// • Description
///
/// Updates the CategoryProvider as the user types.
/// ---------------------------------------------------------------------------
class CategorySearchBar extends StatelessWidget {
  const CategorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search categories...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: (value) {
        context.read<CategoryProvider>().searchCategories(value);
      },
    );
  }
}
