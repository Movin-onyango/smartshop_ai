import 'package:flutter/material.dart';

import '../../controllers/receipt_settings_controller.dart';

import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';
import '../tiles/settings_text_tile.dart';

/// ---------------------------------------------------------------------------
/// ReceiptSection
/// ---------------------------------------------------------------------------
///
/// Displays receipt configuration.
///
/// Used by:
/// • ReceiptSettingsScreen
/// ---------------------------------------------------------------------------
class ReceiptSection extends StatelessWidget {
  const ReceiptSection({
    super.key,
    required this.controller,
  });

  final ReceiptSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Receipt Settings',
          subtitle: 'Customize printed and digital receipts.',
        ),

        SettingsSwitchTile(
          title: 'Show Business Logo',
          subtitle: 'Include your logo on receipts.',
          leading: Icons.image,
          value: controller.showLogo,
          onChanged: controller.setShowLogo,
        ),

        SettingsSwitchTile(
          title: 'Print Business Address',
          subtitle: 'Include business address on receipts.',
          leading: Icons.location_on,
          value: controller.showBusinessAddress,
          onChanged: controller.setShowBusinessAddress,
        ),

        SettingsSwitchTile(
          title: 'Print Phone Number',
          subtitle: 'Include contact number on receipts.',
          leading: Icons.phone,
          value: controller.showPhone,
          onChanged: controller.setShowPhone,
        ),

        SettingsSwitchTile(
          title: 'Print Tax Information',
          subtitle: 'Display tax details on receipts.',
          leading: Icons.receipt_long,
          value: controller.showTaxPin,
          onChanged: controller.setShowTaxPin,
        ),

        SettingsDropdownTile<String>(
          title: 'Paper Size',
          leading: Icons.print,
          value: controller.paperSize,
          items: controller.availablePaperSizes
              .map(
                (size) => DropdownMenuItem(
                  value: size,
                  child: Text(size),
                ),
              )
              .toList(),
          onChanged: controller.setPaperSize,
        ),

        SettingsTextTile(
          title: 'Receipt Footer',
          value: controller.footerMessage,
          leading: Icons.notes,
          maxLines: 2,
          onTap: controller.editFooterMessage,
        ),

        
        SettingsSwitchTile(
          title: 'Auto Print Receipt',
          subtitle: 'Automatically print after every completed sale.',
          leading: Icons.print_outlined,
          value: controller.autoPrintReceipt,
          onChanged: controller.setAutoPrintReceipt,
        ),
      ],
    );
  }
}