import 'package:flutter/material.dart';

class ReceiptHeader extends StatelessWidget {
  const ReceiptHeader({
    super.key,
    required this.shopName,
    required this.invoiceNumber,
    required this.saleDate,
  });

  final String shopName;
  final String invoiceNumber;
  final DateTime saleDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          shopName,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        Text(
          'Invoice: $invoiceNumber',
          style: theme.textTheme.bodyMedium,
        ),

        const SizedBox(height: 4),

        Text(
          saleDate.toString(),
          style: theme.textTheme.bodySmall,
        ),

        const Divider(height: 32),
      ],
    );
  }
}