import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';

/// ---------------------------------------------------------------------------
/// EmptyCategories
/// ---------------------------------------------------------------------------
///
/// Displayed when no categories exist.
///
/// Encourages the user to create their first category.
/// ---------------------------------------------------------------------------
class EmptyCategories extends StatelessWidget {
  const EmptyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.category_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: 24),

            Text(
              'No Categories Yet',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              'Create your first product category to organize your inventory.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: () {
                context.push(AppRoutes.addCategory);
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Category'),
            ),
          ],
        ),
      ),
    );
  }
}