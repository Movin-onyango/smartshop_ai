import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/supplier_form_controller.dart';
import '../providers/supplier_provider.dart';

import '../widgets/form/supplier_form.dart';

/// ---------------------------------------------------------------------------
/// AddSupplierScreen
/// ---------------------------------------------------------------------------
///
/// Screen for creating a new supplier.
/// ---------------------------------------------------------------------------
class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({super.key});

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  late final SupplierFormController controller;

  @override
  void initState() {
    super.initState();
    controller = SupplierFormController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _saveSupplier() async {
    if (!controller.validate()) {
      return;
    }

    final supplier = controller.toSupplier();

    await context.read<SupplierProvider>().addSupplier(supplier);

    if (!mounted) return;

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Add Supplier',

      body: SupplierForm(
        controller: controller,

        saveLabel: 'Create Supplier',

        onSave: _saveSupplier,

        onCancel: () {
          context.pop();
        },
      ),
    );
  }
}
