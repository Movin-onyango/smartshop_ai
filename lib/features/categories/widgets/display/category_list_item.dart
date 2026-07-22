import 'package:flutter/material.dart';

import '../../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryListItem
/// ---------------------------------------------------------------------------
///
/// Displays a category in list format.
///
/// Responsibilities:
/// • Display category icon
/// • Display category information
/// • View action
/// • Edit action
/// • Delete action
/// ---------------------------------------------------------------------------
class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  final Category category;

  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        leading: CircleAvatar(
          backgroundColor:
              category.colorValue.withValues(alpha: 0.15),
          child: Icon(
            category.iconData,
            color: category.colorValue,
          ),
        ),

        title: Text(
          category.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        subtitle: category.hasDescription
            ? Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  category.description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,

        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'view':
                onView();
                break;

              case 'edit':
                onEdit();
                break;

              case 'delete':
                onDelete();
                break;
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'view',
              child: Text('View'),
            ),
            PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
        ),

        onTap: onView,
      ),
    );
  }
}