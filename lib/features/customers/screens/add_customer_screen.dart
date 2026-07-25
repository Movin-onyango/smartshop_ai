import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/customer_form_controller.dart';
import '../providers/customer_provider.dart';

import '../widgets/form/customer_form.dart';

/// ---------------------------------------------------------------------------
/// AddCustomerScreen
/// ---------------------------------------------------------------------------
///
/// Screen for creating a new customer.
/// ---------------------------------------------------------------------------
class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  late final CustomerFormController controller;

  @override
  void initState() {
    super.initState();

    controller = CustomerFormController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _saveCustomer() {
    if (!controller.validate()) {
      return;
    }

    final customer = controller.toCustomer();

    context.read<CustomerProvider>().addCustomer(customer);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Add Customer',
      body: CustomerForm(controller: controller, onSave: _saveCustomer),
    );
  }
}
