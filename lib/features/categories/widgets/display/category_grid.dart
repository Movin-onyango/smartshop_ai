import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/app/router/app_routes.dart';

import '/features/categories/providers/category_provider.dart';
import 'category_card.dart';
import 'empty_categories.dart';

/// ---------------------------------------------------------------------------
/// CategoryGrid
/// ---------------------------------------------------------------------------
///
/// Displays all categories in a responsive grid.
///
/// Layout:
/// • Mobile  -> 1 column
/// • Tablet  -> 2 columns
/// • Desktop -> 3–4 columns
/// ---------------------------------------------------------------------------
class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        final categories = provider.categories;

        if (categories.isEmpty) {
          return const EmptyCategories();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int columns = 1;

            if (constraints.maxWidth >= 1200) {
              columns = 4;
            } else if (constraints.maxWidth >= 900) {
              columns = 3;
            } else if (constraints.maxWidth >= 600) {
              columns = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];

                return CategoryCard(
                  category: category,
                  onTap: () {
                    context.push(
                      '${AppRoutes.categories}/${category.id}',
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}