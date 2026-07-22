import 'package:flutter/material.dart';

import '../controllers/category_form_controller.dart';
import '../models/category.dart';
import '../repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _categories = [];

  // Master list used for searching.
  List<Category> _allCategories = [];

  List<Category> _filteredCategories = [];

  bool _isLoading = false;

  String _searchQuery = '';

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  List<Category> get categories =>
      List.unmodifiable(_filteredCategories);

  bool get isLoading => _isLoading;

  String get searchQuery => _searchQuery;

  //--------------------------------------------------------------------------
  // Initialization
  //--------------------------------------------------------------------------

  void loadCategories() {
    _isLoading = true;
    notifyListeners();

    _allCategories = CategoryRepository.getAll();

    _categories
      ..clear()
      ..addAll(_allCategories);

    _filteredCategories = List.from(_allCategories);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    loadCategories();
  }

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  void addCategory(Category category) {
    CategoryRepository.add(category);
    loadCategories();
  }

  void addCategoryFromController(
    CategoryFormController controller,
  ) {
    addCategory(controller.toCategory());
  }

  void updateCategory(Category category) {
    CategoryRepository.update(category);
    loadCategories();
  }

  void updateCategoryFromController(
    String id,
    CategoryFormController controller,
  ) {
    updateCategory(
      controller.toCategory(id: id),
    );
  }

  void deleteCategory(String id) {
    CategoryRepository.delete(id);
    loadCategories();
  }

  //--------------------------------------------------------------------------
  // Lookup
  //--------------------------------------------------------------------------

  Category? findById(String id) {
    try {
      return _categories.firstWhere(
        (category) => category.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  //--------------------------------------------------------------------------
  // Search
  //--------------------------------------------------------------------------

  void searchCategories(String query) {
    _searchQuery = query;

    final q = query.trim().toLowerCase();

    if (q.isEmpty) {
      _filteredCategories = List.from(_allCategories);
    } else {
      _filteredCategories = _allCategories.where((category) {
        return category.name.toLowerCase().contains(q) ||
            (category.description ?? '')
                .toLowerCase()
                .contains(q);
      }).toList();
    }

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Helpers
  //--------------------------------------------------------------------------

  bool exists(String name) {
    return _categories.any(
      (category) =>
          category.name.toLowerCase() ==
          name.trim().toLowerCase(),
    );
  }

  int get totalCategories => _categories.length;

  void clearSearch() {
    searchCategories('');
  }
}