import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/report_provider.dart';

import '../widgets/cards/report_summary_card.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/statistics/report_statistic_tile.dart';

/// ---------------------------------------------------------------------------
/// FinancialReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays financial analytics.
///
/// Features:
/// • Financial KPIs
/// • Financial Statistics
/// • Profit Analysis
/// • Future Charts
/// ---------------------------------------------------------------------------
class FinancialReportScreen extends StatelessWidget {
  const FinancialReportScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (
        context,
        provider,
        _,
      ) {
        final revenue = provider.revenue;
        final expenses = provider.totalExpenses;
        final profit = provider.netProfit;

        final margin = revenue == 0
            ? 0.0
            : (profit / revenue) * 100;

        return SmartScaffold(
          title: 'Financial Report',
          body: RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                //------------------------------------------------------------------
                // Header
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Financial Overview',
                  subtitle:
                      'Overall business financial performance.',
                ),

                const SizedBox(height: 20),

                DateFilterBar(
                  selected: provider.selectedPeriod,
                  onChanged: provider.setPeriod,
                ),

                const SizedBox(height: 24),

                //------------------------------------------------------------------
                // KPI Cards
                //------------------------------------------------------------------

                GridView.count(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.8,
                  children: [
                    ReportSummaryCard(
                      title: 'Revenue',
                      value:
                          'KES ${revenue.toStringAsFixed(2)}',
                      icon: Icons.payments,
                      color: Colors.green,
                    ),

                    ReportSummaryCard(
                      title: 'Expenses',
                      value:
                          'KES ${expenses.toStringAsFixed(2)}',
                      icon: Icons.receipt_long,
                      color: Colors.red,
                    ),

                    ReportSummaryCard(
                      title: 'Profit',
                      value:
                          'KES ${profit.toStringAsFixed(2)}',
                      icon: Icons.trending_up,
                      color: Colors.blue,
                    ),

                    ReportSummaryCard(
                      title: 'Margin',
                      value:
                          '${margin.toStringAsFixed(2)}%',
                      icon: Icons.percent,
                      color: Colors.orange,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Financial Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Revenue',
                          value:
                              'KES ${revenue.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Expenses',
                          value:
                              'KES ${expenses.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Net Profit',
                          value:
                              'KES ${profit.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Profit Margin',
                          value:
                              '${margin.toStringAsFixed(2)}%',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Chart Placeholder
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Financial Trend',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Financial Chart\n(Coming Soon)',
                        textAlign:
                            TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}