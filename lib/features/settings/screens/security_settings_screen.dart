import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/security_section.dart';

/// ---------------------------------------------------------------------------
/// SecuritySettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays application security configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .securityController;

    return SmartScaffold(
      title: 'Security Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SecuritySection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}