import 'package:flutter/material.dart';
import '/features/splash/presentation/widgets/app_logo.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Header displayed at the top of the Login screen.
///
/// This widget provides consistent branding across the
/// authentication module.
///
/// Contents:
/// - SmartShop AI logo
/// - Welcome message
/// - Short description
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppLogo(size: 100),

        AppSpacing.gapXL,

        const Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: AppTypography.headlineMedium,
        ),

        AppSpacing.gapSM,

        Text(
          'Sign in to continue managing your business with SmartShop AI.',
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),

        AppSpacing.gapXL,
      ],
    );
  }
}
