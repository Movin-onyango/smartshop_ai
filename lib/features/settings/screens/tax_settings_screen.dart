import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/tax_section.dart';

/// ---------------------------------------------------------------------------
/// TaxSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays tax and VAT configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class TaxSettingsScreen extends StatelessWidget {
  const TaxSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .taxController;

    return SmartScaffold(
      title: 'Tax Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: TaxSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}