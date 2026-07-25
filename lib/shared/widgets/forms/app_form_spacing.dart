import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppFormSpacing
/// ---------------------------------------------------------------------------
///
/// Standard spacing constants used throughout SmartShop AI forms.
///
/// Avoid hardcoding:
///
/// SizedBox(height: 24)
///
/// Instead use:
///
/// AppFormSpacing.lg
///
/// This ensures consistent spacing across all forms.
/// ---------------------------------------------------------------------------
class AppFormSpacing {
  AppFormSpacing._();

  // Vertical Spacing
  static const Widget xs = SizedBox(height: 4);
  static const Widget sm = SizedBox(height: 8);
  static const Widget md = SizedBox(height: 16);
  static const Widget lg = SizedBox(height: 24);
  static const Widget xl = SizedBox(height: 32);
  static const Widget xxl = SizedBox(height: 48);

  // Horizontal Spacing
  static const Widget hXs = SizedBox(width: 4);
  static const Widget hSm = SizedBox(width: 8);
  static const Widget hMd = SizedBox(width: 16);
  static const Widget hLg = SizedBox(width: 24);
  static const Widget hXl = SizedBox(width: 32);

  // Default Page Padding
  static const EdgeInsets pagePadding = EdgeInsets.all(24);

  // Card Padding
  static const EdgeInsets cardPadding = EdgeInsets.all(24);

  // Small Card Padding
  static const EdgeInsets compactCardPadding = EdgeInsets.all(16);

  // Field Spacing
  static const Widget fieldGap = SizedBox(height: 20);

  // Section Spacing
  static const Widget sectionGap = SizedBox(height: 32);

  // Page Bottom Padding
  static const Widget bottomGap = SizedBox(height: 48);
}
