import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/category_form_controller.dart';
import '../providers/category_provider.dart';
import '../widgets/form/category_form.dart';

/// ---------------------------------------------------------------------------
/// EditCategoryScreen
/// ---------------------------------------------------------------------------
///
/// Allows editing an existing category.
///
/// Responsibilities:
/// • Load existing category
/// • Populate CategoryFormController
/// • Display CategoryForm
/// • Save updates
/// • Handle Cancel
/// ---------------------------------------------------------------------------
class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  State<EditCategoryScreen> createState() =>
      _EditCategoryScreenState();
}

class _EditCategoryScreenState
    extends State<EditCategoryScreen> {
  late final CategoryFormController controller;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    controller = CategoryFormController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    final provider = context.read<CategoryProvider>();

    final category = provider.findById(widget.categoryId);

    if (category != null) {
      controller.nameController.text = category.name;
      controller.descriptionController.text =
          category.description ?? '';
      controller.color = category.color;
      controller.icon = category.icon;
    }

    _initialized = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _updateCategory() {
    if (!controller.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a category name.',
          ),
        ),
      );
      return;
    }

    context.read<CategoryProvider>()
        .updateCategoryFromController(
          widget.categoryId,
          controller,
        );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Category updated successfully.',
        ),
      ),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Edit Category',
      body: SingleChildScrollView(
        padding: AppFormSpacing.pagePadding,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CategoryForm(
              controller: controller,
              primaryButtonLabel: 'Update Category',
              onSave: _updateCategory,
              onCancel: () => context.pop(),
            );
          },
        ),
      ),
    );
  }
}