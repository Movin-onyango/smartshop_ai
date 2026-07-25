import 'package:flutter/material.dart';

import '../models/product.dart';

/// ---------------------------------------------------------------------------
/// ProductFormController
/// ---------------------------------------------------------------------------
///
/// Owns the complete state of the Product Form.
///
/// Responsibilities:
/// • TextEditingControllers
/// • Dropdown selections
/// • Switches
/// • Business calculations
/// • Form validation
/// • Product conversion
///
/// UI widgets should NOT create controllers.
///
/// ---------------------------------------------------------------------------
class ProductFormController extends ChangeNotifier {
  //--------------------------------------------------------------------------
  // Constructors
  //--------------------------------------------------------------------------

  ProductFormController();

  factory ProductFormController.fromProduct(Product product) {
    final controller = ProductFormController();

    controller.nameController.text = product.name;
    controller.barcodeController.text = product.barcode ?? '';
    controller.descriptionController.text = product.description ?? '';

    controller.buyingPriceController.text = product.buyingPrice.toString();

    controller.sellingPriceController.text = product.sellingPrice.toString();

    controller.discountController.text = product.discount.toString();

    controller.quantityController.text = product.quantity.toString();

    controller.reorderLevelController.text = product.reorderLevel.toString();

    controller.expiryDateController.text =
        product.expiryDate?.toIso8601String() ?? '';

    controller._selectedCategory = product.category;
    controller._trackExpiry = product.trackExpiry;
    controller._lowStockAlerts = product.lowStockAlerts;

    return controller;
  }

  //--------------------------------------------------------------------------
  // Controllers
  //--------------------------------------------------------------------------

  final nameController = TextEditingController();

  final barcodeController = TextEditingController();

  final descriptionController = TextEditingController();

  final buyingPriceController = TextEditingController();

  final sellingPriceController = TextEditingController();

  final discountController = TextEditingController(text: '0');

  final quantityController = TextEditingController();

  final reorderLevelController = TextEditingController();

  final expiryDateController = TextEditingController();

  //--------------------------------------------------------------------------
  // Category
  //--------------------------------------------------------------------------

  String? _selectedCategory;

  String? get selectedCategory => _selectedCategory;

  bool get hasCategory =>
      _selectedCategory != null && _selectedCategory!.isNotEmpty;

  void setCategory(String? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Switches
  //--------------------------------------------------------------------------

  bool _trackExpiry = false;

  bool get trackExpiry => _trackExpiry;

  void setTrackExpiry(bool value) {
    _trackExpiry = value;
    notifyListeners();
  }

  bool _lowStockAlerts = true;

  bool get lowStockAlerts => _lowStockAlerts;

  void setLowStockAlerts(bool value) {
    _lowStockAlerts = value;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Pricing Helpers
  //--------------------------------------------------------------------------

  double get buyingPrice => double.tryParse(buyingPriceController.text) ?? 0;
  double get effectiveSellingPrice =>
      sellingPrice - ((sellingPrice * discount) / 100);

  double get sellingPrice => double.tryParse(sellingPriceController.text) ?? 0;

  double get discount => double.tryParse(discountController.text) ?? 0;

  double get discountedSellingPrice =>
      sellingPrice - ((sellingPrice * discount) / 100);

  double get profit => discountedSellingPrice - buyingPrice;

  double get margin =>
      discountedSellingPrice == 0 ? 0 : (profit / discountedSellingPrice) * 100;

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  bool get isValid =>
      nameController.text.trim().isNotEmpty &&
      hasCategory &&
      buyingPrice > 0 &&
      sellingPrice > 0 &&
      quantityController.text.trim().isNotEmpty;

  //--------------------------------------------------------------------------
  // Convert To Product
  //--------------------------------------------------------------------------

  Product toProduct({String? id, String? imageUrl, DateTime? createdAt}) {
    return Product(
      id: id,

      name: nameController.text.trim(),

      category: _selectedCategory ?? '',

      barcode: barcodeController.text.trim().isEmpty
          ? null
          : barcodeController.text.trim(),

      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),

      buyingPrice: buyingPrice,

      sellingPrice: sellingPrice,

      discount: discount,

      quantity: int.tryParse(quantityController.text) ?? 0,

      reorderLevel: int.tryParse(reorderLevelController.text) ?? 0,

      expiryDate: expiryDateController.text.trim().isEmpty
          ? null
          : DateTime.tryParse(expiryDateController.text),

      trackExpiry: _trackExpiry,

      lowStockAlerts: _lowStockAlerts,

      imageUrl: imageUrl,

      createdAt: createdAt ?? DateTime.now(),

      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------------------------------
  // Reset Form
  //--------------------------------------------------------------------------

  void clear() {
    nameController.clear();

    barcodeController.clear();

    descriptionController.clear();

    buyingPriceController.clear();

    sellingPriceController.clear();

    discountController.text = '0';

    quantityController.clear();

    reorderLevelController.clear();

    expiryDateController.clear();

    _selectedCategory = null;

    _trackExpiry = false;

    _lowStockAlerts = true;

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Dispose
  //--------------------------------------------------------------------------

  @override
  void dispose() {
    nameController.dispose();

    barcodeController.dispose();

    descriptionController.dispose();

    buyingPriceController.dispose();

    sellingPriceController.dispose();

    discountController.dispose();

    quantityController.dispose();

    reorderLevelController.dispose();

    expiryDateController.dispose();

    super.dispose();
  }
}
