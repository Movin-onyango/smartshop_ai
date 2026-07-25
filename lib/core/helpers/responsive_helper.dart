import 'package:flutter/material.dart';

/// Responsive helper for SmartShop AI.
///
/// Provides screen information and responsive values based on
/// predefined breakpoints.
///
/// Breakpoints:
/// - Mobile: < 600
/// - Tablet: 600 - 1023
/// - Desktop: >= 1024
class ResponsiveHelper {
  ResponsiveHelper._();

  // ==========================================================
  // Breakpoints
  // ==========================================================

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  // ==========================================================
  // Screen Dimensions
  // ==========================================================

  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  // ==========================================================
  // Device Type
  // ==========================================================

  static bool isMobile(BuildContext context) {
    return screenWidth(context) < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);

    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= tabletBreakpoint;
  }

  // ==========================================================
  // Orientation
  // ==========================================================

  static bool isPortrait(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.landscape;
  }

  // ==========================================================
  // Responsive Values
  // ==========================================================

  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }

    if (isTablet(context)) {
      return tablet ?? mobile;
    }

    return mobile;
  }

  // ==========================================================
  // Grid Columns
  // ==========================================================

  static int gridColumns(BuildContext context) {
    if (isDesktop(context)) {
      return 4;
    }

    if (isTablet(context)) {
      return 3;
    }

    return 2;
  }

  // ==========================================================
  // Dashboard Columns
  // ==========================================================

  static int dashboardColumns(BuildContext context) {
    if (isDesktop(context)) {
      return 4;
    }

    if (isTablet(context)) {
      return 2;
    }

    return 1;
  }

  // ==========================================================
  // Drawer Width
  // ==========================================================

  static double drawerWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 300;
    }

    if (isTablet(context)) {
      return 280;
    }

    return 260;
  }

  // ==========================================================
  // Content Width
  // ==========================================================

  static double maxContentWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 1400;
    }

    if (isTablet(context)) {
      return 900;
    }

    return screenWidth(context);
  }

  // ==========================================================
  // Adaptive Padding
  // ==========================================================

  static EdgeInsets screenPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.all(32);
    }

    if (isTablet(context)) {
      return const EdgeInsets.all(24);
    }

    return const EdgeInsets.all(16);
  }

  // ==========================================================
  // Dialog Width
  // ==========================================================

  static double dialogWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 600;
    }

    if (isTablet(context)) {
      return 500;
    }

    return screenWidth(context) * 0.92;
  }

  // ==========================================================
  // Bottom Navigation
  // ==========================================================

  static bool useBottomNavigation(BuildContext context) {
    return isMobile(context);
  }

  // ==========================================================
  // Side Navigation
  // ==========================================================

  static bool useNavigationRail(BuildContext context) {
    return isTablet(context);
  }

  static bool usePermanentDrawer(BuildContext context) {
    return isDesktop(context);
  }
}
