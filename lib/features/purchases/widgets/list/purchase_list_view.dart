import 'package:flutter/material.dart';

import '../../models/purchase.dart';
import 'purchase_empty_state.dart';
import 'purchase_list_item.dart';

/// ---------------------------------------------------------------------------
/// PurchaseListView
/// ---------------------------------------------------------------------------
///
/// Reusable purchase list.
///
/// Used by:
/// • PurchaseListScreen
/// • Dashboard
/// • Reports
/// • Search Results
/// ---------------------------------------------------------------------------
class PurchaseListView extends StatelessWidget {
  const PurchaseListView({
    super.key,
    required this.purchases,
    required this.onRefresh,
    required this.onPurchaseTap,
    this.emptyMessage = 'No purchases found.',
  });

  final List<Purchase> purchases;

  final Future<void> Function() onRefresh;

  final ValueChanged<Purchase> onPurchaseTap;

  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    if (purchases.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              child: PurchaseEmptyState(message: emptyMessage),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          final purchase = purchases[index];

          return PurchaseListItem(
            purchase: purchase,
            onTap: () => onPurchaseTap(purchase),
          );
        },
      ),
    );
  }
}
