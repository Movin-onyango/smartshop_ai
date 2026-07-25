import 'package:flutter/material.dart';

import '../models/inventory_item.dart';
import '../repositories/inventory_repository.dart';

/// InventoryFilter
/// ---------------------------------------------------------------------------

enum InventoryFilter { all, lowStock, outOfStock }

/// ---------------------------------------------------------------------------
/// InventoryProvider
/// ---------------------------------------------------------------------------
///
/// Manages inventory state.
///
/// Responsibilities:
/// • Load inventory
/// • Search inventory
/// • Filter inventory
/// • Increase stock
/// • Decrease stock
/// • Refresh UI
/// ---------------------------------------------------------------------------
class InventoryProvider extends ChangeNotifier {
  final List<InventoryItem> _inventory = [];

  bool _isLoading = false;
  String _searchQuery = '';

  InventoryFilter _filter = InventoryFilter.all;

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<InventoryItem> get inventory {
    switch (_filter) {
      case InventoryFilter.lowStock:
        return List.unmodifiable(_inventory.where((e) => e.isLowStock));

      case InventoryFilter.outOfStock:
        return List.unmodifiable(_inventory.where((e) => e.isOutOfStock));

      case InventoryFilter.all:
        return List.unmodifiable(_inventory);
    }
  }

  bool get isLoading => _isLoading;

  InventoryFilter get filter => _filter;

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadInventory() {
    _setLoading(true);

    _inventory
      ..clear()
      ..addAll(InventoryRepository.getAll());

    _setLoading(false);

    notifyListeners();
  }

  Future<void> refresh() async {
    loadInventory();
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  void searchInventory(String query) {
    _searchQuery = query.trim().toLowerCase();

    _inventory
      ..clear()
      ..addAll(
        InventoryRepository.getAll().where(
          (item) =>
              item.product.name.toLowerCase().contains(_searchQuery) ||
              item.product.category.toLowerCase().contains(_searchQuery),
        ),
      );

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Filter
  //---------------------------------------------------------------------------

  void setFilter(InventoryFilter value) {
    _filter = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Stock Operations
  //---------------------------------------------------------------------------

  void increaseStock(String id, int quantity) {
    InventoryRepository.increaseStock(id, quantity);

    loadInventory();
  }

  void decreaseStock(String id, int quantity) {
    InventoryRepository.decreaseStock(id, quantity);

    loadInventory();
  }

  //---------------------------------------------------------------------------
  // Lookup
  //---------------------------------------------------------------------------

  InventoryItem? findById(String id) {
    try {
      return _inventory.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Helpers
  //---------------------------------------------------------------------------

  List<InventoryItem> get lowStockItems =>
      _inventory.where((e) => e.isLowStock).toList();

  List<InventoryItem> get outOfStockItems =>
      _inventory.where((e) => e.isOutOfStock).toList();

  void _setLoading(bool value) {
    _isLoading = value;
  }
}
