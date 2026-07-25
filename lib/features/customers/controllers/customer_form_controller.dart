import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../models/customer_statistics.dart';
import '../models/loyalty_account.dart';

/// ---------------------------------------------------------------------------
/// CustomerFormController
/// ---------------------------------------------------------------------------
///
/// Controls the Add/Edit Customer form.
///
/// Responsibilities
/// • Manage form controllers
/// • Validate input
/// • Build Customer model
/// ---------------------------------------------------------------------------
class CustomerFormController extends ChangeNotifier {
  CustomerFormController({Customer? customer}) {
    if (customer != null) {
      loadCustomer(customer);
    }
  }

  //---------------------------------------------------------------------------
  // Form
  //---------------------------------------------------------------------------

  final formKey = GlobalKey<FormState>();

  //---------------------------------------------------------------------------
  // Controllers
  //---------------------------------------------------------------------------

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final notesController = TextEditingController();

  final creditLimitController = TextEditingController();

  //---------------------------------------------------------------------------
  // Loyalty
  //---------------------------------------------------------------------------

  bool hasLoyalty = false;

  final loyaltyPointsController = TextEditingController();

  LoyaltyTier loyaltyTier = LoyaltyTier.standard;

  /// Enable or disable loyalty account.
  void setHasLoyalty(bool value) {
    hasLoyalty = value;
    notifyListeners();
  }

  /// Update the selected loyalty tier.
  void setLoyaltyTier(LoyaltyTier value) {
    loyaltyTier = value;
    notifyListeners();
  }

  //---------------------------------------------------------------------------
  // Existing Customer
  //---------------------------------------------------------------------------

  String? customerId;

  DateTime? createdAt;

  //---------------------------------------------------------------------------
  // Load Existing Customer
  //---------------------------------------------------------------------------

  void loadCustomer(Customer customer) {
    customerId = customer.id;

    createdAt = customer.createdAt;

    nameController.text = customer.name;

    phoneController.text = customer.phone ?? '';

    emailController.text = customer.email ?? '';

    addressController.text = customer.address ?? '';

    notesController.text = customer.notes ?? '';

    creditLimitController.text = customer.creditLimit.toString();

    if (customer.loyaltyAccount != null) {
      hasLoyalty = true;

      loyaltyPointsController.text = customer.loyaltyAccount!.points.toString();

      loyaltyTier = customer.loyaltyAccount!.tier;
    }
  }

  //---------------------------------------------------------------------------
  // Validation
  //---------------------------------------------------------------------------

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  //---------------------------------------------------------------------------
  // Build Customer
  //---------------------------------------------------------------------------

  Customer toCustomer() {
    return Customer(
      id: customerId,
      name: nameController.text.trim(),
      phone: phoneController.text.trim().isEmpty
          ? null
          : phoneController.text.trim(),
      email: emailController.text.trim().isEmpty
          ? null
          : emailController.text.trim(),
      address: addressController.text.trim().isEmpty
          ? null
          : addressController.text.trim(),
      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),
      creditLimit: double.tryParse(creditLimitController.text) ?? 0,
      statistics: const CustomerStatistics(),
      loyaltyAccount: hasLoyalty
          ? LoyaltyAccount(
              points: int.tryParse(loyaltyPointsController.text) ?? 0,
              tier: loyaltyTier,
            )
          : null,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  //---------------------------------------------------------------------------
  // Dispose
  //---------------------------------------------------------------------------

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    notesController.dispose();
    creditLimitController.dispose();
    loyaltyPointsController.dispose();

    super.dispose();
  }
}
