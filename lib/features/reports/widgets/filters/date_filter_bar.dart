import 'package:flutter/material.dart';

import '../../providers/report_state.dart';

/// ---------------------------------------------------------------------------
/// DateFilterBar
/// ---------------------------------------------------------------------------
///
/// Reusable report period selector.
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
class DateFilterBar extends StatelessWidget {
  const DateFilterBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final ReportPeriod selected;

  final ValueChanged<ReportPeriod> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: ReportPeriod.values.map((period) {
        return ChoiceChip(
          label: Text(_title(period)),
          selected: selected == period,
          onSelected: (_) => onChanged(period),
        );
      }).toList(),
    );
  }

  String _title(ReportPeriod period) {
    switch (period) {
      case ReportPeriod.today:
        return 'Today';

      case ReportPeriod.week:
        return 'This Week';

      case ReportPeriod.month:
        return 'This Month';

      case ReportPeriod.year:
        return 'This Year';

      case ReportPeriod.custom:
        return 'Custom';
    }
  }
}
