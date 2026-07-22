import 'package:flutter/material.dart';

import '../../models/payment.dart';

/// ---------------------------------------------------------------------------
/// PaymentSelector
/// ---------------------------------------------------------------------------
///
/// Allows the cashier to select a payment method.
///
/// Responsibilities:
/// • Select payment method
/// • Display payment icon
/// • Notify parent of changes
/// ---------------------------------------------------------------------------
class PaymentSelector extends StatelessWidget {
  const PaymentSelector({
    super.key,
    required this.method,
    required this.onChanged,
  });

  final PaymentMethod method;
  final ValueChanged<PaymentMethod?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<PaymentMethod>(
              initialValue: method,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.payments),
                border: OutlineInputBorder(),
              ),
              onChanged: onChanged,
              items: PaymentMethod.values
                  .map(
                    (paymentMethod) =>
                        DropdownMenuItem(
                      value: paymentMethod,
                      child: Row(
                        children: [
                          Icon(
                            _icon(paymentMethod),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            _label(paymentMethod),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  static IconData _icon(
    PaymentMethod method,
  ) {
    switch (method) {
      case PaymentMethod.cash:
        return Icons.payments;

      case PaymentMethod.mpesa:
        return Icons.phone_android;

      case PaymentMethod.card:
        return Icons.credit_card;

      case PaymentMethod.bankTransfer:
        return Icons.account_balance;

      case PaymentMethod.credit:
        return Icons.request_quote;

      case PaymentMethod.mixed:
        return Icons.account_tree;
    }
  }

  static String _label(
    PaymentMethod method,
  ) {
    switch (method) {
      case PaymentMethod.cash:
        return 'Cash';

      case PaymentMethod.mpesa:
        return 'M-Pesa';

      case PaymentMethod.card:
        return 'Card';

      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';

      case PaymentMethod.credit:
        return 'Credit';

      case PaymentMethod.mixed:
        return 'Mixed Payment';
    }
  }
}