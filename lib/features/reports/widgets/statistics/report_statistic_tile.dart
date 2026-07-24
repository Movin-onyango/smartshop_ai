import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ReportStatisticTile
/// ---------------------------------------------------------------------------
///
/// Displays a statistic row inside report cards.
///
/// Used by:
/// • SalesReportScreen
/// • InventoryReportScreen
/// • PurchaseReportScreen
/// • ExpenseReportScreen
/// • CustomerReportScreen
/// • SupplierReportScreen
/// • FinancialReportScreen
/// ---------------------------------------------------------------------------
class ReportStatisticTile extends StatelessWidget {
  const ReportStatisticTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge,
            ),
          ),

          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}