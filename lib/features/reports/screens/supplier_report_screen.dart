import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/report_provider.dart';

import '../widgets/cards/report_summary_card.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/statistics/report_statistic_tile.dart';

/// ---------------------------------------------------------------------------
/// SupplierReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays supplier analytics.
///
/// Features:
/// • Supplier KPIs
/// • Supplier Statistics
/// • Supplier Overview
/// • Chart Placeholder
/// ---------------------------------------------------------------------------
class SupplierReportScreen extends StatelessWidget {
  const SupplierReportScreen({
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
        final totalSuppliers =
            provider.supplierRows.length;

        // Assuming supplierRows contains only active suppliers.
        // If an active flag is added later, this calculation can be updated.
        final activeSuppliers = totalSuppliers;

        return SmartScaffold(
          title: 'Supplier Report',
          body: RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                //------------------------------------------------------------------
                // Header
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Supplier Analytics',
                  subtitle:
                      'Overview of supplier relationships and activity.',
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
                      title: 'Suppliers',
                      value: totalSuppliers.toString(),
                      icon: Icons.local_shipping,
                      color: Colors.indigo,
                    ),

                    ReportSummaryCard(
                      title: 'Active',
                      value: activeSuppliers.toString(),
                      icon: Icons.check_circle,
                      color: Colors.green,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Supplier Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Total Suppliers',
                          value: totalSuppliers.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Active Suppliers',
                          value: activeSuppliers.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Supplier Records',
                          value: provider
                              .supplierRows.length
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
                  title: 'Supplier Activity',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Supplier Chart\n(Coming Soon)',
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