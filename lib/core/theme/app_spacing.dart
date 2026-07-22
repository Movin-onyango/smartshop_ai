import 'package:flutter/widgets.dart';

/// Centralized spacing system for SmartShop AI.
///
/// Use these constants instead of hardcoded values to maintain
/// consistent spacing throughout the application.
class AppSpacing {
  AppSpacing._();

  // Base spacing unit
  static const double unit = 4.0;

  // ==========================================================
  // Fixed Spacing
  // ==========================================================

  static const double xs = unit;          // 4
  static const double sm = unit * 2;      // 8
  static const double md = unit * 4;      // 16
  static const double lg = unit * 6;      // 24
  static const double xl = unit * 8;      // 32
  static const double xxl = unit * 12;    // 48
  static const double xxxl = unit * 16;   // 64

  // ==========================================================
  // Screen Padding
  // ==========================================================

  static const EdgeInsets screenPadding = EdgeInsets.all(md);

  static const EdgeInsets screenPaddingHorizontal =
      EdgeInsets.symmetric(horizontal: md);

  static const EdgeInsets screenPaddingVertical =
      EdgeInsets.symmetric(vertical: md);

  // ==========================================================
  // Card Padding
  // ==========================================================

  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  // ==========================================================
  // List Item Padding
  // ==========================================================

  static const EdgeInsets listItemPadding =
      EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // ==========================================================
  // Form Padding
  // ==========================================================

  static const EdgeInsets formPadding = EdgeInsets.all(md);

  // ==========================================================
  // Button Padding
  // ==========================================================

  static const EdgeInsets buttonPadding =
      EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // ==========================================================
  // Common Gaps
  // ==========================================================

  static const SizedBox gapXS = SizedBox(height: xs);
  static const SizedBox gapSM = SizedBox(height: sm);
  static const SizedBox gapMD = SizedBox(height: md);
  static const SizedBox gapLG = SizedBox(height: lg);
  static const SizedBox gapXL = SizedBox(height: xl);
static const SizedBox gapXXL = SizedBox(height: 48);

static const SizedBox gapHorizontalXXL =
    SizedBox(width: 48);

  static const SizedBox gapHorizontalXS =
      SizedBox(width: xs);

  static const SizedBox gapHorizontalSM =
      SizedBox(width: sm);

  static const SizedBox gapHorizontalMD =
      SizedBox(width: md);

  static const SizedBox gapHorizontalLG =
      SizedBox(width: lg);

  static const SizedBox gapHorizontalXL =
      SizedBox(width: xl);
}