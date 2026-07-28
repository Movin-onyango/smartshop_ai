import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/sales_section.dart';

/// ---------------------------------------------------------------------------
/// SalesSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays sales workflow and checkout configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class SalesSettingsScreen extends StatelessWidget {
  const SalesSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .salesController;

    return SmartScaffold(
      title: 'Sales Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SalesSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}