import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/customer_form_controller.dart';
import '../models/customer.dart';
import '../providers/customer_provider.dart';

import '../widgets/form/customer_form.dart';

/// ---------------------------------------------------------------------------
/// Edit Customer Screen
/// ---------------------------------------------------------------------------
///
/// Used to edit an existing customer.
/// ---------------------------------------------------------------------------
class EditCustomerScreen extends StatefulWidget {
  const EditCustomerScreen({
    super.key,
    required this.customerId,
  });

  final String customerId;

  @override
  State<EditCustomerScreen> createState() =>
      _EditCustomerScreenState();
}

class _EditCustomerScreenState
    extends State<EditCustomerScreen> {
  late Customer customer;
  late CustomerFormController controller;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    customer = context
        .read<CustomerProvider>()
        .findById(widget.customerId)!;

    controller = CustomerFormController(
      customer: customer,
    );

    _initialized = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _updateCustomer() {
    if (!controller.validate()) {
      return;
    }

    final updatedCustomer = controller.toCustomer();

    context
        .read<CustomerProvider>()
        .updateCustomer(updatedCustomer);

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Edit Customer',
      body: CustomerForm(
        controller: controller,
        onSave: _updateCustomer,
      ),
    );
  }
}