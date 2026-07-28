import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// SettingsDivider
/// ---------------------------------------------------------------------------
///
/// Standard spacing divider for Settings screens.
/// ---------------------------------------------------------------------------
class SettingsDivider extends StatelessWidget {
  const SettingsDivider({
    super.key,
    this.height = 32,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}