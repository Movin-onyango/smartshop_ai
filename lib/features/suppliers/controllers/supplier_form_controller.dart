import 'package:flutter/material.dart';

import '../models/supplier.dart';
import '../models/supplier_address.dart';
import '../models/supplier_statistics.dart';

/// ---------------------------------------------------------------------------
/// SupplierFormController
/// ---------------------------------------------------------------------------
///
/// Controls the Add/Edit Supplier form.
/// ---------------------------------------------------------------------------
class SupplierFormController {
  SupplierFormController();

  SupplierFormController.fromSupplier(
    Supplier supplier,
  ) {
    id = supplier.id;

    nameController.text = supplier.name;
    contactPersonController.text =
        supplier.contactPerson ?? '';

    phoneController.text =
        supplier.phone ?? '';

    emailController.text =
        supplier.email ?? '';

    taxNumberController.text =
        supplier.taxNumber ?? '';

    paymentTermsController.text =
        supplier.paymentTerms ?? '';

    notesController.text =
        supplier.notes ?? '';

    creditLimitController.text =
        supplier.creditLimit.toString();

    currentBalanceController.text =
        supplier.currentBalance.toString();

    if (supplier.address != null) {
      countryController.text =
          supplier.address!.country ?? '';

      countyController.text =
          supplier.address!.county ?? '';

      cityController.text =
          supplier.address!.city ?? '';

      postalCodeController.text =
          supplier.address!.postalCode ?? '';

      streetController.text =
          supplier.address!.street ?? '';

      buildingController.text =
          supplier.address!.building ?? '';

      landmarkController.text =
          supplier.address!.landmark ?? '';
    }
  }

  //---------------------------------------------------------------------------
  // Form
  //---------------------------------------------------------------------------

  final formKey = GlobalKey<FormState>();

  String? id;

  //---------------------------------------------------------------------------
  // Supplier Information
  //---------------------------------------------------------------------------

  final nameController =
      TextEditingController();

  final contactPersonController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Contact
  //---------------------------------------------------------------------------

  final phoneController =
      TextEditingController();

  final emailController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Address
  //---------------------------------------------------------------------------

  final countryController =
      TextEditingController();

  final countyController =
      TextEditingController();

  final cityController =
      TextEditingController();

  final postalCodeController =
      TextEditingController();

  final streetController =
      TextEditingController();

  final buildingController =
      TextEditingController();

  final landmarkController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Business
  //---------------------------------------------------------------------------

  final taxNumberController =
      TextEditingController();

  final paymentTermsController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Financial
  //---------------------------------------------------------------------------

  final creditLimitController =
      TextEditingController();

  final currentBalanceController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Notes
  //---------------------------------------------------------------------------

  final notesController =
      TextEditingController();

  //---------------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------------

  bool validate() {
    return formKey.currentState?.validate() ??
        false;
  }

  //---------------------------------------------------------------------------
  // Build Supplier
  //---------------------------------------------------------------------------

  Supplier toSupplier() {
    return Supplier(
      id: id,

      name: nameController.text.trim(),

      contactPerson:
          contactPersonController.text.trim(),

      phone: phoneController.text.trim(),

      email: emailController.text.trim(),

      taxNumber:
          taxNumberController.text.trim(),

      paymentTerms:
          paymentTermsController.text.trim(),

      notes: notesController.text.trim(),

      creditLimit: double.tryParse(
              creditLimitController.text) ??
          0,

      currentBalance: double.tryParse(
              currentBalanceController.text) ??
          0,

      address: SupplierAddress(
        country:
            countryController.text.trim(),

        county:
            countyController.text.trim(),

        city: cityController.text.trim(),

        postalCode:
            postalCodeController.text.trim(),

        street:
            streetController.text.trim(),

        building:
            buildingController.text.trim(),

        landmark:
            landmarkController.text.trim(),
      ),

      statistics:
          const SupplierStatistics(),

      createdAt: DateTime.now(),

      updatedAt: DateTime.now(),
    );
  }

  //---------------------------------------------------------------------------
  // Dispose
  //---------------------------------------------------------------------------

  void dispose() {
    nameController.dispose();
    contactPersonController.dispose();

    phoneController.dispose();
    emailController.dispose();

    countryController.dispose();
    countyController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    streetController.dispose();
    buildingController.dispose();
    landmarkController.dispose();

    taxNumberController.dispose();
    paymentTermsController.dispose();

    creditLimitController.dispose();
    currentBalanceController.dispose();

    notesController.dispose();
  }
}