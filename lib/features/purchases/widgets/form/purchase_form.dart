import 'package:flutter/material.dart';

import '../../controllers/purchase_form_controller.dart';
import '../../models/purchase_item.dart';
import 'purchase_dates_card.dart';
import 'purchase_form_actions.dart';
import 'purchase_items_card.dart';
import 'purchase_notes_card.dart';
import 'purchase_supplier_card.dart';
import 'purchase_totals_card.dart';

/// ---------------------------------------------------------------------------
/// PurchaseForm
/// ---------------------------------------------------------------------------
///
/// Reusable purchase form.
///
/// Used by:
/// • AddPurchaseScreen
/// • EditPurchaseScreen
/// ---------------------------------------------------------------------------
class PurchaseForm extends StatelessWidget {
  const PurchaseForm({
    super.key,
    required this.controller,
    required this.onSelectSupplier,
    required this.onAddItem,
    required this.onEditItem,
    required this.onSave,
    required this.onCancel,
    this.isEditing = false,
    this.isSaving = false,
  });

  final PurchaseFormController controller;

  final VoidCallback onSelectSupplier;

  final VoidCallback onAddItem;

  final void Function(int index, PurchaseItem item) onEditItem;

  final VoidCallback onSave;

  final VoidCallback onCancel;

  final bool isEditing;

  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //--------------------------------------------------------------------
          // Supplier
          //--------------------------------------------------------------------
          PurchaseSupplierCard(
            controller: controller,
            onSelectSupplier: onSelectSupplier,
          ),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Dates
          //--------------------------------------------------------------------
          PurchaseDatesCard(controller: controller),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Items
          //--------------------------------------------------------------------
          PurchaseItemsCard(
            controller: controller,
            onAddItem: onAddItem,
            onEditItem: onEditItem,
          ),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Totals
          //--------------------------------------------------------------------
          PurchaseTotalsCard(controller: controller),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Notes
          //--------------------------------------------------------------------
          PurchaseNotesCard(controller: controller),

          const SizedBox(height: 24),

          //--------------------------------------------------------------------
          // Actions
          //--------------------------------------------------------------------
          PurchaseFormActions(
            isEditing: isEditing,
            isSaving: isSaving,
            onSave: onSave,
            onCancel: onCancel,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
