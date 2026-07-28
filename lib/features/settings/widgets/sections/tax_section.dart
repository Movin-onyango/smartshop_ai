import 'package:flutter/material.dart';

import '../../controllers/tax_settings_controller.dart';

import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';
import '../tiles/settings_text_tile.dart';

/// ---------------------------------------------------------------------------
/// TaxSection
/// ---------------------------------------------------------------------------
///
/// Displays tax configuration.
///
/// Used by:
/// • TaxSettingsScreen
/// ---------------------------------------------------------------------------
class TaxSection extends StatelessWidget {
  const TaxSection({
    super.key,
    required this.controller,
  });

  final TaxSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Tax Settings',
          subtitle: 'Configure VAT and taxation preferences.',
        ),

        SettingsSwitchTile(
          title: 'Enable VAT',
          subtitle: 'Apply VAT calculations to sales.',
          leading: Icons.receipt_long,
          value: controller.vatEnabled,
          onChanged: controller.setVatEnabled,
        ),

        SettingsDropdownTile<double>(
          title: 'VAT Rate',
          leading: Icons.percent,
          value: controller.vatRate,
          items: controller.availableVatRates
              .map(
                (rate) => DropdownMenuItem<double>(
                  value: rate,
                  child: Text('${rate.toStringAsFixed(0)}%'),
                ),
              )
              .toList(),
          onChanged: controller.setVatRate,
        ),

        SettingsSwitchTile(
          title: 'Prices Include VAT',
          subtitle: 'Selling prices already include VAT.',
          leading: Icons.price_change,
          value: controller.pricesIncludeVat,
          onChanged: controller.setPricesIncludeVat,
        ),

        SettingsTextTile(
          title: 'Tax Mode',
          value: controller.taxMode,
          leading: Icons.info_outline,
        ),

        SettingsTextTile(
          title: 'Current VAT Rate',
          value: controller.formattedVatRate,
          leading: Icons.calculate,
        ),
      ],
    );
  }
}