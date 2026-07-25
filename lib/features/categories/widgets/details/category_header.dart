import 'package:flutter/material.dart';

import '../../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryHeader
/// ---------------------------------------------------------------------------
///
/// Displays the primary information about a category.
///
/// Responsibilities:
/// • Icon
/// • Name
/// • Description
/// ---------------------------------------------------------------------------
class CategoryHeader extends StatelessWidget {
  const CategoryHeader({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 34,
              child: Text(
                category.name.isNotEmpty ? category.name[0].toUpperCase() : '?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    category.description?.isNotEmpty == true
                        ? category.description!
                        : 'No description available.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
