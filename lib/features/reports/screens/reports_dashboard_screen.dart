import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/report_provider.dart';
import '../widgets/cards/report_summary_card.dart';
import '../widgets/filters/date_filter_bar.dart';
import '../widgets/dashboard/report_section_header.dart';
import '../widgets/dashboard/report_shortcut_card.dart';

class ReportsDashboardScreen extends StatelessWidget {
  const ReportsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        return SmartScaffold(
          title: 'Reports',
          body: RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const ReportSectionHeader(title: 'Business Overview'),

                const SizedBox(height: 20),

                DateFilterBar(
                  selected: provider.selectedPeriod,
                  onChanged: provider.setPeriod,
                ),

                const SizedBox(height: 24),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.6,
                  children: [
                    ReportSummaryCard(
                      title: 'Revenue',
                      value: 'KES ${provider.revenue.toStringAsFixed(2)}',
                      icon: Icons.payments,
                      color: Colors.green,
                    ),

                    ReportSummaryCard(
                      title: 'Expenses',
                      value: 'KES ${provider.totalExpenses.toStringAsFixed(2)}',
                      icon: Icons.receipt_long,
                      color: Colors.red,
                    ),

                    ReportSummaryCard(
                      title: 'Profit',
                      value: 'KES ${provider.netProfit.toStringAsFixed(2)}',
                      icon: Icons.trending_up,
                      color: Colors.blue,
                    ),

                    ReportSummaryCard(
                      title: 'Customers',
                      value: provider.totalCustomers.toString(),
                      icon: Icons.people,
                      color: Colors.teal,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                const ReportSectionHeader(title: 'Reports'),

                const SizedBox(height: 16),

                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ReportShortcutCard(
                      title: 'Sales',
                      icon: Icons.point_of_sale,
                      color: Colors.green,
                      onTap: () => context.push(AppRoutes.salesReport),
                    ),

                    ReportShortcutCard(
                      title: 'Inventory',
                      icon: Icons.inventory_2,
                      color: Colors.orange,
                      onTap: () => context.push(AppRoutes.inventoryReport),
                    ),

                    ReportShortcutCard(
                      title: 'Purchases',
                      icon: Icons.shopping_cart,
                      color: Colors.blue,
                      onTap: () => context.push(AppRoutes.purchaseReport),
                    ),

                    ReportShortcutCard(
                      title: 'Expenses',
                      icon: Icons.receipt_long,
                      color: Colors.red,
                      onTap: () => context.push(AppRoutes.expenseReport),
                    ),

                    ReportShortcutCard(
                      title: 'Customers',
                      icon: Icons.people,
                      color: Colors.teal,
                      onTap: () => context.push(AppRoutes.customerReport),
                    ),

                    ReportShortcutCard(
                      title: 'Suppliers',
                      icon: Icons.local_shipping,
                      color: Colors.indigo,
                      onTap: () => context.push(AppRoutes.supplierReport),
                    ),

                    ReportShortcutCard(
                      title: 'Financial',
                      icon: Icons.analytics,
                      color: Colors.purple,
                      onTap: () => context.push(AppRoutes.financialReport),
                    ),
                  ],
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
