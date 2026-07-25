import 'package:flutter/material.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../widgets/business_health_card.dart';
import '../widgets/fast_movers_card.dart';
import '../widgets/greeting_section.dart';
import '../widgets/inventory_status_card.dart';
import '../widgets/kpi_grid.dart';
import '../widgets/notifications_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/recent_activity_card.dart';
import '../widgets/sales_trend_chart.dart';
import '../widgets/section_header.dart';

/// SmartShop AI Dashboard
///
/// Enterprise dashboard assembled entirely from reusable widgets.
/// This screen intentionally contains almost no UI logic.
/// Each section is delegated to its own reusable widget.
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Dashboard',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            /// Greeting
            GreetingSection(),

            SizedBox(height: 24),

            /// Business Health
            BusinessHealthCard(
              score: 92,
              status: 'Excellent',
              summary:
                  'Sales are increasing steadily, stock levels are healthy, and profit margins remain strong.',
            ),

            SizedBox(height: 32),

            /// Business Overview
            SectionHeader(title: 'Business Overview'),

            SizedBox(height: 16),

            /// KPI Grid
            KpiGrid(),

            SizedBox(height: 32),

            /// Quick Actions
            SectionHeader(title: 'Quick Actions'),

            SizedBox(height: 16),

            QuickActionsGrid(),

            SizedBox(height: 32),

            /// Sales Performance
            SectionHeader(title: 'Sales Performance'),

            SizedBox(height: 16),

            SalesTrendChart(),

            SizedBox(height: 32),

            /// Inventory Health
            SectionHeader(title: 'Inventory Health'),

            SizedBox(height: 16),

            InventoryStatusCard(),

            SizedBox(height: 32),

            /// Fast Moving Products
            SectionHeader(title: 'Fast Moving Products'),

            SizedBox(height: 16),

            FastMoversCard(),

            SizedBox(height: 32),

            /// Recent Activity
            SectionHeader(title: 'Recent Activity'),

            SizedBox(height: 16),

            RecentActivityCard(),

            SizedBox(height: 32),

            /// Notifications
            SectionHeader(title: 'Notifications'),

            SizedBox(height: 16),

            NotificationsCard(),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
