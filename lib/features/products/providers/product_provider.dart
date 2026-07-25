import 'package:flutter/material.dart';

import '../models/product.dart';
import '../repositories/product_repository.dart';

/// ---------------------------------------------------------------------------
/// ProductProvider
/// ---------------------------------------------------------------------------
///
/// Manages the application's product state.
///
/// Responsibilities:
///
/// • Load products
/// • Add products
/// • Update products
/// • Delete products
/// • Search
/// • Filtering
///
/// Widgets never communicate directly with ProductRepository.
/// ---------------------------------------------------------------------------
class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  //---------------------------------------------------------------------------
  // Initialization
  //---------------------------------------------------------------------------

  void loadProducts() {
    _products
      ..clear()
      ..addAll(ProductRepository.getAll());

    notifyListeners();
  }

  Future<void> refresh() async {
    loadProducts();
  }

  //---------------------------------------------------------------------------
  // CRUD
  //---------------------------------------------------------------------------

  void addProduct(Product product) {
    ProductRepository.add(product);
    loadProducts();
  }

  void updateProduct(Product product) {
    ProductRepository.update(product);
    loadProducts();
  }

  void deleteProduct(String id) {
    ProductRepository.delete(id);
    loadProducts();
  }

  //---------------------------------------------------------------------------
  // Lookup
  //---------------------------------------------------------------------------

  Product? findById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (_) {
      return null;
    }
  }

  //---------------------------------------------------------------------------
  // Filtering
  //---------------------------------------------------------------------------

  String? _selectedCategory;

  String? get selectedCategory => _selectedCategory;

  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  List<Product> filterProducts(String? category) {
    if (category == null || category.isEmpty) {
      return products;
    }

    return products.where((p) => p.category == category).toList();
  }

  //---------------------------------------------------------------------------
  // Loading State
  //---------------------------------------------------------------------------

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Search
  //---------------------------------------------------------------------------

  List<Product> searchProducts(String query) {
    return search(query);
  }

  List<Product> search(String query) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) return products;

    return _products.where((product) {
      return product.name.toLowerCase().contains(q) ||
          product.category.toLowerCase().contains(q) ||
          (product.barcode ?? '').toLowerCase().contains(q);
    }).toList();
  }
}
