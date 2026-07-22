import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/product_form_controller.dart';
import '../widgets/form/product_form.dart';

/// ---------------------------------------------------------------------------
/// AddProductScreen
/// ---------------------------------------------------------------------------
///
/// Screen responsible for creating new products.
///
/// Responsibilities:
/// • Own ProductFormController
/// • Display ProductForm
/// • Handle Save / Cancel
///
/// Does NOT:
/// • Build form fields
/// • Calculate pricing
/// • Manage inventory logic
/// ---------------------------------------------------------------------------
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late final ProductFormController controller;

  static const List<String> categories = [
    'Beverages',
    'Groceries',
    'Electronics',
    'Cosmetics',
    'Stationery',
  ];

  @override
  void initState() {
    super.initState();
    controller = ProductFormController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _saveProduct() {
    if (!controller.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete all required fields.',
          ),
        ),
      );
      return;
    }

    // TODO:
    // ProductRepository.save(controller.toProduct());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Product saved successfully.'),
      ),
    );

    controller.clear();

    if (!mounted) return;

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Add Product',
      body: SingleChildScrollView(
        padding: AppFormSpacing.pagePadding,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return ProductForm(
              controller: controller,
              categories: categories,
              onSave: _saveProduct,
              onCancel: () => context.pop(),
            );
          },
        ),
      ),
    );
  }
}