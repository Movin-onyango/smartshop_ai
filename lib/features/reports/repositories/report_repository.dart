import 'customer_report_repository.dart';
import 'expense_report_repository.dart';
import 'financial_report_repository.dart';
import 'inventory_report_repository.dart';
import 'purchase_report_repository.dart';
import 'sales_report_repository.dart';
import 'supplier_report_repository.dart';

class ReportRepository {
  const ReportRepository({
    this.sales = const SalesReportRepository(),
    this.inventory = const InventoryReportRepository(),
    this.purchases = const PurchaseReportRepository(),
    this.expenses = const ExpenseReportRepository(),
    this.customers = const CustomerReportRepository(),
    this.suppliers = const SupplierReportRepository(),
    this.financial = const FinancialReportRepository(),
  });

  final SalesReportRepository sales;

  final InventoryReportRepository inventory;

  final PurchaseReportRepository purchases;

  final ExpenseReportRepository expenses;

  final CustomerReportRepository customers;

  final SupplierReportRepository suppliers;

  final FinancialReportRepository financial;
}
