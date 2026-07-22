import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// EmptyInventory
/// ---------------------------------------------------------------------------
///
/// Displayed when there are no inventory records.
///
/// This widget is reused throughout the Inventory module whenever
/// the inventory list is empty.
/// ---------------------------------------------------------------------------
class EmptyInventory extends StatelessWidget {
  const EmptyInventory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 48,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 72,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 24),

            Text(
              'No Inventory Available',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            Text(
              'Products will automatically appear here once they are added to the product catalog.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: Colors.grey.shade600,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}