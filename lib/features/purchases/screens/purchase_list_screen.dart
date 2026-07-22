import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/purchase_provider.dart';

import '../widgets/list/purchase_card.dart';
import '../widgets/list/purchase_search_bar.dart';
import '../widgets/list/purchase_summary_tile.dart';

/// ---------------------------------------------------------------------------
/// PurchaseListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all purchase orders.
///
/// Features:
/// • Search
/// • Pull to Refresh
/// • Dashboard KPIs
/// • Navigation
/// ---------------------------------------------------------------------------
class PurchaseListScreen extends StatefulWidget {
  const PurchaseListScreen({
    super.key,
  });

  @override
  State<PurchaseListScreen> createState() =>
      _PurchaseListScreenState();
}

class _PurchaseListScreenState
    extends State<PurchaseListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<PurchaseProvider>()
          .loadPurchases();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseProvider>(
      builder: (
        context,
        provider,
        _,
      ) {
        final purchases =
            provider.purchases;

        return SmartScaffold(
          title: 'Purchases',

          floatingActionButton:
              FloatingActionButton.extended(
            onPressed: () {
              context.push(
                AppRoutes.addPurchase,
              );
            },
            icon: const Icon(Icons.add),
            label:
                const Text('New Purchase'),
          ),

          body: RefreshIndicator(
            onRefresh:
                provider.loadPurchases,

            child: ListView(
              padding:
                  const EdgeInsets.all(16),
              children: [
                //----------------------------------------------------------
                // Search
                //----------------------------------------------------------

                PurchaseSearchBar(
                  onChanged: (value) {
                    // TODO:
                    // Implement search in PurchaseProvider.
                  },
                ),

                const SizedBox(height: 24),

                //----------------------------------------------------------
                // KPIs
                //----------------------------------------------------------

                PurchaseSummaryTile(
                  title:
                      'Total Purchases',
                  value: provider
                      .totalPurchases
                      .toString(),
                  subtitle:
                      'Purchase Orders',
                  icon:
                      Icons.shopping_cart,
                  color: Colors.blue,
                ),

                const SizedBox(height: 12),

                PurchaseSummaryTile(
                  title:
                      'Pending Orders',
                  value: provider
                      .pendingPurchases
                      .toString(),
                  subtitle:
                      'Awaiting Delivery',
                  icon:
                      Icons.local_shipping,
                  color: Colors.orange,
                ),

                const SizedBox(height: 12),

                PurchaseSummaryTile(
                  title:
                      'Total Spend',
                  value: provider
                      .totalSpent
                      .toStringAsFixed(2),
                  subtitle:
                      'Overall Purchases',
                  icon:
                      Icons.payments,
                  color: Colors.green,
                ),

                const SizedBox(height: 24),

                //----------------------------------------------------------
                // Purchase List
                //----------------------------------------------------------

                if (purchases.isEmpty)
                  const Padding(
                    padding:
                        EdgeInsets.only(
                      top: 80,
                    ),
                    child: Center(
                      child: Text(
                        'No purchases found.',
                      ),
                    ),
                  )
                else
                  ...purchases.map(
                    (purchase) =>
                        Padding(
                      padding:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: PurchaseCard(
                        purchase:
                            purchase,
                        onTap: () {
                          context.push(
                            AppRoutes
                                .purchaseDetails(
                              purchase.id!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}