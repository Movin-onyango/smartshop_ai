import 'package:flutter/foundation.dart';

import '../../products/models/product.dart';

/// ---------------------------------------------------------------------------
/// ProductSearchController
/// ---------------------------------------------------------------------------
///
/// Manages product search and filtering for the POS.
///
/// Responsibilities:
/// • Load products
/// • Search products
/// • Filter products
/// • Expose filtered results
/// ---------------------------------------------------------------------------
class ProductSearchController extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> _filteredProducts = [];

  //---------------------------------------------------------------------------
  // Getters
  //---------------------------------------------------------------------------

  List<Product> get products => List.unmodifiable(_products);

  List<Product> get filteredProducts => List.unmodifiable(_filteredProducts);

  bool get isEmpty => _filteredProducts.isEmpty;

  int get count => _filteredProducts.length;

  //---------------------------------------------------------------------------
  // Data
  //---------------------------------------------------------------------------

  /// Loads the available products.
  ///
  /// In production this will be populated from ProductProvider or
  /// ProductRepository.
  void loadProducts(List<Product> products) {
    _products
      ..clear()
      ..addAll(products);

    _filteredProducts = List<Product>.from(_products);

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  void search(String query) {
    final text = query.trim().toLowerCase();

    if (text.isEmpty) {
      _filteredProducts = List<Product>.from(_products);
    } else {
      _filteredProducts = _products.where((product) {
        final name = product.name.toLowerCase();

        final barcode = product.barcode?.toLowerCase() ?? '';

        final category = product.category.toLowerCase();

        return name.contains(text) ||
            barcode.contains(text) ||
            category.contains(text);
      }).toList();
    }

    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Utilities
  //---------------------------------------------------------------------------

  void clearSearch() {
    _filteredProducts = List<Product>.from(_products);
    notifyListeners();
  }

  Product? findById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (_) {
      return null;
    }
  }

  bool contains(Product product) {
    return _products.any((element) => element.id == product.id);
  }

  void clear() {
    _products.clear();
    _filteredProducts.clear();
    notifyListeners();
  }
}
