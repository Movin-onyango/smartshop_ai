import 'package:flutter/material.dart';

import '../../models/purchase.dart';

/// ---------------------------------------------------------------------------
/// PurchaseHeader
/// ---------------------------------------------------------------------------
///
/// Displays the purchase number, supplier name and status.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseHeader extends StatelessWidget {
  const PurchaseHeader({
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
            Text(
              purchase.purchaseNumber,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
            ),

            const SizedBox(height: 8),

            Text(
              purchase.supplierName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Chip(
                  label: Text(
                    purchase.status.name
                        .toUpperCase(),
                  ),
                ),

                const Spacer(),

                Text(
                  '${purchase.totalItems} item${purchase.totalItems == 1 ? '' : 's'}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}