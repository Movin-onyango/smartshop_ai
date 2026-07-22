/*
import 'package:flutter/material.dart';

import '../models/product.dart';

/// Form used to create or edit a product.
///
/// The form is divided into logical sections to improve
/// readability and maintainability:
/// • Product Information
/// • Pricing
/// • Inventory
/// • Actions
class ProductForm extends StatefulWidget {
  const ProductForm({
    super.key,
    this.initialProduct,
    required this.onSubmit,
  });

  final Product? initialProduct;
  final ValueChanged<Product> onSubmit;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  /// Global key used to validate the form.
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _supplierController;
  late final TextEditingController _barcodeController;
  late final TextEditingController _buyingPriceController;
  late final TextEditingController _sellingPriceController;
  late final TextEditingController _quantityController;

  String _selectedCategory = 'Groceries';
  DateTime? _expiryDate;

  @override
  void initState() {
    super.initState();

    final product = widget.initialProduct;

    _nameController = TextEditingController(
      text: product?.name ?? '',
    );

    _supplierController = TextEditingController(
      text: product?.supplier ?? '',
    );

    _barcodeController = TextEditingController(
      text: product?.barcode ?? '',
    );

    _buyingPriceController = TextEditingController(
      text: product?.buyingPrice.toString() ?? '',
    );

    _sellingPriceController = TextEditingController(
      text: product?.sellingPrice.toString() ?? '',
    );

    _quantityController = TextEditingController(
      text: product?.quantity.toString() ?? '',
    );

    _selectedCategory = product?.category ?? 'Groceries';
    _expiryDate = product?.expiryDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _supplierController.dispose();
    _barcodeController.dispose();
    _buyingPriceController.dispose();
    _sellingPriceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          _buildProductInformation(),

          const SizedBox(height: 24),

          _buildPricingSection(),

          const SizedBox(height: 24),

          _buildInventorySection(),

          const SizedBox(height: 32),

          _buildActions(),
        ],
      ),
    );
  }

  /// Builds the product information section.
  ///
  /// This section will later contain fields such as:
  /// • Product name
  /// • Category
  /// • Supplier
  /// • Barcode
  Widget _buildProductInformation() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Product Information'),
      ),
    );
  }

  /// Builds the pricing section.
  ///
  /// Future fields include:
  /// • Buying price
  /// • Selling price
  /// • Profit calculations
  Widget _buildPricingSection() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Pricing'),
      ),
    );
  }

  /// Builds the inventory section.
  ///
  /// Future fields include:
  /// • Quantity
  /// • Expiry date
  /// • Stock alerts
  Widget _buildInventorySection() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Inventory'),
      ),
    );
  }

  /// Builds the primary action button.
  ///
  /// Validation and submission logic will be implemented
  /// in a later sprint.
  Widget _buildActions() {
    return FilledButton(
      onPressed: () {},
      child: const Text('Save Product'),
    );
  }
}
*/