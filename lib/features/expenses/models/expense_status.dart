/// ---------------------------------------------------------------------------
/// ExpenseStatus
/// ---------------------------------------------------------------------------
///
/// Represents the current state of an expense.
///
/// Lifecycle:
///
/// Draft
///   ↓
/// Pending
///   ↓
/// Approved
///   ↓
/// Paid
///
/// Draft/Pending/Approved
///   ↓
/// Cancelled
/// ---------------------------------------------------------------------------
enum ExpenseStatus { draft, pending, approved, paid, cancelled }

extension ExpenseStatusExtension on ExpenseStatus {
  /// User-friendly label.
  String get label {
    switch (this) {
      case ExpenseStatus.draft:
        return 'Draft';

      case ExpenseStatus.pending:
        return 'Pending';

      case ExpenseStatus.approved:
        return 'Approved';

      case ExpenseStatus.paid:
        return 'Paid';

      case ExpenseStatus.cancelled:
        return 'Cancelled';
    }
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  bool get isDraft => this == ExpenseStatus.draft;

  bool get isPending => this == ExpenseStatus.pending;

  bool get isApproved => this == ExpenseStatus.approved;

  bool get isPaid => this == ExpenseStatus.paid;

  bool get isCancelled => this == ExpenseStatus.cancelled;

  bool get canEdit =>
      this == ExpenseStatus.draft || this == ExpenseStatus.pending;

  bool get canApprove => this == ExpenseStatus.pending;

  bool get canMarkAsPaid => this == ExpenseStatus.approved;

  bool get canCancel =>
      this != ExpenseStatus.paid && this != ExpenseStatus.cancelled;
}
