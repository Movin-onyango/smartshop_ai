import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseEmptyState
/// ---------------------------------------------------------------------------
///
/// Displayed when no purchases are available.
///
/// Used by:
/// • PurchaseListScreen
/// • Search Results
/// ---------------------------------------------------------------------------
class PurchaseEmptyState extends StatelessWidget {
  const PurchaseEmptyState({
    super.key,
    this.message = 'No purchases found.',
    this.onRefresh,
  });

  final String message;

  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //------------------------------------------------------------------
            // Icon
            //------------------------------------------------------------------
            Icon(
              Icons.receipt_long_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Title
            //------------------------------------------------------------------
            Text(
              'No Purchases',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 12),

            //------------------------------------------------------------------
            // Message
            //------------------------------------------------------------------
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            if (onRefresh != null) ...[
              const SizedBox(height: 24),

              FilledButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
