import 'package:flutter/material.dart';

import '../../controllers/checkout_controller.dart';
import '../../controllers/sale_form_controller.dart';

/// ---------------------------------------------------------------------------
/// CheckoutTotals
/// ---------------------------------------------------------------------------
///
/// Displays the financial summary during checkout.
///
/// Responsibilities:
/// • Sale Total
/// • Amount Received
/// • Change
/// • Outstanding Balance
/// ---------------------------------------------------------------------------
class CheckoutTotals extends StatelessWidget {
  const CheckoutTotals({
    super.key,
    required this.saleController,
    required this.checkoutController,
  });

  final SaleFormController saleController;
  final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final total = saleController.subtotal;
    final amountReceived = checkoutController.amountReceived;
    final change = checkoutController.change(total);
    final balance = checkoutController.balance(total);

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            _row(
              context,
              'Total Payable',
              'KSh ${total.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _row(
              context,
              'Amount Received',
              'KSh ${amountReceived.toStringAsFixed(2)}',
            ),

            const Divider(height: 24),

            _row(
              context,
              'Change',
              'KSh ${change.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _row(
              context,
              'Outstanding Balance',
              'KSh ${balance.toStringAsFixed(2)}',
              valueStyle: theme.textTheme.titleMedium?.copyWith(
                color: balance > 0
                    ? theme.colorScheme.error
                    : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value, {
    TextStyle? valueStyle,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Text(
          value,
          style: valueStyle ??
              theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}