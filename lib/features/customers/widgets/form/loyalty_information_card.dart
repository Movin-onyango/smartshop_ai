import 'package:flutter/material.dart';

import '../../controllers/customer_form_controller.dart';
import '../../models/loyalty_account.dart';

/// ---------------------------------------------------------------------------
/// LoyaltyInformationCard
/// ---------------------------------------------------------------------------
///
/// Configure customer loyalty membership.
/// ---------------------------------------------------------------------------
class LoyaltyInformationCard extends StatelessWidget {
  const LoyaltyInformationCard({super.key, required this.controller});

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
              'Loyalty Program',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 24),

            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Enroll in Loyalty Program'),
              subtitle: const Text(
                'Customer earns reward points from purchases.',
              ),
              value: controller.hasLoyalty,
              onChanged: (value) {
                controller.setHasLoyalty(value);
              },
            ),

            if (controller.hasLoyalty) ...[
              const SizedBox(height: 24),

              TextFormField(
                controller: controller.loyaltyPointsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Starting Points',
                  prefixIcon: Icon(Icons.stars),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  if (int.tryParse(value) == null) {
                    return 'Enter a valid number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 24),

              DropdownButtonFormField<LoyaltyTier>(
                initialValue: controller.loyaltyTier,
                decoration: const InputDecoration(
                  labelText: 'Membership Tier',
                  prefixIcon: Icon(Icons.workspace_premium),
                ),
                items: LoyaltyTier.values.map((tier) {
                  return DropdownMenuItem(
                    value: tier,
                    child: Text(tier.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.setLoyaltyTier(value);
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
