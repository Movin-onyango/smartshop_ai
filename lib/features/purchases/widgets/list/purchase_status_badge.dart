import 'package:flutter/material.dart';

import '../../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseStatusBadge
/// ---------------------------------------------------------------------------
///
/// Reusable purchase status badge.
///
/// Used by:
/// • Purchase List
/// • Purchase Details
/// • Dashboard
/// • Reports
/// ---------------------------------------------------------------------------
class PurchaseStatusBadge extends StatelessWidget {
  const PurchaseStatusBadge({super.key, required this.status});

  final PurchaseStatus status;

  @override
  Widget build(BuildContext context) {
    final color = _statusColor(status);

    return Chip(
      avatar: Icon(_statusIcon(status), size: 18, color: color),
      label: Text(
        status.label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
      backgroundColor: color.withValues(alpha: 0.15),
      side: BorderSide(color: color.withValues(alpha: 0.30)),
      visualDensity: VisualDensity.compact,
    );
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  Color _statusColor(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.draft:
        return Colors.grey;

      case PurchaseStatus.pendingApproval:
        return Colors.orange;

      case PurchaseStatus.ordered:
        return Colors.blue;

      case PurchaseStatus.partial:
        return Colors.deepOrange;

      case PurchaseStatus.received:
        return Colors.green;

      case PurchaseStatus.cancelled:
        return Colors.red;
    }
  }

  IconData _statusIcon(PurchaseStatus status) {
    switch (status) {
      case PurchaseStatus.draft:
        return Icons.edit_document;

      case PurchaseStatus.pendingApproval:
        return Icons.pending_actions;

      case PurchaseStatus.ordered:
        return Icons.shopping_bag;

      case PurchaseStatus.partial:
        return Icons.local_shipping;

      case PurchaseStatus.received:
        return Icons.check_circle;

      case PurchaseStatus.cancelled:
        return Icons.cancel;
    }
  }
}
