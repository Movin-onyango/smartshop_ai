import 'package:flutter/material.dart';

import '../../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryCard
/// ---------------------------------------------------------------------------
///
/// Displays a summary of a category.
///
/// Responsibilities:
/// • Category icon
/// • Category name
/// • Description
/// • Tap callback
/// ---------------------------------------------------------------------------
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  final Category category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor:
                    category.colorValue.withValues(alpha: 0.15),
                child: Icon(
                  category.iconData,
                  color: category.colorValue,
                  size: 28,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 8),

              Expanded(
                child: Text(
                  category.hasDescription
                      ? category.description!
                      : 'No description available',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Icon(
                    category.iconData,
                    size: 18,
                    color: category.colorValue,
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      category.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}