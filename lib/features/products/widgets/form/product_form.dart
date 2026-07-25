import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_actions.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';
import '../../controllers/product_form_controller.dart';

import 'inventory_card.dart';
import 'pricing_card.dart';
import 'product_information_card.dart';

/// ---------------------------------------------------------------------------
/// ProductForm
/// ---------------------------------------------------------------------------
///
/// Assembles the complete Product Form.
///
/// This widget intentionally contains almost no business logic.
///
/// Responsibilities:
/// • Assemble reusable form sections
/// • Share one ProductFormController across all sections
/// • Display Save / Cancel actions
///
/// Business logic remains inside ProductFormController.
/// ---------------------------------------------------------------------------
class ProductForm extends StatelessWidget {
  const ProductForm({
    super.key,
    required this.controller,
    required this.categories,
    required this.onSave,
    this.onCancel,
    this.primaryButtonLabel = 'Save Product',
  });

  /// Shared form controller.
  final ProductFormController controller;

  /// Available product categories.
  final List<String> categories;

  /// Save callback.
  final VoidCallback onSave;

  /// Optional cancel callback.
  final VoidCallback? onCancel;

  /// Primary button text.
  final String primaryButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductInformationCard(controller: controller, categories: categories),

        AppFormSpacing.sectionGap,

        PricingCard(controller: controller),

        AppFormSpacing.sectionGap,

        InventoryCard(controller: controller),

        AppFormSpacing.sectionGap,

        AppFormActions(
          primaryLabel: primaryButtonLabel,
          primaryIcon: Icons.save_outlined,
          onPrimaryPressed: onSave,

          secondaryLabel: 'Cancel',
          secondaryIcon: Icons.close,
          onSecondaryPressed: onCancel,
        ),

        AppFormSpacing.bottomGap,
      ],
    );
  }
}
