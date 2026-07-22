import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// PurchaseValueTile
/// ---------------------------------------------------------------------------
///
/// Displays a label/value pair used throughout the Purchases module.
///
/// Used by:
/// • PurchaseItemCard
/// • PurchaseSummarySection
/// • PurchaseReports
/// • Print Preview
/// ---------------------------------------------------------------------------
class PurchaseValueTile extends StatelessWidget {
  const PurchaseValueTile({
    super.key,
    required this.label,
    required this.value,
    this.alignment = CrossAxisAlignment.start,
  });

  final String label;

  final String value;

  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium,
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyLarge,
        ),
      ],
    );
  }
}