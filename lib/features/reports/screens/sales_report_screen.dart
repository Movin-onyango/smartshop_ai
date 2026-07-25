import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../exporters/report_export_manager.dart';
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
/// • Export Report
/// • Future Charts
/// ---------------------------------------------------------------------------
class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        return SmartScaffold(
          title: 'Sales Report',

          actions: [
            IconButton(
              tooltip: 'Export Report',
              icon: const Icon(Icons.download),
              onPressed: () => _showExportDialog(
                context,
                provider,
              ),
            ),
          ],

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
                  subtitle: 'Overview of your sales performance.',
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
                  physics: const NeverScrollableScrollPhysics(),
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
                          value: provider.salesRows.length.toString(),
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

  Future<void> _showExportDialog(
    BuildContext context,
    ReportProvider provider,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Export Sales Report'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: const Text('Export as PDF'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller: provider.salesController,
                  format: ExportFormat.pdf,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart),
              title: const Text('Export as Excel'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller: provider.salesController,
                  format: ExportFormat.excel,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Export as CSV'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller: provider.salesController,
                  format: ExportFormat.csv,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}