import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierHeader
/// ---------------------------------------------------------------------------
///
/// Header displayed at the top of the Supplier Details screen.
/// ---------------------------------------------------------------------------
class SupplierHeader extends StatelessWidget {
  const SupplierHeader({super.key, required this.supplier});

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 34,
              child: Text(
                supplier.name.substring(0, 1).toUpperCase(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    supplier.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  if (supplier.contactPerson != null &&
                      supplier.contactPerson!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        supplier.contactPerson!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),

                  if (supplier.email != null && supplier.email!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined, size: 18),

                          const SizedBox(width: 8),

                          Expanded(child: Text(supplier.email!)),
                        ],
                      ),
                    ),

                  if (supplier.phone != null && supplier.phone!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.phone_outlined, size: 18),

                          const SizedBox(width: 8),

                          Text(supplier.phone!),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
