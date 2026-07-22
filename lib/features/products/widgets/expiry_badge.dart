import 'package:flutter/material.dart';

/// Displays expiry information for a product.
class ExpiryBadge extends StatelessWidget {
  const ExpiryBadge({
    super.key,
    this.expiryDate,
  });

  final DateTime? expiryDate;

  @override
  Widget build(BuildContext context) {
    if (expiryDate == null) {
      return const SizedBox.shrink();
    }

    final daysRemaining = expiryDate!
        .difference(DateTime.now())
        .inDays;

    late final Color color;
    late final IconData icon;
    late final String text;

    if (daysRemaining < 0) {
      color = Colors.red;
      icon = Icons.error;
      text = 'Expired';
    } else if (daysRemaining <= 30) {
      color = Colors.orange;
      icon = Icons.schedule;
      text = '$daysRemaining days left';
    } else {
      color = Colors.green;
      icon = Icons.event_available;
      text = 'Expires later';
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
            text,
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