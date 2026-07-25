import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ReportSectionHeader
/// ---------------------------------------------------------------------------
///
/// Reusable section header used throughout the Reports module.
///
/// Used by:
/// • ReportsDashboardScreen
/// • SalesReportScreen
/// • InventoryReportScreen
/// • PurchaseReportScreen
/// • ExpenseReportScreen
/// • CustomerReportScreen
/// • SupplierReportScreen
/// • FinancialReportScreen
/// ---------------------------------------------------------------------------
class ReportSectionHeader extends StatelessWidget {
  const ReportSectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
  });

  final String title;
  final String? subtitle;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (subtitle != null) ...[
                const SizedBox(height: 4),

                Text(
                  subtitle!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ],
          ),
        ),

        if (action != null) action!,
      ],
    );
  }
}
