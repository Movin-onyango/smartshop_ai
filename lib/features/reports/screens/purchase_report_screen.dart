import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../exporters/report_export_manager.dart';
import '../providers/report_provider.dart';

import '../widgets/cards/report_summary_card.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/statistics/report_statistic_tile.dart';

/// ---------------------------------------------------------------------------
/// PurchaseReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays purchase analytics.
///
/// Features:
/// • Purchase KPIs
/// • Purchase Statistics
/// • Export Report
/// • Future Purchase Charts
/// ---------------------------------------------------------------------------
class PurchaseReportScreen extends StatelessWidget {
  const PurchaseReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        final totalOrders = provider.purchaseRows.length;

        final totalPurchases = provider.purchases;

        final averagePurchase = totalOrders == 0
            ? 0.0
            : totalPurchases / totalOrders;

        return SmartScaffold(
          title: 'Purchase Report',

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
                  title: 'Purchase Analytics',
                  subtitle:
                      'Overview of purchasing performance.',
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
                      title: 'Purchases',
                      value:
                          'KES ${totalPurchases.toStringAsFixed(2)}',
                      icon: Icons.shopping_cart,
                      color: Colors.blue,
                    ),

                    ReportSummaryCard(
                      title: 'Orders',
                      value: totalOrders.toString(),
                      icon: Icons.receipt_long,
                      color: Colors.indigo,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------
                const ReportSectionHeader(
                  title: 'Purchase Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Total Purchases',
                          value:
                              'KES ${totalPurchases.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Purchase Orders',
                          value: totalOrders.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Average Purchase',
                          value:
                              'KES ${averagePurchase.toStringAsFixed(2)}',
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
                  title: 'Purchase Trends',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Purchase Chart\n(Coming Soon)',
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
        title: const Text('Export Purchase Report'),
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
                      provider.purchaseController,
                  format: ExportFormat.pdf,
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.table_chart),
              title:
                  const Text('Export as Excel'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider.purchaseController,
                  format: ExportFormat.excel,
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.description),
              title:
                  const Text('Export as CSV'),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider.purchaseController,
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