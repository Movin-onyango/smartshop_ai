import 'package:flutter/material.dart';

import '../../controllers/customer_form_controller.dart';

import 'contact_information_card.dart';
import 'credit_information_card.dart';
import 'customer_form_actions.dart';
import 'customer_information_card.dart';
import 'loyalty_information_card.dart';
import 'notes_card.dart';

/// ---------------------------------------------------------------------------
/// Customer Form
/// ---------------------------------------------------------------------------
///
/// Shared customer form used by:
///
/// • Add Customer
/// • Edit Customer
/// ---------------------------------------------------------------------------
class CustomerForm extends StatelessWidget {
  const CustomerForm({
    super.key,
    required this.controller,
    required this.onSave,
    this.onCancel,
  });

  final CustomerFormController controller;

  final VoidCallback onSave;

  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [

                CustomerInformationCard(
                  controller: controller,
                ),

                const SizedBox(height: 24),

                ContactInformationCard(
                  controller: controller,
                ),

                const SizedBox(height: 24),

                CreditInformationCard(
                  controller: controller,
                ),

                const SizedBox(height: 24),

                LoyaltyInformationCard(
                  controller: controller,
                ),

                const SizedBox(height: 24),

                NotesCard(
                  controller: controller,
                ),

                const SizedBox(height: 32),

                CustomerFormActions(
                  onSave: onSave,
                  onCancel: onCancel,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}