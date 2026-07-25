import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// Contact Information
/// ---------------------------------------------------------------------------
///
/// Displays the customer's contact information.
/// ---------------------------------------------------------------------------
class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key, required this.customer});

  final Customer customer;

  Widget _infoTile({
    required IconData icon,
    required String label,
    required String? value,
  }) {
    if (value == null || value.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 4),

                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }

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

            const SizedBox(height: 24),

            _infoTile(icon: Icons.phone, label: 'Phone', value: customer.phone),

            _infoTile(icon: Icons.email, label: 'Email', value: customer.email),

            _infoTile(
              icon: Icons.location_on,
              label: 'Address',
              value: customer.address,
            ),

            _infoTile(icon: Icons.note, label: 'Notes', value: customer.notes),
          ],
        ),
      ),
    );
  }
}
