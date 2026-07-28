import 'package:flutter/material.dart';

import '../../controllers/sales_settings_controller.dart';

import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';

/// ---------------------------------------------------------------------------
/// SalesSection
/// ---------------------------------------------------------------------------
///
/// Displays sales configuration.
///
/// Used by:
/// • SalesSettingsScreen
/// ---------------------------------------------------------------------------
class SalesSection extends StatelessWidget {
  const SalesSection({
    super.key,
    required this.controller,
  });

  final SalesSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Sales Settings',
          subtitle: 'Configure sales and checkout behaviour.',
        ),

        SettingsSwitchTile(
          title: 'Enable Discounts',
          subtitle: 'Allow discounts during checkout.',
          leading: Icons.discount,
          value: controller.allowDiscounts,
          onChanged: controller.setAllowDiscounts,
        ),

        SettingsSwitchTile(
          title: 'Allow Partial Payments',
          subtitle: 'Accept partially paid sales.',
          leading: Icons.payments,
          value: controller.allowPartialPayments,
          onChanged: controller.setAllowPartialPayments,
        ),

        SettingsSwitchTile(
          title: 'Require Customer',
          subtitle: 'Require customer selection before completing a sale.',
          leading: Icons.people,
          value: controller.requireCustomer,
          onChanged: controller.setRequireCustomer,
        ),

        SettingsSwitchTile(
          title: 'Require Sale Confirmation',
          subtitle: 'Ask for confirmation before finalizing a sale.',
          leading: Icons.check_circle_outline,
          value: controller.requireCashierConfirmation,
          onChanged: controller.setRequireCashierConfirmation,
        ),

        SettingsDropdownTile<String>(
          title: 'Default Payment Method',
          leading: Icons.account_balance_wallet,
          value: controller.defaultPaymentMethod,
          items: controller.availablePaymentMethods
              .map(
                (method) => DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                ),
              )
              .toList(),
          onChanged: controller.setDefaultPaymentMethod,
        ),

        SettingsSwitchTile(
          title: 'Auto Generate Receipt',
          subtitle: 'Generate a receipt immediately after every completed sale.',
          leading: Icons.receipt,
          value: controller.autoGenerateReceipt,
          onChanged: controller.setAutoGenerateReceipt,
        ),
      ],
    );
  }
}