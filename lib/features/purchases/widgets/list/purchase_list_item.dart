import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import '../../models/purchase_status.dart';

/// ---------------------------------------------------------------------------
/// PurchaseListItem
/// ---------------------------------------------------------------------------
///
/// Displays a purchase in a reusable card.
///
/// Used by:
/// • PurchaseListScreen
/// • Dashboard
/// • Reports
/// • Search Results
/// ---------------------------------------------------------------------------
class PurchaseListItem extends StatelessWidget {
  const PurchaseListItem({super.key, required this.purchase, this.onTap});

  final Purchase purchase;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
                    child: Text(
                      purchase.purchaseNumber,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),

                  _StatusChip(purchase: purchase),
                ],
              ),

              const SizedBox(height: 12),

              //----------------------------------------------------------------
              // Supplier
              //----------------------------------------------------------------
              Row(
                children: [
                  const Icon(Icons.business, size: 18),

                  const SizedBox(width: 8),

                  Expanded(child: Text(purchase.supplierName)),
                ],
              ),

              const SizedBox(height: 8),

              //----------------------------------------------------------------
              // Order Date
              //----------------------------------------------------------------
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 18),

                  const SizedBox(width: 8),

                  Text(_formatDate(purchase.orderDate)),
                ],
              ),

              const SizedBox(height: 16),

              //----------------------------------------------------------------
              // Footer
              //----------------------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: _InfoTile(
                      title: 'Items',
                      value: purchase.totalItems.toString(),
                    ),
                  ),

                  Expanded(
                    child: _InfoTile(
                      title: 'Quantity',
                      value: purchase.totalQuantity.toStringAsFixed(0),
                    ),
                  ),

                  Expanded(
                    child: _InfoTile(
                      title: 'Total',
                      value: purchase.grandTotal.toStringAsFixed(2),
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

  static String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

/// ---------------------------------------------------------------------------
/// _InfoTile
/// ---------------------------------------------------------------------------
class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.title, required this.value});

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: Theme.of(context).textTheme.titleMedium),

        const SizedBox(height: 4),

        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// _StatusChip
/// ---------------------------------------------------------------------------
class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.purchase});

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (purchase.status) {
      case PurchaseStatus.draft:
        color = Colors.grey;
        break;

      case PurchaseStatus.pendingApproval:
        color = Colors.brown;
        break;

      case PurchaseStatus.ordered:
        color = Colors.orange;
        break;

      case PurchaseStatus.partial:
        color = Colors.blue;
        break;

      case PurchaseStatus.received:
        color = Colors.green;
        break;

      case PurchaseStatus.cancelled:
        color = Colors.red;
        break;
    }

    return Chip(
      backgroundColor: color.withValues(alpha: 0.15),
      side: BorderSide.none,
      label: Text(
        purchase.status.name.toUpperCase(),
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
