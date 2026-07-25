import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// AddressInformation
/// ---------------------------------------------------------------------------
///
/// Displays the supplier's physical address.
///
/// Used by:
/// • Supplier Details Screen
/// ---------------------------------------------------------------------------
class AddressInformation extends StatelessWidget {
  const AddressInformation({super.key, required this.supplier});

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    final address = supplier.address;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            if (address == null || address.isEmpty)
              const Text('No address information available.')
            else ...[
              _AddressRow(
                icon: Icons.location_city_outlined,
                label: 'Country',
                value: address.country,
              ),

              _AddressRow(
                icon: Icons.map_outlined,
                label: 'County',
                value: address.county,
              ),

              _AddressRow(
                icon: Icons.location_on_outlined,
                label: 'City',
                value: address.city,
              ),

              _AddressRow(
                icon: Icons.local_post_office_outlined,
                label: 'Postal Code',
                value: address.postalCode,
              ),

              _AddressRow(
                icon: Icons.signpost_outlined,
                label: 'Street',
                value: address.street,
              ),

              _AddressRow(
                icon: Icons.apartment_outlined,
                label: 'Building',
                value: address.building,
              ),

              _AddressRow(
                icon: Icons.place_outlined,
                label: 'Landmark',
                value: address.landmark,
              ),

              const Divider(height: 32),

              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.home_work_outlined),
                title: const Text('Full Address'),
                subtitle: Text(address.fullAddress),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Address Row
/// ---------------------------------------------------------------------------
class _AddressRow extends StatelessWidget {
  const _AddressRow({
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
