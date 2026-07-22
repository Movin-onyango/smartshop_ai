import 'package:flutter/foundation.dart';

import '../controllers/purchase_statistics_controller.dart';
import '../models/purchase.dart';
import '../models/purchase_item.dart';
import '../models/purchase_statistics.dart';
import '../models/purchase_status.dart';
import '../repositories/purchase_repository.dart';

/// ---------------------------------------------------------------------------
/// PurchaseProvider
/// ---------------------------------------------------------------------------
///
/// State management for purchases.
/// ---------------------------------------------------------------------------
class PurchaseProvider extends ChangeNotifier {
  final PurchaseStatisticsController _statisticsController =
      const PurchaseStatisticsController();

  List<Purchase> _purchases = [];

  bool _isLoading = false;

  String _searchQuery = '';

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<Purchase> get purchases =>
      List.unmodifiable(_purchases);

  bool get isLoading => _isLoading;

  String get searchQuery => _searchQuery;

  PurchaseStatistics get statistics =>
      _statisticsController.calculate(_purchases);

  //---------------------------------------------------------------------------
  // Filtered Purchases
  //---------------------------------------------------------------------------

  List<Purchase> get filteredPurchases {
    if (_searchQuery.trim().isEmpty) {
      return purchases;
    }

    final query = _searchQuery.toLowerCase();

    return purchases.where((purchase) {
      return purchase.purchaseNumber
              .toLowerCase()
              .contains(query) ||
          purchase.supplierName
              .toLowerCase()
              .contains(query);
    }).toList();
  }

  int get purchaseCount => filteredPurchases.length;

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  void search(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Loading
  //---------------------------------------------------------------------------

  Future<void> loadPurchases() async {
    _isLoading = true;
    notifyListeners();

    _purchases = PurchaseRepository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadPurchases();
  }

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  Future<void> addPurchase(
    Purchase purchase,
  ) async {
    PurchaseRepository.add(purchase);

    await loadPurchases();
  }

  Future<void> updatePurchase(
    Purchase purchase,
  ) async {
    PurchaseRepository.update(purchase);

    await loadPurchases();
  }

  Future<void> deletePurchase(
    String id,
  ) async {
    PurchaseRepository.delete(id);

    await loadPurchases();
  }

  //---------------------------------------------------------------------------
  // Cancel Purchase
  //---------------------------------------------------------------------------

  Future<void> cancelPurchase(
    String id,
  ) async {
    final purchase = findById(id);

    if (purchase == null) return;

    await updatePurchase(
      purchase.copyWith(
        status: PurchaseStatus.cancelled,
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Receive Purchase
  //---------------------------------------------------------------------------

  Future<void> receivePurchase({
    required String purchaseId,
    required List<PurchaseItem> receivedItems,
  }) async {
    final purchase = findById(purchaseId);

    if (purchase == null) return;

    final fullyReceived = receivedItems.every(
      (item) => item.isFullyReceived,
    );

    await updatePurchase(
      purchase.copyWith(
        items: receivedItems,
        receivedDate: DateTime.now(),
        status: fullyReceived
            ? PurchaseStatus.received
            : PurchaseStatus.partial,
        updatedAt: DateTime.now(),
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  Purchase? findById(
    String id,
  ) {
    try {
      return _purchases.firstWhere(
        (purchase) => purchase.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Dashboard KPIs
  //---------------------------------------------------------------------------

  int get totalPurchases =>
      statistics.totalPurchases;

  int get pendingPurchases =>
      statistics.pendingPurchases;

  int get receivedPurchases =>
      statistics.receivedPurchases;

  double get totalSpent =>
      statistics.totalSpent;

  double get outstandingAmount =>
      statistics.outstandingAmount;
}