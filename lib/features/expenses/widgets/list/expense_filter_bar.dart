import 'package:flutter/material.dart';

import '../../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpenseFilterBar
/// ---------------------------------------------------------------------------
///
/// Horizontal filter chips.
///
/// Used by:
/// • ExpenseListScreen
/// ---------------------------------------------------------------------------
class ExpenseFilterBar extends StatelessWidget {
  const ExpenseFilterBar({
    super.key,
    required this.selectedStatus,
    required this.onChanged,
  });

  /// Null means "All"
  final ExpenseStatus? selectedStatus;

  final ValueChanged<ExpenseStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          //--------------------------------------------------------------------
          // All
          //--------------------------------------------------------------------

          Padding(
            padding:
                const EdgeInsets.only(
              right: 8,
            ),
            child: ChoiceChip(
              label: const Text('All'),
              selected:
                  selectedStatus == null,
              onSelected: (_) {
                onChanged(null);
              },
            ),
          ),

          //--------------------------------------------------------------------
          // Statuses
          //--------------------------------------------------------------------

          ...ExpenseStatus.values.map(
            (status) {
              return Padding(
                padding:
                    const EdgeInsets.only(
                  right: 8,
                ),
                child: ChoiceChip(
                  label: Text(
                    status.label,
                  ),
                  selected:
                      selectedStatus ==
                          status,
                  onSelected: (_) {
                    onChanged(status);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}