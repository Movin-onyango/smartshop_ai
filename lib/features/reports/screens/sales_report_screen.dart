import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/report_provider.dart';

import '../widgets/cards/report_summary_card.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/statistics/report_statistic_tile.dart';


/// ---------------------------------------------------------------------------
/// SalesReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays sales analytics.
///
/// Features:
/// • Sales KPIs
/// • Sales Performance
/// • Profit Summary
/// • Future Charts
/// ---------------------------------------------------------------------------
class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({
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
        return SmartScaffold(
          title: 'Sales Report',
          body: RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                //------------------------------------------------------------------
                // Header
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Sales Analytics',
                  subtitle:
                      'Overview of your sales performance.',
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
                      title: 'Total Sales',
                      value:
                          'KES ${provider.totalSales.toStringAsFixed(2)}',
                      icon: Icons.payments,
                      color: Colors.green,
                    ),

                    ReportSummaryCard(
                      title: 'Total Profit',
                      value:
                          'KES ${provider.totalProfit.toStringAsFixed(2)}',
                      icon: Icons.trending_up,
                      color: Colors.blue,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Sales Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Total Sales',
                          value:
                              'KES ${provider.totalSales.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Total Profit',
                          value:
                              'KES ${provider.totalProfit.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Transactions',
                          value:
                              provider.salesRows.length.toString(),
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
                  title: 'Monthly Sales',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Sales Chart\n(Coming Soon)',
                        textAlign: TextAlign.center,
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