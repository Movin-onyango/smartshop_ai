import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/supplier_form_controller.dart';
import '../models/supplier.dart';
import '../providers/supplier_provider.dart';
import '../widgets/form/supplier_form.dart';

/// ---------------------------------------------------------------------------
/// EditSupplierScreen
/// ---------------------------------------------------------------------------
///
/// Edit an existing supplier.
/// ---------------------------------------------------------------------------
class EditSupplierScreen extends StatefulWidget {
  const EditSupplierScreen({super.key, required this.supplierId});

  final String supplierId;

  @override
  State<EditSupplierScreen> createState() => _EditSupplierScreenState();
}

class _EditSupplierScreenState extends State<EditSupplierScreen> {
  Supplier? supplier;

  late SupplierFormController controller;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    supplier = context.read<SupplierProvider>().findById(widget.supplierId);

    if (supplier != null) {
      controller = SupplierFormController.fromSupplier(supplier!);
    }

    _initialized = true;
  }

  @override
  void dispose() {
    if (_initialized && supplier != null) {
      controller.dispose();
    }

    super.dispose();
  }

  Future<void> _saveSupplier() async {
    if (supplier == null) return;

    if (!controller.validate()) {
      return;
    }

    final updatedSupplier = controller.toSupplier().copyWith(
      id: supplier!.id,
      createdAt: supplier!.createdAt,
    );

    await context.read<SupplierProvider>().updateSupplier(updatedSupplier);

    if (!mounted) return;

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (supplier == null) {
      return const SmartScaffold(
        title: 'Supplier',
        body: Center(child: Text('Supplier not found.')),
      );
    }

    return SmartScaffold(
      title: 'Edit Supplier',

      body: SupplierForm(
        controller: controller,

        saveLabel: 'Update Supplier',

        onSave: _saveSupplier,

        onCancel: () {
          context.pop();
        },
      ),
    );
  }
}
