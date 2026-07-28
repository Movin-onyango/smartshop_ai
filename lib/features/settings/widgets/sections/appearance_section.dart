import 'package:flutter/material.dart';

import '../../controllers/appearance_settings_controller.dart';

import '../tiles/settings_color_tile.dart';
import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';

/// ---------------------------------------------------------------------------
/// AppearanceSection
/// ---------------------------------------------------------------------------
///
/// Displays application appearance configuration.
///
/// Used by:
/// • AppearanceSettingsScreen
/// ---------------------------------------------------------------------------
class AppearanceSection extends StatelessWidget {
  const AppearanceSection({
    super.key,
    required this.controller,
  });

  final AppearanceSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Appearance',
          subtitle: 'Customize the look and feel of SmartShop AI.',
        ),

        SettingsDropdownTile<String>(
          title: 'Theme',
          leading: Icons.palette,
          value: controller.themeMode,
          items: controller.availableThemes
              .map(
                (theme) => DropdownMenuItem<String>(
                  value: theme,
                  child: Text(theme),
                ),
              )
              .toList(),
          onChanged: controller.setThemeMode,
        ),

        SettingsSwitchTile(
          title: 'Use Material 3',
          subtitle: 'Enable modern Material Design components.',
          leading: Icons.auto_awesome,
          value: controller.useMaterial3,
          onChanged: controller.setUseMaterial3,
        ),

        SettingsSwitchTile(
          title: 'Compact Layout',
          subtitle: 'Display more content using reduced spacing.',
          leading: Icons.view_agenda,
          value: controller.compactLayout,
          onChanged: controller.setCompactLayout,
        ),

        SettingsColorTile(
          title: 'Primary Color',
          subtitle: 'Application accent color.',
          leading: Icons.color_lens,
          color: Color(
            int.tryParse(controller.primaryColor) ?? 0xFF2196F3,
          ),
          onTap: controller.selectPrimaryColor,
        ),
      ],
    );
  }
}