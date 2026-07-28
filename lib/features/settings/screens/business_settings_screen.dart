import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/business_information_section.dart';

/// ---------------------------------------------------------------------------
/// BusinessSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays business profile settings.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class BusinessSettingsScreen extends StatelessWidget {
  const BusinessSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .businessController;

    return SmartScaffold(
      title: 'Business Information',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BusinessInformationSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}