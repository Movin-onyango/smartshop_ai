import 'package:flutter/material.dart';

import '../../controllers/customer_form_controller.dart';

/// ---------------------------------------------------------------------------
/// CreditInformationCard
/// ---------------------------------------------------------------------------
///
/// Credit settings for the customer.
/// ---------------------------------------------------------------------------
class CreditInformationCard extends StatelessWidget {
  const CreditInformationCard({super.key, required this.controller});

  final CustomerFormController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            TextFormField(
              controller: controller.creditLimitController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Credit Limit',
                prefixIcon: Icon(Icons.credit_card),
                prefixText: 'KES ',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return null;
                }

                if (double.tryParse(value) == null) {
                  return 'Enter a valid amount';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            Text(
              'Leave the credit limit empty or set it to 0 if this customer is not allowed to purchase on credit.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
