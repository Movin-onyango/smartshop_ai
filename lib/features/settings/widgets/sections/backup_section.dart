import 'package:flutter/material.dart';

import '../../controllers/backup_settings_controller.dart';

import '../tiles/settings_action_tile.dart';
import '../tiles/settings_dropdown_tile.dart';
import '../tiles/settings_section_header.dart';
import '../tiles/settings_switch_tile.dart';
import '../tiles/settings_text_tile.dart';

/// ---------------------------------------------------------------------------
/// BackupSection
/// ---------------------------------------------------------------------------
///
/// Displays backup and restore configuration.
///
/// Used by:
/// • BackupSettingsScreen
/// ---------------------------------------------------------------------------
class BackupSection extends StatelessWidget {
  const BackupSection({
    super.key,
    required this.controller,
  });

  final BackupSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingsSectionHeader(
          title: 'Backup & Restore',
          subtitle: 'Protect your business data.',
        ),

        SettingsSwitchTile(
          title: 'Enable Automatic Backup',
          subtitle: 'Create backups automatically.',
          leading: Icons.backup,
          value: controller.automaticBackupEnabled,
          onChanged: controller.setAutoBackupEnabled,
        ),

        SettingsDropdownTile<String>(
          title: 'Backup Frequency',
          leading: Icons.schedule,
          value: controller.backupFrequency,
          items: controller.availableFrequencies
              .map(
                (frequency) => DropdownMenuItem<String>(
                  value: frequency,
                  child: Text(frequency),
                ),
              )
              .toList(),
          onChanged: controller.setBackupFrequency,
        ),

        SettingsTextTile(
          title: 'Backup Location',
          value: controller.backupLocation,
          leading: Icons.folder,
          maxLines: 2,
          onTap: controller.changeBackupLocation,
        ),

        SettingsTextTile(
          title: 'Last Backup',
          value: controller.lastBackup,
          leading: Icons.history,
          enabled: false,
        ),

        SettingsActionTile(
          title: 'Backup Now',
          subtitle: 'Create a backup immediately.',
          leading: Icons.cloud_upload,
          onTap: controller.backupNow,
        ),

        SettingsActionTile(
          title: 'Restore Backup',
          subtitle: 'Restore application data from a backup.',
          leading: Icons.restore,
          onTap: controller.restoreBackup,
        ),
      ],
    );
  }
}