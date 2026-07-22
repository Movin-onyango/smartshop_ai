import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_actions.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';

import '../../controllers/category_form_controller.dart';
import 'category_information_card.dart';

/// ---------------------------------------------------------------------------
/// CategoryForm
/// ---------------------------------------------------------------------------
///
/// Composes the complete Category form.
///
/// Responsibilities:
/// • Assemble reusable form sections
/// • Display Save / Cancel actions
/// • Delegate all state to CategoryFormController
///
/// Does NOT:
/// • Own controllers
/// • Save data
/// • Perform validation logic
/// ---------------------------------------------------------------------------
class CategoryForm extends StatelessWidget {
  const CategoryForm({
    super.key,
    required this.controller,
    required this.onSave,
    this.onCancel,
    this.primaryButtonLabel = 'Save Category',
  });

  /// Shared form controller.
  final CategoryFormController controller;

  /// Save callback.
  final VoidCallback onSave;

  /// Optional cancel callback.
  final VoidCallback? onCancel;

  /// Primary button label.
  final String primaryButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryInformationCard(
          controller: controller,
        ),

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