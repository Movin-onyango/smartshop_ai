import 'package:flutter/material.dart';

import '../../models/sale_item.dart';

class ReceiptItems extends StatelessWidget {
  const ReceiptItems({
    super.key,
    required this.items,
  });

  final List<SaleItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(item.product.name),
              ),
              Text(
                '${item.quantity} × ${item.unitPrice.toStringAsFixed(2)}',
              ),
              const SizedBox(width: 16),
              Text(
                item.subtotal.toStringAsFixed(2),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}