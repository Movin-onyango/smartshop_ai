import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/router/app_routes.dart';
import '../../models/purchase.dart';
import '../../providers/purchase_provider.dart';

/// ---------------------------------------------------------------------------
/// PurchaseActionsCard
/// ---------------------------------------------------------------------------
///
/// Purchase action buttons.
///
/// Used by:
/// • PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
class PurchaseActionsCard extends StatelessWidget {
  const PurchaseActionsCard({
    super.key,
    required this.purchase,
  });

  final Purchase purchase;

  @override
  Widget build(BuildContext context) {
    final provider =
        context.read<PurchaseProvider>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [
            Text(
              'Actions',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Edit Purchase
            //------------------------------------------------------------------

            FilledButton.icon(
              onPressed: () {
                context.push(
                  AppRoutes.editPurchase(
                    purchase.id!,
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text(
                'Edit Purchase',
              ),
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Receive Purchase
            //------------------------------------------------------------------

            FilledButton.icon(
              onPressed:
                  purchase.isFullyReceived
                      ? null
                      : () {
                          context.push(
                            AppRoutes
                                .receivePurchase(
                              purchase.id!,
                            ),
                          );
                        },
              icon: const Icon(
                Icons.inventory,
              ),
              label: const Text(
                'Receive Stock',
              ),
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Cancel Purchase
            //------------------------------------------------------------------

            OutlinedButton.icon(
              onPressed: () =>
                  _cancelPurchase(
                context,
                provider,
              ),
              icon: const Icon(
                Icons.cancel_outlined,
              ),
              label: const Text(
                'Cancel Purchase',
              ),
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Delete Purchase
            //------------------------------------------------------------------

            FilledButton.tonalIcon(
              onPressed: () =>
                  _deletePurchase(
                context,
                provider,
              ),
              icon: const Icon(Icons.delete),
              label: const Text(
                'Delete Purchase',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---------------------------------------------------------------------------
  // Delete
  //---------------------------------------------------------------------------

  Future<void> _deletePurchase(
    BuildContext context,
    PurchaseProvider provider,
  ) async {
    final confirmed =
        await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Delete Purchase',
                  ),
                  content: const Text(
                    'Delete this purchase permanently?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(
                        context,
                        false,
                      ),
                      child:
                          const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () =>
                          Navigator.pop(
                        context,
                        true,
                      ),
                      child:
                          const Text('Delete'),
                    ),
                  ],
                );
              },
            ) ??
            false;

    if (!confirmed) return;

    await provider.deletePurchase(
      purchase.id!,
    );

    if (context.mounted) {
      context.pop();
    }
  }

  //---------------------------------------------------------------------------
  // Cancel
  //---------------------------------------------------------------------------

  Future<void> _cancelPurchase(
    BuildContext context,
    PurchaseProvider provider,
  ) async {
    final confirmed =
        await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Cancel Purchase',
                  ),
                  content: const Text(
                    'Cancel this purchase?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(
                        context,
                        false,
                      ),
                      child:
                          const Text('No'),
                    ),
                    FilledButton(
                      onPressed: () =>
                          Navigator.pop(
                        context,
                        true,
                      ),
                      child:
                          const Text('Yes'),
                    ),
                  ],
                );
              },
            ) ??
            false;

    if (!confirmed) return;

    await provider.cancelPurchase(
      purchase.id!,
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'Purchase cancelled.',
          ),
        ),
      );
    }
  }
}