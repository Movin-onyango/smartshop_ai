import 'package:flutter/material.dart';

import '../controllers/report_controllers.dart';
import '../repositories/report_repository.dart';
import 'report_state.dart';

class ReportProvider extends ChangeNotifier {
  ReportProvider({
    ReportRepository? repository,
  }) : repository =
            repository ??
            const ReportRepository() {
    _sales =
        SalesReportController(this.repository);

    _inventory =
        InventoryReportController(this.repository);

    _purchases =
        PurchaseReportController(this.repository);

    _expenses =
        ExpenseReportController(this.repository);

    _customers =
        CustomerReportController(this.repository);

    _suppliers =
        SupplierReportController(this.repository);

    _financial =
        FinancialReportController(this.repository);
  }

  final ReportRepository repository;

  late final SalesReportController _sales;

  late final InventoryReportController _inventory;

  late final PurchaseReportController _purchases;

  late final ExpenseReportController _expenses;

  late final CustomerReportController _customers;

  late final SupplierReportController _suppliers;

  late final FinancialReportController _financial;

  ReportType _selectedReport =
      ReportType.sales;

  ReportPeriod _selectedPeriod =
      ReportPeriod.month;

  ReportType get selectedReport =>
      _selectedReport;

  ReportPeriod get selectedPeriod =>
      _selectedPeriod;

  void setReport(
    ReportType report,
  ) {
    if (_selectedReport == report) {
      return;
    }

    _selectedReport = report;

    notifyListeners();
  }

  void setPeriod(
    ReportPeriod period,
  ) {
    if (_selectedPeriod == period) {
      return;
    }

    _selectedPeriod = period;

    notifyListeners();
  }

  Future<void> refresh() async {
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Sales
  //---------------------------------------------------------------------------

  List<List<String>> get salesRows =>
      _sales.tableRows;

  double get totalSales =>
      _sales.totalSales;

  double get totalProfit =>
      _sales.totalProfit;

  //---------------------------------------------------------------------------
  // Inventory
  //---------------------------------------------------------------------------

  List<List<String>> get inventoryRows =>
      _inventory.tableRows;

  int get totalStock =>
      _inventory.totalStock;

  int get lowStock =>
      _inventory.lowStock;

  double get stockValue =>
      _inventory.stockValue;

  //---------------------------------------------------------------------------
  // Purchases
  //---------------------------------------------------------------------------

  List<List<String>> get purchaseRows =>
      _purchases.tableRows;

  double get totalPurchases =>
      _purchases.totalPurchases;

  //---------------------------------------------------------------------------
  // Expenses
  //---------------------------------------------------------------------------

  List<List<String>> get expenseRows =>
      _expenses.tableRows;

  double get totalExpenses =>
      _expenses.totalExpenses;

  int get expenseCount =>
      _expenses.expenseCount;

  //---------------------------------------------------------------------------
  // Customers
  //---------------------------------------------------------------------------

  List<List<String>> get customerRows =>
      _customers.tableRows;

  int get totalCustomers =>
      _customers.totalCustomers;

  int get activeCustomers =>
      _customers.activeCustomers;

  //---------------------------------------------------------------------------
  // Suppliers
  //---------------------------------------------------------------------------

  List<List<String>> get supplierRows =>
      _suppliers.tableRows;

  int get totalSuppliers =>
      _suppliers.totalSuppliers;

  //---------------------------------------------------------------------------
  // Financial
  //---------------------------------------------------------------------------

  List<List<String>> get financialRows =>
      _financial.tableRows;

  double get revenue =>
      _financial.revenue;

  double get expenses =>
      _financial.expenses;

  double get purchases =>
      _financial.purchases;

  double get netProfit =>
      _financial.netProfit;
}