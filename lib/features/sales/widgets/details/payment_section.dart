import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// PaymentSection
/// ---------------------------------------------------------------------------
///
/// Displays payment information for a completed sale.
///
/// Responsibilities:
/// • Payment method
/// • Amount received
/// • Change given
/// • Reference number
/// • Notes
/// ---------------------------------------------------------------------------
class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
    required this.sale,
  });

  final Sale sale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final payment = sale.payment;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment',
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _row(
              context,
              'Method',
              _paymentMethod(payment.method.name),
            ),

            _row(
              context,
              'Amount Received',
              'KSh ${payment.amountReceived.toStringAsFixed(2)}',
            ),

            _row(
              context,
              'Amount Paid',
              'KSh ${sale.subtotal.toStringAsFixed(2)}',
            ),

            _row(
              context,
              'Change',
              'KSh ${payment.change.toStringAsFixed(2)}',
            ),

            if (payment.reference != null &&
                payment.reference!.isNotEmpty)
              _row(
                context,
                'Reference',
                payment.reference!,
              ),

            if (payment.notes != null &&
                payment.notes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notes',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      payment.notes!,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
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
    String value,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _paymentMethod(String method) {
    switch (method) {
      case 'cash':
        return 'Cash';
      case 'mpesa':
        return 'M-Pesa';
      case 'card':
        return 'Card';
      case 'bankTransfer':
        return 'Bank Transfer';
      case 'credit':
        return 'Credit';
      case 'mixed':
        return 'Mixed';
      default:
        return method;
    }
  }
}