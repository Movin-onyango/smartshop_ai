import 'package:flutter/foundation.dart';

/// ---------------------------------------------------------------------------
/// ExpenseStatistics
/// ---------------------------------------------------------------------------
///
/// Aggregated expense statistics used by:
///
/// • Dashboard
/// • Reports
/// • Analytics
/// ---------------------------------------------------------------------------
@immutable
class ExpenseStatistics {
  const ExpenseStatistics({
    this.totalExpenses = 0,
    this.draftExpenses = 0,
    this.pendingExpenses = 0,
    this.approvedExpenses = 0,
    this.paidExpenses = 0,
    this.cancelledExpenses = 0,
    this.totalAmount = 0,
    this.paidAmount = 0,
    this.pendingAmount = 0,
    this.averageExpense = 0,
    this.highestExpense = 0,
    this.monthlyTotal = 0,
  });

  //--------------------------------------------------------------------------
  // Counts
  //--------------------------------------------------------------------------

  final int totalExpenses;

  final int draftExpenses;

  final int pendingExpenses;

  final int approvedExpenses;

  final int paidExpenses;

  final int cancelledExpenses;

  //--------------------------------------------------------------------------
  // Financial
  //--------------------------------------------------------------------------

  final double totalAmount;

  final double paidAmount;

  final double pendingAmount;

  final double averageExpense;

  final double highestExpense;

  final double monthlyTotal;

  //--------------------------------------------------------------------------
  // Computed Properties
  //--------------------------------------------------------------------------

  bool get hasExpenses => totalExpenses > 0;

  bool get hasPendingExpenses => pendingExpenses > 0;

  bool get hasPaidExpenses => paidExpenses > 0;

  double get paymentRate {
    if (totalExpenses == 0) {
      return 0;
    }

    return (paidExpenses / totalExpenses) * 100;
  }

  double get approvalRate {
    if (totalExpenses == 0) {
      return 0;
    }

    return ((approvedExpenses + paidExpenses) /
            totalExpenses) *
        100;
  }

  //--------------------------------------------------------------------------
  // Copy
  //--------------------------------------------------------------------------

  ExpenseStatistics copyWith({
    int? totalExpenses,
    int? draftExpenses,
    int? pendingExpenses,
    int? approvedExpenses,
    int? paidExpenses,
    int? cancelledExpenses,
    double? totalAmount,
    double? paidAmount,
    double? pendingAmount,
    double? averageExpense,
    double? highestExpense,
    double? monthlyTotal,
  }) {
    return ExpenseStatistics(
      totalExpenses:
          totalExpenses ?? this.totalExpenses,
      draftExpenses:
          draftExpenses ?? this.draftExpenses,
      pendingExpenses:
          pendingExpenses ?? this.pendingExpenses,
      approvedExpenses:
          approvedExpenses ?? this.approvedExpenses,
      paidExpenses:
          paidExpenses ?? this.paidExpenses,
      cancelledExpenses:
          cancelledExpenses ??
              this.cancelledExpenses,
      totalAmount:
          totalAmount ?? this.totalAmount,
      paidAmount:
          paidAmount ?? this.paidAmount,
      pendingAmount:
          pendingAmount ?? this.pendingAmount,
      averageExpense:
          averageExpense ??
              this.averageExpense,
      highestExpense:
          highestExpense ??
              this.highestExpense,
      monthlyTotal:
          monthlyTotal ?? this.monthlyTotal,
    );
  }
}