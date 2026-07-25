import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import 'purchase_status_badge.dart';

/// ---------------------------------------------------------------------------
/// PurchaseCard
/// ---------------------------------------------------------------------------
///
/// Reusable purchase order card.
///
/// Used by:
/// • Purchase List
/// • Search Results
/// • Dashboard Recent Purchases
/// ---------------------------------------------------------------------------
class PurchaseCard extends StatelessWidget {
  const PurchaseCard({super.key, required this.purchase, this.onTap});

  final Purchase purchase;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------------------------------------------------------
              // Header
              //----------------------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          purchase.purchaseNumber,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          purchase.supplierName,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  PurchaseStatusBadge(status: purchase.status),
                ],
              ),

              const SizedBox(height: 16),

              //----------------------------------------------------------------
              // Details
              //----------------------------------------------------------------
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18),
                  const SizedBox(width: 8),
                  Text(purchase.orderDate.toIso8601String().split('T').first),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.inventory_2, size: 18),
                  const SizedBox(width: 8),
                  Text('${purchase.totalItems} item(s)'),
                ],
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.shopping_cart, size: 18),
                  const SizedBox(width: 8),
                  Text(purchase.totalQuantity.toStringAsFixed(0)),
                ],
              ),

              const Divider(height: 24),

              //----------------------------------------------------------------
              // Footer
              //----------------------------------------------------------------
              Row(
                children: [
                  Text('Grand Total', style: theme.textTheme.titleSmall),
                  const Spacer(),
                  Text(
                    purchase.grandTotal.toStringAsFixed(2),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
