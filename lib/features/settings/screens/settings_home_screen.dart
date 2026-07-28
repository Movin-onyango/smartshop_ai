import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';

import '../widgets/cards/settings_about_card.dart';
import '../widgets/cards/settings_category_card.dart';
import '../widgets/cards/settings_header_card.dart';

/// ---------------------------------------------------------------------------
/// SettingsHomeScreen
/// ---------------------------------------------------------------------------
///
/// Main entry point for application settings.
///
/// Used by:
/// • Dashboard
/// • Navigation Drawer
/// ---------------------------------------------------------------------------
class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SettingsProvider>();

    final business = provider.businessController;

    return SmartScaffold(
      title: 'Settings',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsHeaderCard(
              businessName: business.businessName,
              ownerName: business.ownerName,
              phone: business.phone,
            ),

            const SizedBox(height: 24),

            SettingsCategoryCard(
              title: 'Business Information',
              subtitle: 'Manage your business profile.',
              color: const Color(0xFF4A90E2),
              icon: Icons.store,
              onTap: () =>
                  context.push(AppRoutes.businessSettings),
            ),

            SettingsCategoryCard(
              title: 'Currency',
              subtitle: 'Currency and number formatting.',
              color: Colors.black,
              icon: Icons.payments,
              onTap: () =>
                  context.push(AppRoutes.currencySettings),
            ),

            SettingsCategoryCard(
              title: 'Tax',
              subtitle: 'Configure taxes and VAT.',
              color: Colors.black26,
              icon: Icons.receipt_long,
              onTap: () =>
                  context.push(AppRoutes.taxSettings),
            ),

            SettingsCategoryCard(
              title: 'Receipt',
              subtitle: 'Receipt appearance and printing.',
              color: Colors.blue,
              icon: Icons.print,
              onTap: () =>
                  context.push(AppRoutes.receiptSettings),
            ),

            SettingsCategoryCard(
              title: 'Inventory',
              subtitle: 'Inventory behaviour and alerts.',
              color: Colors.transparent,
              icon: Icons.inventory_2,
              onTap: () =>
                  context.push(AppRoutes.inventorySettings),
            ),

            SettingsCategoryCard(
              title: 'Sales',
              subtitle: 'Sales workflow preferences.',
              color: Colors.transparent,
              icon: Icons.point_of_sale,
              onTap: () =>
                  context.push(AppRoutes.salesSettings),
            ),

            SettingsCategoryCard(
              title: 'Appearance',
              subtitle: 'Themes and application look.',
              color: Colors.black45,
              icon: Icons.palette,
              onTap: () =>
                  context.push(AppRoutes.appearanceSettings),
            ),

            SettingsCategoryCard(
              title: 'Backup & Restore',
              subtitle: 'Protect your business data.',
              color: Colors.transparent,
              icon: Icons.backup,
              onTap: () =>
                  context.push(AppRoutes.backupSettings),
            ),

            SettingsCategoryCard(
              title: 'Security',
              subtitle: 'PIN, biometrics and protection.',
              color: Colors.transparent,
              icon: Icons.security,
              onTap: () =>
                  context.push(AppRoutes.securitySettings),
            ),

            const SizedBox(height: 32),

            const SettingsAboutCard(
              appName: 'SmartShop AI',
              version: '1.0.0',
              buildNumber: '1',
              copyright:
                  '© 2026 SmartShop AI\nAll Rights Reserved.',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}