import 'package:flutter/material.dart';

import '../../models/supplier.dart';

/// ---------------------------------------------------------------------------
/// SupplierStatusBadges
/// ---------------------------------------------------------------------------
///
/// Displays supplier status indicators.
///
/// Badges include:
/// • Outstanding Balance
/// • Credit Available
/// • Over Credit Limit
/// ---------------------------------------------------------------------------
class SupplierStatusBadges extends StatelessWidget {
  const SupplierStatusBadges({
    super.key,
    required this.supplier,
  });

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        if (supplier.hasOutstandingBalance)
          _Badge(
            icon: Icons.account_balance_wallet_outlined,
            label:
                'Balance ${supplier.currentBalance.toStringAsFixed(2)}',
            color: Colors.orange,
          ),

        if (supplier.hasCredit)
          _Badge(
            icon: Icons.credit_score,
            label:
                'Credit ${supplier.creditLimit.toStringAsFixed(0)}',
            color: Colors.blue,
          ),

        if (supplier.isOverLimit)
          const _Badge(
            icon: Icons.warning_amber_rounded,
            label: 'Over Limit',
            color: Colors.red,
          ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// Badge Widget
/// ---------------------------------------------------------------------------
class _Badge extends StatelessWidget {
  const _Badge({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),

          const SizedBox(width: 4),

          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}