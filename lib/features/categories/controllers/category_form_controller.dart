import 'package:flutter/material.dart';

import '../models/category.dart';

/// ---------------------------------------------------------------------------
/// CategoryFormController
/// ---------------------------------------------------------------------------
///
/// Owns the complete state of the Category Form.
///
/// Responsibilities:
/// • TextEditingControllers
/// • Selected icon
/// • Selected color
/// • Validation
///
/// UI widgets should NOT create controllers.
///
/// Shared between:
/// • AddCategoryScreen
/// • EditCategoryScreen
/// ---------------------------------------------------------------------------
class CategoryFormController extends ChangeNotifier {
  //--------------------------------------------------------------------------
  // Controllers
  //--------------------------------------------------------------------------

  final nameController = TextEditingController();

  final descriptionController = TextEditingController();

  //--------------------------------------------------------------------------
  // Icon
  //--------------------------------------------------------------------------

  int? _selectedIcon;

  int? get selectedIcon => _selectedIcon;

  set icon(int? value) {
    _selectedIcon = value;
    notifyListeners();
  }

  void setIcon(int? icon) {
    _selectedIcon = icon;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Color
  //--------------------------------------------------------------------------

  int? _selectedColor;

  int? get selectedColor => _selectedColor;

  set color(int? value) {
    _selectedColor = value;
    notifyListeners();
  }

  void setColor(int? color) {
    _selectedColor = color;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  bool get isValid =>
      nameController.text.trim().isNotEmpty;

  //--------------------------------------------------------------------------
  // Populate from existing Category
  //--------------------------------------------------------------------------

  void populate({
    required String name,
    String? description,
    int? icon,
    int? color,
  }) {
    nameController.text = name;

    descriptionController.text =
        description ?? '';

    _selectedIcon = icon;

    _selectedColor = color;

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Convert to Category
  //--------------------------------------------------------------------------

  Category toCategory({
    String? id,
  }) {
    return Category(
      id: id,
      name: nameController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
      icon: selectedIcon,
      color: selectedColor,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------------------------------
  // Clear
  //--------------------------------------------------------------------------

  void clear() {
    nameController.clear();

    descriptionController.clear();

    _selectedIcon = null;

    _selectedColor = null;

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Dispose
  //--------------------------------------------------------------------------

  @override
  void dispose() {
    nameController.dispose();

    descriptionController.dispose();

    super.dispose();
  }
}