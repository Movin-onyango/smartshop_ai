import 'package:flutter/material.dart';

import '../../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryInformationSection
/// ---------------------------------------------------------------------------
///
/// Displays detailed information about the category.
///
/// Responsibilities:
/// • Category Name
/// • Description
/// • Creation Date
/// • Last Updated
/// ---------------------------------------------------------------------------
class CategoryInformationSection extends StatelessWidget {
  const CategoryInformationSection({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _InfoRow(
              label: 'Category Name',
              value: category.name,
            ),

            _InfoRow(
              label: 'Description',
              value: category.description?.isNotEmpty == true
                  ? category.description!
                  : '-',
            ),

            _InfoRow(
              label: 'Created',
              value: category.createdAt != null
                  ? category.createdAt.toString().split('.').first
                  : '-',
            ),

            _InfoRow(
              label: 'Last Updated',
              value: category.updatedAt != null
                  ? category.updatedAt.toString().split('.').first
                  : '-',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}