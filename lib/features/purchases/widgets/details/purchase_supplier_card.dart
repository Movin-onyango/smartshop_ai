import 'package:flutter/material.dart';

class PurchaseSupplierCard extends StatelessWidget {
  const PurchaseSupplierCard({
    super.key,
    required this.supplierName,
    required this.supplierId,
  });

  final String supplierName;
  final String supplierId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Supplier', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(child: Icon(Icons.business)),
              title: Text(supplierName),
              subtitle: Text('Supplier ID: $supplierId'),
            ),
          ],
        ),
      ),
    );
  }
}
