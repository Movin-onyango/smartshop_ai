import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Temporary application logo.
///
/// This widget will later be updated to display the official
/// SmartShop AI logo without requiring changes to the splash
/// screen or any other screen that uses it.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 120});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Icon(
        Icons.storefront_rounded,
        color: Colors.white,
        size: size * 0.55,
      ),
    );
  }
}
