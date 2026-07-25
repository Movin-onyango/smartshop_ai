import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SupplierInformationCard
/// ---------------------------------------------------------------------------
///
/// Primary supplier information.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class SupplierInformationCard extends StatelessWidget {
  const SupplierInformationCard({
    super.key,
    required this.nameController,
    required this.contactPersonController,
  });

  final TextEditingController nameController;

  final TextEditingController contactPersonController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Supplier Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Supplier Name
            //------------------------------------------------------------------
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Supplier Name',
                hintText: 'Enter supplier name',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Supplier name is required';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Contact Person
            //------------------------------------------------------------------
            TextFormField(
              controller: contactPersonController,
              decoration: const InputDecoration(
                labelText: 'Contact Person',
                hintText: 'Primary contact person',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
          ],
        ),
      ),
    );
  }
}
