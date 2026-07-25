/*import 'package:flutter/material.dart';

import '../../../suppliers/models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierInformationCard
/// ---------------------------------------------------------------------------
///
/// Displays supplier information for a purchase.
///
/// Used by:
/// • Purchase Details
/// ---------------------------------------------------------------------------
class SupplierInformationCard extends StatelessWidget {
  const SupplierInformationCard({
    super.key,
    required this.supplier,
  });

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Supplier Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            _InfoRow(
              icon: Icons.business,
              label: 'Supplier',
              value: supplier.businessName,
            ),

            _InfoRow(
              icon: Icons.person,
              label: 'Contact Person',
              value: supplier.contactPerson,
            ),

            _InfoRow(
              icon: Icons.phone,
              label: 'Phone',
              value: supplier.phoneNumber,
            ),

            _InfoRow(
              icon: Icons.email,
              label: 'Email',
              value: supplier.email,
            ),

            _InfoRow(
              icon: Icons.location_on,
              label: 'Address',
              value: supplier.address.fullAddress,
            ),

            _InfoRow(
              icon: Icons.credit_card,
              label: 'Payment Terms',
              value: supplier.paymentTerms.label,
            ),

            _InfoRow(
              icon: Icons.account_balance_wallet,
              label: 'Current Balance',
              value: supplier.currentBalance
                  .toStringAsFixed(2),
            ),

            _InfoRow(
              icon: Icons.attach_money,
              label: 'Credit Limit',
              value: supplier.creditLimit
                  .toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Information Row
/// ---------------------------------------------------------------------------
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              value.isEmpty
                  ? '-'
                  : value,
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}*/
