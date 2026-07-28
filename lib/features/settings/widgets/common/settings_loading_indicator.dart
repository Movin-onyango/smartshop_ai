import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsLoadingIndicator
/// ---------------------------------------------------------------------------
///
/// Loading indicator displayed while settings are loading.
/// ---------------------------------------------------------------------------
class SettingsLoadingIndicator extends StatelessWidget {
  const SettingsLoadingIndicator({
    super.key,
    this.message = 'Loading settings...',
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),

            const SizedBox(height: 20),

            Text(message),
          ],
        ),
      ),
    );
  }
}