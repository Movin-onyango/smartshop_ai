import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// CustomerAvatar
/// ---------------------------------------------------------------------------
///
/// Displays a customer's avatar.
///
/// Rules:
/// • Uses initials
/// • Uses theme colors
/// • Reusable across:
///   • Customer List
///   • Customer Details
///   • Sales
///   • Receipts
/// ---------------------------------------------------------------------------
class CustomerAvatar extends StatelessWidget {
  const CustomerAvatar({super.key, required this.customer, this.radius = 24});

  final Customer customer;

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(
        _initials,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  String get _initials {
    final parts = customer.name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty) {
      return '?';
    }

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return (parts.first[0] + parts.last[0]).toUpperCase();
  }
}
