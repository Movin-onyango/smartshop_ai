import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// NotificationFilterSection
/// ---------------------------------------------------------------------------
///
/// Displays notification filters.
///
/// Used by:
/// • NotificationsScreen
/// ---------------------------------------------------------------------------
class NotificationFilterSection extends StatelessWidget {
  const NotificationFilterSection({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  final String selectedFilter;

  final ValueChanged<String> onFilterChanged;

  static const List<String> filters = [
    'All',
    'Unread',
    'Read',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: filters.map(
        (filter) {
          final selected =
              filter == selectedFilter;

          return FilterChip(
            label: Text(filter),
            selected: selected,
            onSelected: (_) {
              onFilterChanged(filter);
            },
          );
        },
      ).toList(),
    );
  }
}