import '../repositories/financial_report_repository.dart';
import 'base/base_report_getters.dart';
import 'base/report_formatter.dart';

/// ---------------------------------------------------------------------------
/// FinancialReportGetters
/// ---------------------------------------------------------------------------
///
/// Aggregates financial data from sales, expenses and purchases.
/// ---------------------------------------------------------------------------
class FinancialReportGetters extends BaseReportGetters {
  const FinancialReportGetters();

  static double totalRevenue(FinancialReportRepository repository) {
    return repository.sales.sales.fold(0.0, (sum, sale) => sum + sale.subtotal);
  }

  static double totalExpenses(FinancialReportRepository repository) {
    return repository.expenses.getAllExpenses().fold(
      0.0,
      (sum, expense) => sum + expense.totalAmount,
    );
  }

  static double totalPurchases(FinancialReportRepository repository) {
    return repository.purchases.getAllPurchases().fold(
      0.0,
      (sum, purchase) => sum + purchase.grandTotal,
    );
  }

  static double netProfit(FinancialReportRepository repository) {
    return totalRevenue(repository) - totalExpenses(repository);
  }

  static List<List<String>> tableRows(FinancialReportRepository repository) {
    return [
      ['Revenue', ReportFormatter.currency(totalRevenue(repository))],
      ['Expenses', ReportFormatter.currency(totalExpenses(repository))],
      ['Purchases', ReportFormatter.currency(totalPurchases(repository))],
      ['Net Profit', ReportFormatter.currency(netProfit(repository))],
    ];
  }
}
