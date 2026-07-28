import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/appearance_section.dart';

/// ---------------------------------------------------------------------------
/// AppearanceSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays application appearance and theme configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .appearanceController;

    return SmartScaffold(
      title: 'Appearance Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: AppearanceSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}