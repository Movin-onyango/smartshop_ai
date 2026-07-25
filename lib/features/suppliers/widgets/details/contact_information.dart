import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// ContactInformation
/// ---------------------------------------------------------------------------
///
/// Displays supplier contact and business information.
///
/// Used by:
/// • Supplier Details Screen
/// ---------------------------------------------------------------------------
class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key, required this.supplier});

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _InfoRow(
              icon: Icons.person_outline,
              label: 'Contact Person',
              value: supplier.contactPerson,
            ),

            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: supplier.phone,
            ),

            _InfoRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: supplier.email,
            ),

            _InfoRow(
              icon: Icons.badge_outlined,
              label: 'Tax Number',
              value: supplier.taxNumber,
            ),

            _InfoRow(
              icon: Icons.payments_outlined,
              label: 'Payment Terms',
              value: supplier.paymentTerms,
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
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelMedium),

                const SizedBox(height: 2),

                Text(value!, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
