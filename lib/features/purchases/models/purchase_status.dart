/// ---------------------------------------------------------------------------
/// PurchaseStatus
/// ---------------------------------------------------------------------------
///
/// Lifecycle of a purchase order.
///
/// Draft
/// ↓
/// Pending Approval
/// ↓
/// Ordered
/// ↓
/// Partially Received
/// ↓
/// Received
///
/// A purchase can also be Cancelled from most states.
/// ---------------------------------------------------------------------------
enum PurchaseStatus {
  draft,
  pendingApproval,
  ordered,
  partial,
  received,
  cancelled,
}

/// ---------------------------------------------------------------------------
/// PurchaseStatusExtension
/// ---------------------------------------------------------------------------
///
/// Human-readable labels and helper properties.
/// ---------------------------------------------------------------------------
extension PurchaseStatusExtension on PurchaseStatus {
  String get label {
    switch (this) {
      case PurchaseStatus.draft:
        return 'Draft';

      case PurchaseStatus.pendingApproval:
        return 'Pending Approval';

      case PurchaseStatus.ordered:
        return 'Ordered';

      case PurchaseStatus.partial:
        return 'Partially Received';

      case PurchaseStatus.received:
        return 'Received';

      case PurchaseStatus.cancelled:
        return 'Cancelled';
    }
  }

  bool get isOpen {
    switch (this) {
      case PurchaseStatus.draft:
      case PurchaseStatus.pendingApproval:
      case PurchaseStatus.ordered:
      case PurchaseStatus.partial:
        return true;

      case PurchaseStatus.received:
      case PurchaseStatus.cancelled:
        return false;
    }
  }

  bool get isCompleted {
    return this == PurchaseStatus.received;
  }

  bool get isCancelled {
    return this == PurchaseStatus.cancelled;
  }

  bool get canReceive {
    return this == PurchaseStatus.ordered || this == PurchaseStatus.partial;
  }
}
