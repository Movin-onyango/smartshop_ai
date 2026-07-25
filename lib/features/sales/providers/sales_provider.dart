import 'package:flutter/material.dart';

import '../models/sale.dart';
import '../repositories/sales_repository.dart';

/// ---------------------------------------------------------------------------
/// SalesProvider
/// ---------------------------------------------------------------------------
///
/// Manages the application's sales state.
///
/// Responsibilities:
/// • Load sales
/// • Add sales
/// • Update sales
/// • Delete sales
/// • Search sales
/// • Sales statistics
/// ---------------------------------------------------------------------------
class SalesProvider extends ChangeNotifier {
  final List<Sale> _sales = [];

  bool _isLoading = false;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<Sale> get sales => List.unmodifiable(_sales);

  bool get isLoading => _isLoading;

  double get totalRevenue => _sales.fold(0, (sum, sale) => sum + sale.subtotal);

  double get totalProfit => _sales.fold(0, (sum, sale) => sum + sale.profit);

  int get totalTransactions => _sales.length;

  int get totalItemsSold =>
      _sales.fold(0, (sum, sale) => sum + sale.totalQuantity);

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadSales() {
    _isLoading = true;
    notifyListeners();

    _sales
      ..clear()
      ..addAll(SalesRepository.getAll());

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    loadSales();
  }

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  void addSale(Sale sale) {
    SalesRepository.add(sale);
    loadSales();
  }

  void updateSale(Sale sale) {
    SalesRepository.update(sale);
    loadSales();
  }

  void deleteSale(String id) {
    SalesRepository.delete(id);
    loadSales();
  }

  //---------------------------------------------------------------------------
  // Lookup
  //---------------------------------------------------------------------------

  Sale? findById(String id) {
    try {
      return _sales.firstWhere((sale) => sale.id == id);
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  List<Sale> searchSales(String query) {
    return SalesRepository.search(query);
  }

  //---------------------------------------------------------------------------
  // Today's Sales
  //---------------------------------------------------------------------------

  List<Sale> get todaySales {
    final today = DateTime.now();

    return _sales.where((sale) {
      return sale.saleDate.year == today.year &&
          sale.saleDate.month == today.month &&
          sale.saleDate.day == today.day;
    }).toList();
  }

  double get todayRevenue =>
      todaySales.fold(0, (sum, sale) => sum + sale.subtotal);

  double get todayProfit =>
      todaySales.fold(0, (sum, sale) => sum + sale.profit);

  //---------------------------------------------------------------------------
  // Payment Statistics
  //---------------------------------------------------------------------------

  Map<String, int> paymentSummary() {
    final summary = <String, int>{};

    for (final sale in _sales) {
      final key = sale.payment.method.name;

      summary[key] = (summary[key] ?? 0) + 1;
    }

    return summary;
  }
}
