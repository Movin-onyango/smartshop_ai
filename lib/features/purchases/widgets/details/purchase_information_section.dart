import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// PurchaseInformationSection
/// ---------------------------------------------------------------------------
///
/// Displays general purchase information.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseInformationSection extends StatelessWidget {
  const PurchaseInformationSection({super.key, required this.purchase});

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------
            Text(
              'Purchase Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Purchase Number
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.tag,
              title: 'Purchase Number',
              value: purchase.purchaseNumber,
            ),

            //------------------------------------------------------------------
            // Supplier
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.business,
              title: 'Supplier',
              value: purchase.supplierName,
            ),

            //------------------------------------------------------------------
            // Order Date
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.calendar_today,
              title: 'Order Date',
              value: _formatDate(purchase.orderDate),
            ),

            //------------------------------------------------------------------
            // Expected Delivery
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.local_shipping,
              title: 'Expected Delivery',
              value: purchase.expectedDeliveryDate == null
                  ? '-'
                  : _formatDate(purchase.expectedDeliveryDate!),
            ),

            //------------------------------------------------------------------
            // Received Date
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.inventory,
              title: 'Received Date',
              value: purchase.receivedDate == null
                  ? '-'
                  : _formatDate(purchase.receivedDate!),
            ),

            //------------------------------------------------------------------
            // Status
            //------------------------------------------------------------------
            _InformationTile(
              icon: Icons.flag,
              title: 'Status',
              value: purchase.status.name,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

/// ---------------------------------------------------------------------------
/// Information Tile
/// ---------------------------------------------------------------------------
class _InformationTile extends StatelessWidget {
  const _InformationTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(value),
    );
  }
}
