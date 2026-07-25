import 'package:flutter/material.dart';

//import '../controllers/report_controller.dart';
import '../controllers/report_controllers.dart';
import '../exporters/report_export_manager.dart';
import '../repositories/report_repository.dart';
import 'report_state.dart';

class ReportProvider extends ChangeNotifier {
  ReportProvider({
    ReportRepository? repository,
    ReportExportManager? exportManager,
  })  : repository = repository ?? const ReportRepository(),
        _exportManager =
            exportManager ?? const ReportExportManager() {
    _sales = SalesReportController(this.repository);

    _inventory = InventoryReportController(this.repository);

    _purchases = PurchaseReportController(this.repository);

    _expenses = ExpenseReportController(this.repository);

    _customers = CustomerReportController(this.repository);

    _suppliers = SupplierReportController(this.repository);

    _financial = FinancialReportController(this.repository);
  }

  //---------------------------------------------------------------------------
  // Dependencies
  //---------------------------------------------------------------------------

  final ReportRepository repository;

  final ReportExportManager _exportManager;

  //---------------------------------------------------------------------------
  // Controllers
  //---------------------------------------------------------------------------

  late final SalesReportController _sales;

  late final InventoryReportController _inventory;

  late final PurchaseReportController _purchases;

  late final ExpenseReportController _expenses;

  late final CustomerReportController _customers;

  late final SupplierReportController _suppliers;

  late final FinancialReportController _financial;

  //---------------------------------------------------------------------------
  // Controller Getters
  //---------------------------------------------------------------------------

  SalesReportController get salesController =>
      _sales;

  InventoryReportController get inventoryController =>
      _inventory;

  PurchaseReportController get purchaseController =>
      _purchases;

  ExpenseReportController get expenseController =>
      _expenses;

  CustomerReportController get customerController =>
      _customers;

  SupplierReportController get supplierController =>
      _suppliers;

  FinancialReportController get financialController =>
      _financial;

  //---------------------------------------------------------------------------
  // State
  //---------------------------------------------------------------------------

  ReportType _selectedReport = ReportType.sales;

  ReportPeriod _selectedPeriod = ReportPeriod.month;

  ReportType get selectedReport => _selectedReport;

  ReportPeriod get selectedPeriod => _selectedPeriod;

  //---------------------------------------------------------------------------
  // Current Controller
  //---------------------------------------------------------------------------

  ReportController get currentController {
    switch (_selectedReport) {
      case ReportType.sales:
        return _sales;

      case ReportType.inventory:
        return _inventory;

      case ReportType.purchases:
        return _purchases;

      case ReportType.expenses:
        return _expenses;

      case ReportType.customers:
        return _customers;

      case ReportType.suppliers:
        return _suppliers;

      case ReportType.financial:
        return _financial;
    }
  }

  //---------------------------------------------------------------------------
  // State Updates
  //---------------------------------------------------------------------------

  void setReport(ReportType report) {
    if (_selectedReport == report) return;

    _selectedReport = report;
    notifyListeners();
  }

  void setPeriod(ReportPeriod period) {
    if (_selectedPeriod == period) return;

    _selectedPeriod = period;
    notifyListeners();
  }

  Future<void> refresh() async {
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Export
  //---------------------------------------------------------------------------

  Future<void> exportReport({
    required ReportController controller,
    required ExportFormat format,
  }) async {
    await _exportManager.export(
      controller: controller,
      format: format,
    );
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