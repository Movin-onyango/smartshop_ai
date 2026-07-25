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
/// ExpenseReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays expense analytics.
///
/// Features:
/// • Expense KPIs
/// • Expense Statistics
/// • Expense Trends
/// • Export Report
/// • Future Charts
/// ---------------------------------------------------------------------------
class ExpenseReportScreen extends StatelessWidget {
  const ExpenseReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        final totalTransactions =
            provider.expenseRows.length;

        final totalExpenses =
            provider.totalExpenses;

        final averageExpense =
            totalTransactions == 0
                ? 0.0
                : totalExpenses /
                    totalTransactions;

        return SmartScaffold(
          title: 'Expense Report',

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
                  title: 'Expense Analytics',
                  subtitle:
                      'Monitor business spending and operational costs.',
                ),

                const SizedBox(height: 20),

                DateFilterBar(
                  selected:
                      provider.selectedPeriod,
                  onChanged:
                      provider.setPeriod,
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
                      title: 'Expenses',
                      value:
                          'KES ${totalExpenses.toStringAsFixed(2)}',
                      icon:
                          Icons.receipt_long,
                      color: Colors.red,
                    ),

                    ReportSummaryCard(
                      title: 'Transactions',
                      value:
                          totalTransactions
                              .toString(),
                      icon: Icons.receipt,
                      color: Colors.orange,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------
                const ReportSectionHeader(
                  title:
                      'Expense Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(
                          20,
                        ),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title:
                              'Total Expenses',
                          value:
                              'KES ${totalExpenses.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title:
                              'Transactions',
                          value:
                              totalTransactions
                                  .toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title:
                              'Average Expense',
                          value:
                              'KES ${averageExpense.toStringAsFixed(2)}',
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title:
                              'Expense Records',
                          value: provider
                              .expenseRows
                              .length
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
                  title:
                      'Expense Trends',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Expense Chart\n(Coming Soon)',
                        textAlign:
                            TextAlign.center,
                        style:
                            Theme.of(context)
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
          'Export Expense Report',
        ),
        content: Column(
          mainAxisSize:
              MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(
                Icons.picture_as_pdf,
              ),
              title: const Text(
                'Export as PDF',
              ),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider
                          .expenseController,
                  format:
                      ExportFormat
                          .pdf,
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.table_chart,
              ),
              title: const Text(
                'Export as Excel',
              ),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider
                          .expenseController,
                  format:
                      ExportFormat
                          .excel,
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.description,
              ),
              title: const Text(
                'Export as CSV',
              ),
              onTap: () async {
                Navigator.pop(context);

                await provider.exportReport(
                  controller:
                      provider
                          .expenseController,
                  format:
                      ExportFormat
                          .csv,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}