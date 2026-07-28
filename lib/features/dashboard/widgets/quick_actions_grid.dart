import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import 'quick_action_card.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        QuickActionCard(
          title: 'Products',
          icon: Icons.inventory_2_rounded,
          color: Colors.blue,
          onTap: () {
            context.push(AppRoutes.products);
          },
        ),

        QuickActionCard(
          title: 'Categories',
          icon: Icons.category_rounded,
          color: Colors.teal,
          onTap: () {
            context.push(AppRoutes.categories);
          },
        ),

        QuickActionCard(
          title: 'Customers',
          icon: Icons.people_rounded,
          color: Colors.orange,
          onTap: () {
            context.push(AppRoutes.customers);
          },
        ),

        QuickActionCard(
          title: 'Suppliers',
          icon: Icons.local_shipping_rounded,
          color: Colors.deepOrange,
          onTap: () {
            context.push(AppRoutes.suppliers);
          },
        ),

        QuickActionCard(
          title: 'Inventory',
          icon: Icons.warehouse_rounded,
          color: Colors.indigo,
          onTap: () {
            context.push(AppRoutes.inventory);
          },
        ),

        QuickActionCard(
          title: 'Purchases',
          icon: Icons.shopping_bag_rounded,
          color: Colors.purple,
          onTap: () {
            context.push(AppRoutes.purchases);
          },
        ),

        QuickActionCard(
          title: 'Sales',
          icon: Icons.point_of_sale_rounded,
          color: Colors.green,
          onTap: () {
            context.push(AppRoutes.sales);
          },
        ),

        QuickActionCard(
          title: 'Expenses',
          icon: Icons.receipt_long_rounded,
          color: Colors.red,
          onTap: () {
            context.push(AppRoutes.expenses);
          },
        ),

        QuickActionCard(
          title: 'Reports',
          icon: Icons.analytics_rounded,
          color: Colors.deepPurple,
          onTap: () {
            context.push(AppRoutes.reports);
          },
        ),

        QuickActionCard(
          title: 'Notifications',
          icon: Icons.notifications_active_rounded,
          color: Colors.amber,
          onTap: () {
            context.push(AppRoutes.notifications);
          },
        ),

        QuickActionCard(
          title: 'Settings',
          icon: Icons.settings_rounded,
          color: Colors.blueGrey,
          onTap: () {
            context.push(AppRoutes.settings);
          },
        ),
      ],
    );
  }
}