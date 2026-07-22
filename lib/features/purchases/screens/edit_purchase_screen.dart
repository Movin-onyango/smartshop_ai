import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/purchase_form_controller.dart';
import '../models/purchase.dart';
import '../models/purchase_item.dart';
import '../providers/purchase_provider.dart';

import '../widgets/form/purchase_form.dart';

/// ---------------------------------------------------------------------------
/// EditPurchaseScreen
/// ---------------------------------------------------------------------------
///
/// Edit an existing purchase order.
///
/// Responsibilities:
/// • Load purchase
/// • Own PurchaseFormController
/// • Update purchase
/// • Navigation
/// ---------------------------------------------------------------------------
class EditPurchaseScreen extends StatefulWidget {
  const EditPurchaseScreen({
    super.key,
    required this.purchaseId,
  });

  final String purchaseId;

  @override
  State<EditPurchaseScreen> createState() =>
      _EditPurchaseScreenState();
}

class _EditPurchaseScreenState
    extends State<EditPurchaseScreen> {
  late Purchase purchase;

  late PurchaseFormController controller;

  bool _initialized = false;

  bool _isSaving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    purchase = context
        .read<PurchaseProvider>()
        .findById(widget.purchaseId)!;

    controller =
        PurchaseFormController.fromPurchase(
      purchase,
    );

    _initialized = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //---------------------------------------------------------------------------
  // Update Purchase
  //---------------------------------------------------------------------------

  Future<void> _save() async {
    if (!controller.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    final updatedPurchase =
        controller.toPurchase(
      id: purchase.id,
      purchaseNumber:
          purchase.purchaseNumber,
    );

    await context
        .read<PurchaseProvider>()
        .updatePurchase(
          updatedPurchase,
        );

    if (!mounted) return;

    Navigator.pop(context);
  }

  //---------------------------------------------------------------------------
  // Supplier Picker
  //---------------------------------------------------------------------------

  Future<void> _selectSupplier() async {
    // TODO
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
    // TODO
  }

  //---------------------------------------------------------------------------
  // Edit Item
  //---------------------------------------------------------------------------

  Future<void> _editItem(
    int index,
    PurchaseItem item,
  ) async {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Edit Purchase',

      body: PurchaseForm(
        controller: controller,

        isEditing: true,

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