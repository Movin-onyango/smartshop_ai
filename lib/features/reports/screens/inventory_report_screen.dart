import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/report_provider.dart';

import '../widgets/cards/report_summary_card.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/statistics/report_statistic_tile.dart';


/// ---------------------------------------------------------------------------
/// InventoryReportScreen
/// ---------------------------------------------------------------------------
///
/// Displays inventory analytics.
///
/// Features:
/// • Inventory KPIs
/// • Stock Statistics
/// • Future Inventory Charts
/// ---------------------------------------------------------------------------
class InventoryReportScreen extends StatelessWidget {
  const InventoryReportScreen({
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
        final totalProducts =
            provider.inventoryRows.length;

        final lowStockProducts =
            provider.inventoryRows.where(
          (row) => row.last == 'Low Stock',
        ).length;

        final inStockProducts =
            totalProducts - lowStockProducts;

        return SmartScaffold(
          title: 'Inventory Report',
          body: RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                //------------------------------------------------------------------
                // Header
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Inventory Analytics',
                  subtitle:
                      'Overview of stock levels and inventory status.',
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
                      title: 'Products',
                      value: totalProducts.toString(),
                      icon: Icons.inventory_2,
                      color: Colors.orange,
                    ),

                    ReportSummaryCard(
                      title: 'Low Stock',
                      value: lowStockProducts.toString(),
                      icon: Icons.warning_amber,
                      color: Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //------------------------------------------------------------------
                // Statistics
                //------------------------------------------------------------------

                const ReportSectionHeader(
                  title: 'Inventory Statistics',
                ),

                const SizedBox(height: 16),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ReportStatisticTile(
                          title: 'Total Products',
                          value: totalProducts.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Low Stock',
                          value:
                              lowStockProducts.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'In Stock',
                          value:
                              inStockProducts.toString(),
                        ),

                        const Divider(),

                        ReportStatisticTile(
                          title: 'Inventory Rows',
                          value: provider
                              .inventoryRows.length
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
                  title: 'Inventory Trends',
                ),

                const SizedBox(height: 16),

                Card(
                  child: SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'Inventory Chart\n(Coming Soon)',
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