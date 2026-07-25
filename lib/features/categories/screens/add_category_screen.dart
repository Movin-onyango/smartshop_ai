import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/category_form_controller.dart';
import '../providers/category_provider.dart';
import '../widgets/form/category_form.dart';

/// ---------------------------------------------------------------------------
/// AddCategoryScreen
/// ---------------------------------------------------------------------------
///
/// Screen responsible for creating new categories.
///
/// Responsibilities:
/// • Own CategoryFormController
/// • Display CategoryForm
/// • Validate input
/// • Save category
/// • Handle Cancel
///
/// UI widgets never create controllers.
/// ---------------------------------------------------------------------------
class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  late final CategoryFormController controller;

  @override
  void initState() {
    super.initState();
    controller = CategoryFormController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _saveCategory() {
    if (!controller.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a category name.')),
      );
      return;
    }

    context.read<CategoryProvider>().addCategoryFromController(controller);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Category created successfully.')),
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Add Category',
      body: SingleChildScrollView(
        padding: AppFormSpacing.pagePadding,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return CategoryForm(
              controller: controller,
              onSave: _saveCategory,
              onCancel: () => context.pop(),
            );
          },
        ),
      ),
    );
  }
}
