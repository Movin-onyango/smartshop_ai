import 'expense_report_repository.dart';
import 'purchase_report_repository.dart';
import 'sales_report_repository.dart';

class FinancialReportRepository {
  const FinancialReportRepository({
    this.sales = const SalesReportRepository(),
    this.expenses = const ExpenseReportRepository(),
    this.purchases = const PurchaseReportRepository(),
  });

  final SalesReportRepository sales;
  final ExpenseReportRepository expenses;
  final PurchaseReportRepository purchases;
}
