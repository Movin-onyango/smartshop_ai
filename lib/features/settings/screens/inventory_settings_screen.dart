import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/inventory_section.dart';

/// ---------------------------------------------------------------------------
/// InventorySettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays inventory management configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class InventorySettingsScreen extends StatelessWidget {
  const InventorySettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .inventoryController;

    return SmartScaffold(
      title: 'Inventory Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: InventorySection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}