import 'package:flutter/material.dart';

/// Displays the stock status of a product.
class StockBadge extends StatelessWidget {
  const StockBadge({
    super.key,
    required this.quantity,
  });

  final int quantity;

  @override
  Widget build(BuildContext context) {
    late final Color color;
    late final IconData icon;
    late final String label;

    if (quantity <= 0) {
      color = Colors.red;
      icon = Icons.cancel;
      label = 'Out of Stock';
    } else if (quantity <= 5) {
      color = Colors.orange;
      icon = Icons.warning_amber_rounded;
      label = 'Low Stock';
    } else {
      color = Colors.green;
      icon = Icons.check_circle;
      label = 'In Stock';
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}