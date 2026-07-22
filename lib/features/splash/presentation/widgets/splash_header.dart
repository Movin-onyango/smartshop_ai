import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '/features/splash/presentation/widgets/app_logo.dart';
import '../../../../shared/widgets/indicators/app_loading_indicator.dart';

/// Branding content displayed on the splash screen.
///
/// This widget contains:
/// • Application logo
/// • Application name
/// • Tagline
/// • Loading indicator
///
/// It contains no navigation or business logic.
class SplashHeader extends StatelessWidget {
  const SplashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(size: 120),

            AppSpacing.gapXL,

            const Text(
              'SmartShop AI',
              textAlign: TextAlign.center,
              style: AppTypography.headlineLarge,
            ),

            AppSpacing.gapSM,

            Text(
              'AI-Powered Retail Management',
              textAlign: TextAlign.center,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            AppSpacing.gapXXL,

            const AppLoadingIndicator(),

            AppSpacing.gapLG,

            Text(
              'Preparing your workspace...',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}