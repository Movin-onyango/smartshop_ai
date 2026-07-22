import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';

/// ---------------------------------------------------------------------------
/// EmptySales
/// ---------------------------------------------------------------------------
///
/// Displayed when there are no recorded sales.
///
/// Encourages the user to record their first sale.
/// ---------------------------------------------------------------------------
class EmptySales extends StatelessWidget {
  const EmptySales({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.point_of_sale_outlined,
              size: 96,
              color: Theme.of(context)
                  .colorScheme
                  .primary,
            ),

            const SizedBox(height: 24),

            Text(
              'No Sales Yet',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              'Record your first sale to start tracking revenue, '
              'profit and business performance.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: () {
                context.push(AppRoutes.addSale);
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Create First Sale'),
            ),
          ],
        ),
      ),
    );
  }
}