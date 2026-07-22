import 'package:flutter/material.dart';

import '../../models/customer.dart';

/// ---------------------------------------------------------------------------
/// CustomerStatusBadges
/// ---------------------------------------------------------------------------
///
/// Displays quick status badges for a customer.
/// ---------------------------------------------------------------------------
class CustomerStatusBadges extends StatelessWidget {
  const CustomerStatusBadges({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final badges = <Widget>[];

    // Credit Customer
    if (customer.creditLimit > 0) {
      badges.add(
        Chip(
          avatar: const Icon(
            Icons.credit_card,
            size: 16,
          ),
          label: const Text(
            'Credit',
          ),
        ),
      );
    }

    // Outstanding Balance
    if (customer.currentBalance > 0) {
      badges.add(
        Chip(
          avatar: const Icon(
            Icons.account_balance_wallet,
            size: 16,
          ),
          label: Text(
            'KES ${customer.currentBalance.toStringAsFixed(0)}',
          ),
        ),
      );
    }

    // Loyalty Member
    if (customer.loyaltyAccount != null) {
      badges.add(
        Chip(
          avatar: const Icon(
            Icons.workspace_premium,
            size: 16,
          ),
          label: Text(
            customer.loyaltyAccount!.tier.name
                .toUpperCase(),
          ),
        ),
      );
    }

    // Frequent Customer
    if (customer.totalPurchases >= 10) {
      badges.add(
        const Chip(
          avatar: Icon(
            Icons.star,
            size: 16,
          ),
          label: Text(
            'Frequent',
          ),
        ),
      );
    }

    if (badges.isEmpty) {
      return const SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: badges,
    );
  }
}