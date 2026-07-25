import 'package:flutter/material.dart';

class ReceiptTotals extends StatelessWidget {
  const ReceiptTotals({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.total,
    required this.amountPaid,
    required this.change,
  });

  final double subtotal;
  final double discount;
  final double total;
  final double amountPaid;
  final double change;

  Widget _row(String label, double value) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        Text(value.toStringAsFixed(2)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),

        _row('Subtotal', subtotal),

        _row('Discount', discount),

        const Divider(),

        _row('Total', total),

        _row('Paid', amountPaid),

        _row('Change', change),
      ],
    );
  }
}
