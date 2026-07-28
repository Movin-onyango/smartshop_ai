import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/backup_section.dart';

/// ---------------------------------------------------------------------------
/// BackupSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays backup and restore configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class BackupSettingsScreen extends StatelessWidget {
  const BackupSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .backupController;

    return SmartScaffold(
      title: 'Backup & Restore',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BackupSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}