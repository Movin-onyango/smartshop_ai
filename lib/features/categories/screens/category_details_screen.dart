import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/category_provider.dart';
import '../widgets/details/category_header.dart';
import '../widgets/details/category_information_section.dart';
import '../widgets/details/category_statistics_section.dart';

/// ---------------------------------------------------------------------------
/// CategoryDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays the complete details of a category.
///
/// Responsibilities:
/// • Display category information
/// • Show statistics
/// • Navigate to Edit
/// • Delete category
/// ---------------------------------------------------------------------------
class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoryProvider>();

    final category = provider.findById(categoryId);

    if (category == null) {
      return const Scaffold(body: Center(child: Text('Category not found')));
    }

    return SmartScaffold(
      title: 'Category Details',
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () {
            context.push('${AppRoutes.categories}/${category.id}/edit');
          },
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryHeader(category: category),

            const SizedBox(height: 24),

            CategoryInformationSection(category: category),

            const SizedBox(height: 24),

            CategoryStatisticsSection(category: category),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: () {
                context.push('${AppRoutes.categories}/${category.id}/edit');
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Category'),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () async {
                final confirmed =
                    await showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Category'),
                          content: const Text(
                            'Are you sure you want to delete this category?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;

                if (!confirmed) return;

                provider.deleteCategory(category.id!);

                if (context.mounted) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete Category'),
            ),
          ],
        ),
      ),
    );
  }
}
