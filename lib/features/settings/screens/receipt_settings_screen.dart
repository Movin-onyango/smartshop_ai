import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/settings_provider.dart';
import '../widgets/sections/receipt_section.dart';

/// ---------------------------------------------------------------------------
/// ReceiptSettingsScreen
/// ---------------------------------------------------------------------------
///
/// Displays receipt and printing configuration.
///
/// Used by:
/// • SettingsHomeScreen
/// ---------------------------------------------------------------------------
class ReceiptSettingsScreen extends StatelessWidget {
  const ReceiptSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context
        .watch<SettingsProvider>()
        .receiptController;

    return SmartScaffold(
      title: 'Receipt Settings',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ReceiptSection(
            controller: controller,
          ),
        ),
      ),
    );
  }
}