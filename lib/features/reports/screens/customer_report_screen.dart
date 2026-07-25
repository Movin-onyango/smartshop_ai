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
/// CustomerReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays customer analytics.
///
/// Features:
/// • Customer KPIs
/// • Customer Statistics
/// • Customer Growth
/// • Export Report
/// • Future Charts
/// ---------------------------------------------------------------------------
class CustomerReportScreen extends StatelessWidget {
  const CustomerReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        final totalCustomers = provider.customerRows.length;

        // Until customer activity tracking is added,
        // assume all loaded customers are active.
        final activeCustomers = totalCustomers;

        // Placeholder until registration history exists.
        final newCustomers = 0;

        return SmartScaffold(
          title: 'Customer Report',

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
                  title: 'Customer Analytics',
                  subtitle:
                      'Overview of customer activity and growth.',
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
                  childAspectRatio: 2.6,
                  children: [
                    ReportSummaryCard(
                      title: 'Customers',
                      value: totalCustomers.toString(),
                      icon: Icons.people,
                      color: Colors.blue,
                    ),

                    ReportSummaryCard(
                      title: 'Active',
                      value: activeCustomers.toString(),
                      icon: Icons.person_outline,
                      color: Colors.green,
                    ),

                    ReportSummaryCard(
                      title: 'New',
                      value: newCustomers.toString(),
                      icon: Icons.person_add,
                      color: Colors.orange,
                    ),

                    const ReportSummaryCard(
                      title: 'Growth',
                      value: '0%',
                      icon: Icons.trending_up,
                      color: Colors.purple,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------
                const ReportSectionHeader(
                  title: 'Customer Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Total Customers',
                          value: totalCustomers.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Active Customers',
                          value: activeCustomers.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'New Customers',
                          value: newCustomers.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Customer Records',
                          value: provider.customerRows.length
                              .toString(),
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
                  title: 'Customer Growth',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Customer Growth Chart\n(Coming Soon)',
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

  //---------------------------------------------------------------------------
  // Export Dialog
  //---------------------------------------------------------------------------

  Future<void> _showExportDialog(
    BuildContext context,
    ReportProvider provider,
  ) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          'Export Customer Report',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: const Text('Export as PDF'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider.customerController,
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
                  controller:
                      provider.customerController,
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
                  controller:
                      provider.customerController,
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