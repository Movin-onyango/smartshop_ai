import 'package:flutter/material.dart';

import '../../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseFilterBar
/// ---------------------------------------------------------------------------
///
/// Status filter for purchases.
///
/// Used by:
/// • PurchaseListScreen
/// ---------------------------------------------------------------------------
class PurchaseFilterBar extends StatelessWidget {
  const PurchaseFilterBar({
    super.key,
    required this.selectedStatus,
    required this.onChanged,
  });

  final PurchaseStatus? selectedStatus;

  final ValueChanged<PurchaseStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildChip(
            context,
            label: 'All',
            selected: selectedStatus == null,
            onTap: () => onChanged(null),
          ),

          const SizedBox(width: 8),

          ...PurchaseStatus.values.map(
            (status) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildChip(
                context,
                label: _label(status),
                selected: selectedStatus == status,
                onTap: () => onChanged(status),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }

  String _label(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.draft:
        return 'Draft';

      case PurchaseStatus.pendingApproval:
        return 'Draft';

      case PurchaseStatus.ordered:
        return 'Ordered';

      case PurchaseStatus.partial:
        return 'Partial';

      case PurchaseStatus.received:
        return 'Received';

      case PurchaseStatus.cancelled:
        return 'Cancelled';
    }
  }
}
