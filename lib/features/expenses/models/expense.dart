import 'expense_attachment.dart';
import 'expense_category.dart';
import 'expense_status.dart';

/// ---------------------------------------------------------------------------
/// Expense
/// ---------------------------------------------------------------------------
///
/// Represents a business expense.
///
/// Examples:
/// • Rent
/// • Electricity
/// • Salaries
/// • Fuel
/// • Internet
/// • Maintenance
/// ---------------------------------------------------------------------------
class Expense {
  const Expense({
    this.id,
    required this.expenseNumber,
    required this.title,
    required this.category,
    required this.amount,
    this.tax = 0,
    this.vendor,
    this.paymentMethod,
    required this.expenseDate,
    this.dueDate,
    this.paidDate,
    this.status = ExpenseStatus.draft,
    this.notes,
    this.attachment,
    this.createdAt,
    this.updatedAt,
  });

  //--------------------------------------------------------------------------
  // Identity
  //--------------------------------------------------------------------------

  final String? id;

  final String expenseNumber;

  //--------------------------------------------------------------------------
  // Information
  //--------------------------------------------------------------------------

  final String title;

  final ExpenseCategory category;

  final double amount;

  /// Percentage
  final double tax;

  final String? vendor;

  final String? paymentMethod;

  //--------------------------------------------------------------------------
  // Dates
  //--------------------------------------------------------------------------

  final DateTime expenseDate;

  final DateTime? dueDate;

  final DateTime? paidDate;

  //--------------------------------------------------------------------------
  // Status
  //--------------------------------------------------------------------------

  final ExpenseStatus status;

  //--------------------------------------------------------------------------
  // Extras
  //--------------------------------------------------------------------------

  final String? notes;

  final ExpenseAttachment? attachment;

  //--------------------------------------------------------------------------
  // Metadata
  //--------------------------------------------------------------------------

  final DateTime? createdAt;

  final DateTime? updatedAt;

  //--------------------------------------------------------------------------
  // Computed Values
  //--------------------------------------------------------------------------

  double get taxAmount {
    return amount * (tax / 100);
  }

  double get totalAmount {
    return amount + taxAmount;
  }

  bool get hasVendor {
    return vendor != null &&
        vendor!.trim().isNotEmpty;
  }

  bool get hasNotes {
    return notes != null &&
        notes!.trim().isNotEmpty;
  }

  bool get hasAttachment {
    return attachment != null;
  }

  bool get isPaid =>
      status == ExpenseStatus.paid;

  bool get isPending =>
      status == ExpenseStatus.pending;

  bool get isApproved =>
      status == ExpenseStatus.approved;

  bool get isDraft =>
      status == ExpenseStatus.draft;

  bool get isCancelled =>
      status == ExpenseStatus.cancelled;

  bool get isOverdue {
    if (dueDate == null) {
      return false;
    }

    return !isPaid &&
        DateTime.now().isAfter(dueDate!);
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  Expense copyWith({
    String? id,
    String? expenseNumber,
    String? title,
    ExpenseCategory? category,
    double? amount,
    double? tax,
    String? vendor,
    String? paymentMethod,
    DateTime? expenseDate,
    DateTime? dueDate,
    DateTime? paidDate,
    ExpenseStatus? status,
    String? notes,
    ExpenseAttachment? attachment,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Expense(
      id: id ?? this.id,
      expenseNumber:
          expenseNumber ??
              this.expenseNumber,
      title: title ?? this.title,
      category:
          category ?? this.category,
      amount: amount ?? this.amount,
      tax: tax ?? this.tax,
      vendor: vendor ?? this.vendor,
      paymentMethod:
          paymentMethod ??
              this.paymentMethod,
      expenseDate:
          expenseDate ??
              this.expenseDate,
      dueDate: dueDate ?? this.dueDate,
      paidDate:
          paidDate ?? this.paidDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      attachment:
          attachment ??
              this.attachment,
      createdAt:
          createdAt ?? this.createdAt,
      updatedAt:
          updatedAt ?? this.updatedAt,
    );
  }
}