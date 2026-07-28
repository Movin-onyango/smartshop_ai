import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/currency_section.dart';

/// ---------------------------------------------------------------------------
/// CurrencySettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays currency and number formatting settings.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class CurrencySettingsScreen extends StatelessWidget {
  const CurrencySettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .currencyController;

    return SmartScaffold(
      title: 'Currency Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: CurrencySection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}