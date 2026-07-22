import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/purchase_form_controller.dart';
import '../providers/purchase_provider.dart';

import '../widgets/form/purchase_form.dart';

/// ---------------------------------------------------------------------------
/// AddPurchaseScreen
/// ---------------------------------------------------------------------------
///
/// Creates a new purchase order.
///
/// Responsibilities:
/// • Own PurchaseFormController
/// • Save purchase
/// • Navigation
/// ---------------------------------------------------------------------------
class AddPurchaseScreen extends StatefulWidget {
  const AddPurchaseScreen({
    super.key,
  });

  @override
  State<AddPurchaseScreen> createState() =>
      _AddPurchaseScreenState();
}

class _AddPurchaseScreenState
    extends State<AddPurchaseScreen> {
  late final PurchaseFormController
      controller;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    controller =
        PurchaseFormController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //---------------------------------------------------------------------------
  // Save
  //---------------------------------------------------------------------------

  Future<void> _save() async {
    if (!controller.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    await context
        .read<PurchaseProvider>()
        .addPurchase(
          controller.toPurchase(),
        );

    if (!mounted) return;

    Navigator.pop(context);
  }

  //---------------------------------------------------------------------------
  // Supplier Picker
  //---------------------------------------------------------------------------

  Future<void> _selectSupplier() async {
    // TODO:
    // Open Supplier Picker Screen
    // Then call:
    //
    // controller.setSupplier(
    //   id: supplier.id!,
    //   name: supplier.name,
    // );
  }

  //---------------------------------------------------------------------------
  // Add Item
  //---------------------------------------------------------------------------

  Future<void> _addItem() async {
    // TODO:
    // Open Product Picker
  }

  //---------------------------------------------------------------------------
  // Edit Item
  //---------------------------------------------------------------------------

  Future<void> _editItem(
    int index,
    item,
  ) async {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'New Purchase',

      body: PurchaseForm(
        controller: controller,

        isEditing: false,

        isSaving: _isSaving,

        onSelectSupplier:
            _selectSupplier,

        onAddItem: _addItem,

        onEditItem: _editItem,

        onSave: _save,

        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}