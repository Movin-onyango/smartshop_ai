import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// FinancialInformationCard
/// ---------------------------------------------------------------------------
///
/// Supplier financial information.
///
/// Used by:
/// • Add Supplier
/// • Edit Supplier
/// ---------------------------------------------------------------------------
class FinancialInformationCard extends StatelessWidget {
  const FinancialInformationCard({
    super.key,
    required this.creditLimitController,
    required this.currentBalanceController,
  });

  final TextEditingController creditLimitController;

  final TextEditingController currentBalanceController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Financial Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Credit Limit
            //------------------------------------------------------------------
            TextFormField(
              controller: creditLimitController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Credit Limit',
                hintText: '0.00',
                prefixIcon: Icon(Icons.credit_score_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Current Balance
            //------------------------------------------------------------------
            TextFormField(
              controller: currentBalanceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Current Balance',
                hintText: '0.00',
                prefixIcon: Icon(Icons.account_balance_wallet_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Credit limits help track outstanding supplier balances. '
                      'Leave both values as 0.00 if purchases are always paid immediately.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
