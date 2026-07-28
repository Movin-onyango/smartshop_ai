import 'package:flutter/material.dart';

import '../../controllers/currency_settings_controller.dart';

import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';

/// ---------------------------------------------------------------------------
/// CurrencySection
/// ---------------------------------------------------------------------------
///
/// Displays currency and formatting settings.
///
/// Used by:
/// • CurrencySettingsScreen
/// ---------------------------------------------------------------------------
class CurrencySection extends StatelessWidget {
  const CurrencySection({
    super.key,
    required this.controller,
  });

  final CurrencySettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Currency Settings',
          subtitle: 'Configure currency and number formatting.',
        ),

        SettingsDropdownTile<String>(
          title: 'Currency',
          leading: Icons.payments,
          value: controller.currencyCode,
          items: controller.availableCurrencies
              .map(
                (currency) => DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                ),
              )
              .toList(),
          onChanged: controller.setCurrency,
        ),

        SettingsDropdownTile<String>(
          title: 'Currency Symbol',
          leading: Icons.attach_money,
          value: controller.currencySymbol,
          items: controller.availableSymbols
              .map(
                (symbol) => DropdownMenuItem<String>(
                  value: symbol,
                  child: Text(symbol),
                ),
              )
              .toList(),
          onChanged: controller.setCurrencySymbol,
        ),

        SettingsDropdownTile<String>(
          title: 'Decimal Separator',
          leading: Icons.pin,
          value: controller.decimalSeparator,
          items: controller.availableDecimalSeparators
              .map(
                (separator) => DropdownMenuItem<String>(
                  value: separator,
                  child: Text(separator),
                ),
              )
              .toList(),
          onChanged: controller.setDecimalSeparator,
        ),

        SettingsDropdownTile<String>(
          title: 'Thousands Separator',
          leading: Icons.format_list_numbered,
          value: controller.thousandSeparator,
          items: controller.availableThousandSeparators
              .map(
                (separator) => DropdownMenuItem<String>(
                  value: separator,
                  child: Text(separator),
                ),
              )
              .toList(),
          onChanged: controller.setThousandSeparator,
        ),
      ],
    );
  }
}