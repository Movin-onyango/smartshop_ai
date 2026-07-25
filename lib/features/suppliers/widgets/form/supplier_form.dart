import 'package:flutter/material.dart';

import '../../controllers/supplier_form_controller.dart';

import 'supplier_information_card.dart';
import 'contact_information_card.dart';
import 'address_information_card.dart';
import 'financial_information_card.dart';
import 'notes_card.dart';
import 'supplier_form_actions.dart';

/// ---------------------------------------------------------------------------
/// SupplierForm
/// ---------------------------------------------------------------------------
///
/// Reusable supplier form.
///
/// Used by:
/// • Add Supplier Screen
/// • Edit Supplier Screen
/// ---------------------------------------------------------------------------
class SupplierForm extends StatelessWidget {
  const SupplierForm({
    super.key,
    required this.controller,
    required this.onSave,
    this.onCancel,
    this.saveLabel = 'Save Supplier',
  });

  final SupplierFormController controller;

  final VoidCallback onSave;

  final VoidCallback? onCancel;

  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SupplierInformationCard(
              nameController: controller.nameController,
              contactPersonController: controller.contactPersonController,
            ),

            const SizedBox(height: 24),

            ContactInformationCard(
              phoneController: controller.phoneController,
              emailController: controller.emailController,
              taxNumberController: controller.taxNumberController,
              paymentTermsController: controller.paymentTermsController,
            ),

            const SizedBox(height: 24),

            AddressInformationCard(
              countryController: controller.countryController,
              countyController: controller.countyController,
              cityController: controller.cityController,
              postalCodeController: controller.postalCodeController,
              streetController: controller.streetController,
              buildingController: controller.buildingController,
              landmarkController: controller.landmarkController,
            ),

            const SizedBox(height: 24),

            FinancialInformationCard(
              creditLimitController: controller.creditLimitController,
              currentBalanceController: controller.currentBalanceController,
            ),

            const SizedBox(height: 24),

            NotesCard(notesController: controller.notesController),

            const SizedBox(height: 32),

            SupplierFormActions(
              onSave: onSave,
              onCancel: onCancel,
              saveLabel: saveLabel,
            ),
          ],
        ),
      ),
    );
  }
}
