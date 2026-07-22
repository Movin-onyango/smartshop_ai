import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../../../shared/widgets/forms/app_form_spacing.dart';

import '../models/product.dart';
import '../providers/product_provider.dart';
import '../widgets/form/product_form.dart';
import '../controllers/product_form_controller.dart';

/// ---------------------------------------------------------------------------
/// EditProductScreen
/// ---------------------------------------------------------------------------
///
/// Allows editing an existing product.
///
/// Responsibilities:
/// • Load an existing Product into the form
/// • Display ProductForm
/// • Save updated values
/// • Handle Cancel
///
/// Does NOT:
/// • Build individual fields
/// • Perform pricing calculations
/// • Implement repository logic
/// ---------------------------------------------------------------------------
class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late Product product;
  late ProductFormController controller;

  bool _initialized = false;

  final List<String> categories = const [
    'Beverages',
    'Groceries',
    'Electronics',
    'Cosmetics',
    'Stationery',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    product = context
        .read<ProductProvider>()
        .findById(widget.productId)!;

    controller = ProductFormController.fromProduct(product);

    _initialized = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _updateProduct() {
    if (!controller.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all required fields.'),
        ),
      );
      return;
    }

    // TODO:
    // final updatedProduct = controller.toProduct(product.id);
    // await ProductRepository.update(updatedProduct);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product updated successfully.'),
      ),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Edit Product',
      body: SingleChildScrollView(
        padding: AppFormSpacing.pagePadding,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return ProductForm(
              controller: controller,
              categories: categories,
              onSave: _updateProduct,
              onCancel: () => context.pop(),
              primaryButtonLabel: 'Update Product',
            );
          },
        ),
      ),
    );
  }
}