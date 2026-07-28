import 'package:flutter/material.dart';

import '../../controllers/inventory_settings_controller.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';
import '../tiles/settings_text_tile.dart';

/// ---------------------------------------------------------------------------
/// InventorySection
/// ---------------------------------------------------------------------------
///
/// Displays inventory configuration.
///
/// Used by:
/// • InventorySettingsScreen
/// ---------------------------------------------------------------------------
class InventorySection extends StatelessWidget {
  const InventorySection({
    super.key,
    required this.controller,
  });

  final InventorySettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Inventory Settings',
          subtitle: 'Configure inventory management preferences.',
        ),

        SettingsSwitchTile(
          title: 'Enable Low Stock Alerts',
          subtitle: 'Receive alerts when stock reaches the reorder level.',
          leading: Icons.warning_amber,
          value: controller.enableStockAlerts,
          onChanged: controller.setEnableStockAlerts,
        ),

        SettingsSwitchTile(
          title: 'Track Product Expiry',
          subtitle: 'Monitor expiry dates for inventory items.',
          leading: Icons.event,
          value: controller.trackExpiry,
          onChanged: controller.setTrackExpiry,
        ),
/*
        SettingsSwitchTile(
          title: 'Enable Barcode Scanning',
          subtitle: 'Allow barcode scanning during inventory operations.',
          leading: Icons.qr_code_scanner,
          value: controller.barcodeEnabled,
          onChanged: controller.setBarcodeEnabled,
        ),
*/
        SettingsTextTile(
          title: 'Default Reorder Level',
          value: controller.defaultReorderLevel.toString(),
          leading: Icons.inventory,
          onTap: controller.editDefaultReorderLevel,
        ),
/*
        SettingsDropdownTile<int>(
          title: 'Expiry Alert Days',
          leading: Icons.schedule,
          value: controller.expiryAlertDays,
          items: controller.availableExpiryAlertDays
              .map(
                (days) => DropdownMenuItem<int>(
                  value: days,
                  child: Text('$days Days'),
                ),
              )
              .toList(),
          onChanged: controller.setExpiryAlertDays,
        ),
*/
        SettingsSwitchTile(
          title: 'Allow Negative Stock',
          subtitle: 'Permit sales even when stock falls below zero.',
          leading: Icons.remove_circle_outline,
          value: controller.allowNegativeStock,
          onChanged: controller.setAllowNegativeStock,
        ),
      ],
    );
  }
}