import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// SupplierCard
/// ---------------------------------------------------------------------------
///
/// Displays supplier information for a purchase.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class SupplierCard extends StatelessWidget {
  const SupplierCard({
    super.key,
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            //------------------------------------------------------------------
            // Title
            //------------------------------------------------------------------

            Text(
              'Supplier',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Supplier Name
            //------------------------------------------------------------------

            ListTile(
              contentPadding:
                  EdgeInsets.zero,
              leading: const CircleAvatar(
                child: Icon(
                  Icons.business,
                ),
              ),
              title: Text(
                purchase.supplierName,
              ),
              subtitle: Text(
                'Supplier ID: ${purchase.supplierId}',
              ),
            ),

            const Divider(),

            //------------------------------------------------------------------
            // Purchase Number
            //------------------------------------------------------------------

            _InfoRow(
              icon: Icons.receipt_long,
              label: 'Purchase No.',
              value:
                  purchase.purchaseNumber,
            ),

            //------------------------------------------------------------------
            // Total Items
            //------------------------------------------------------------------

            _InfoRow(
              icon: Icons.inventory_2,
              label: 'Products',
              value:
                  purchase.totalItems.toString(),
            ),

            //------------------------------------------------------------------
            // Total Quantity
            //------------------------------------------------------------------

            _InfoRow(
              icon: Icons.shopping_cart,
              label: 'Total Quantity',
              value: purchase
                  .totalQuantity
                  .toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// _InfoRow
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
        children: [
          Icon(
            icon,
            size: 20,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(label),
          ),

          Text(
            value,
            style: const TextStyle(
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}